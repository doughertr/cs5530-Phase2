<%@page import="cs5530.*" import="java.util.*,java.lang.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View All Listed TH's</title>
</head>
<body style="background-color:powderblue;">
<% User u = User.class.cast(session.getAttribute("User")); 
ArrayList<TH> properties = TH.getAllTH();

String indexStr = request.getParameter("indexValue");

if(indexStr == null)
{%>
	
	<form action="ViewAllListedTH.jsp">
	<p>Viewing TH Listings Owned By <%=u.login %> </p>
	<ol>
	<%
	for(TH property : properties)
	{ %>
		<li> <%=property.toString()%></li>
	<%
	} %>
	</ol>

	Enter the index for the TH you want to view:
	<input type=text name="indexValue" length=5>
    <input type="submit" value="Update" />
    <BR><BR>
	</form>
	<form action="THBrowsingMenu.jsp">
    <input type="submit" value="Go Back" />
	</form>
	
<%} 
else
{
	int index = Integer.parseInt(indexStr);	
	TH home = properties.get(index - 1);
	
	session.setAttribute("TH",home);
	response.sendRedirect(response.encodeRedirectURL("SingleTHMenu.jsp"));
}
%>
</body>
</html>