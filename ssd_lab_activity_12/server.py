from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_login import (LoginManager, login_manager, login_user, logout_user, login_required, UserMixin)
import requests
from flask import request

app=Flask(__name__)

app.config['SQLALCHEMY_DATABASE_URI']='sqlite:///user.db'
app.config['SECRET_KEY']='secretkey'

db=SQLAlchemy(app)
login_manager=LoginManager()

login_manager.init_app(app)

class User(UserMixin,db.Model):
    name=db.Column(db.String(80),nullable=False)
    email=db.Column(db.String(80),primary_key=True)
    password=db.Column(db.String(80),nullable=False)
    def __init__(self,name,email,password):
        self.name=name
        self.email=email
        self.password=password
        
with app.app_context():
    db.create_all()

@login_manager.user_loader
def load_user(user_id):
    return User.query.get(int(user_id))

def signup():
    name=input("Enter name:")
    email=input("Enter email:")
    password=input("Enter password:")
    payload={
        "name":name,
        "email":email,
        "password":password
    }
    resp=requests.post("http://127.0.0.1:8000/user/signup", json=payload).content.decode()
    print(resp)

@app.route('/user/signup', methods=['POST'])
def user_signup():
    if(request.method=='POST'):
        req=request.get_json()
        name=req['name']
        email=req['email']
        password=req['password']
        check_user=User.query.filter_by(email=email).first()
        if(check_user is not None):
            return "User already exists!"
        else:
            newUser=User(name,email,password)
            db.session.add(newUser)
            db.session.commit()
            return "User signed up successfully!"

signup()

if __name__=='__main__':
    app.run(hosts="127.0.0.1", port="8000",debug=True)