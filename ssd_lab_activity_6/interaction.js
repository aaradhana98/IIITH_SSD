document.addEventListener('keyup', checkUsername)
document.addEventListener('blur', checkPassword)

function checkUsername(event){
	var username=document.forms["serverForm"]["serverUsername"].value;
	var capital=/[A-Z]/;
	var number=/[0-1]/;
	var checkCapital=capital.test(username);
	var checkNumber=number.test(username);
	if(!(checkCapital && checkNumber))
		document.getElementById("errorMsg").innerHTML="Invalid Username";
	else
		document.getElementById("errorMsg").innerHTML="";
}

function checkPassword(event){
	var password1=document.forms["serverForm"]["serverPassword"].value;
	var password2=document.forms["serverForm"]["confirmPassword"].value;
	if(password1!=password2)
		document.getElementById("errorMsg2").innerHTML="Check your Password";
	else
		document.getElementById("errorMsg2").innerHTML="";
}

function validateForm(){
	var name=document.forms["serverForm"]["managerName"].value;
	var email=document.forms["serverForm"]["groupEmail"].value;
	var username=document.forms["serverForm"]["serverUsername"].value;
	var lead=document.forms["serverForm"]["team_lead"].value;
	var password1=document.forms["serverForm"]["serverPassword"].value;
	var password2=document.forms["serverForm"]["confirmPassword"].value;
	if(password1==password2)
		alert("Name:"+name+"\nEmail:"+email+"\nUsername:"+username+"\nTeam Lead:"+lead);
	else
		alert("Passwords dont match!");
}

function myFunction() {
   var element = document.body;
   element.classList.toggle("dark-mode");
}

	