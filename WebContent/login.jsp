<%@ page language="java" import="cs5530.*" %>
<%@ page language="java" import="cs5530.User" %>
<%@ page language="java" import="cs5530.Connector" import="java.io.Serializable"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Air B&B Login</title>

<script LANGUAGE="javascript">

function check_all_fields(form_obj){
	if( form_obj.nameValue.value == "")
	{
		alert("Please enter a username");
		return false;
	}
	else if(form_obj.passwordValue.value == "")
	{
		alert("Please enter a password");
		return false;
	}
	return true;
}

</script> 

</head>
<body style="background-color:powderblue;">
<%
String userName = request.getParameter("nameValue");
String password = request.getParameter("passwordValue");
if( userName == null && password == null ){
%>
	<form name="userCredentials" method=get onsubmit="return check_all_fields(this)" action="login.jsp">
		Enter User Name:
		<input type=text name="nameValue" length=10>
		<BR><BR>
		Enter Password:
		<input type=text name="passwordValue" length=10>
		<BR><BR>
		<button type=submit> Login </button>
		<BR><BR>
	</form>
	<form action="registerUser.jsp">
    <input type="submit" value="Sign Up" />
	</form>
<%
} 
else{
	Connector con = new Connector();
	User user = User.validateUser(userName, password);
	
	if(user != null)
	{
		session.setAttribute("User",user);
		response.sendRedirect(response.encodeRedirectURL("MainUserMenu.jsp"));
	}
	else
	{
		%>
		<script>alert("failed to login");</script>
		<%
		response.sendRedirect("login.jsp");
	}

}%>

</body>
</html>