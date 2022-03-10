<%@ page import="com.PAF.Item"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<% 
 //Insert item---------------------------------- 
if (request.getParameter("itemCode") != null) 
 { 
 Item itemObj = new Item(); 
 String stsMsg = itemObj.insertItem(request.getParameter("itemCode"), 
 request.getParameter("itemName"), 
 request.getParameter("itemPrice"), 
 request.getParameter("itemDesc")); 
 session.setAttribute("statusMsg", stsMsg); 
 } 
%>
 <%
	String idOne=request.getParameter("idOne") ;
 	String idTwo=request.getParameter("newName") ;
 	String idThree=request.getParameter("newPrice") ;
 	String idFour=request.getParameter("newDesc") ;
 	
 	Item myItem=new Item();
 	myItem.update(idOne, idTwo);

 %>
 	
 <%
 Item myItemTwo=new Item();
 String x=request.getParameter("deleteOne");
	myItemTwo.delete(x);
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Items Management</title>
</head>
<body>
<h1>Items Management</h1>
<form method="post" action="items.jsp">
 Item code: <input name="itemCode" type="text"><br> Item 
 name: <input name="itemName" type="text"><br> Item price: 
 <input name="itemPrice" type="text"><br> Item 
 description: <input name="itemDesc" type="text"><br> <input
 name="btnSubmit" type="submit" value="Save">
 <br>
 </form>
 <form method="post" action="items.jsp">
 <input  value="Enter item id to uodate" name="idOne"><br>

 <input type="text" value="Enter new Item name" name="newName"><br>
 <input type="text" value="Enter new item price" name="newPrice"><br>
 <input type="text" value="Enter new item description" name="newDesc"><input type="submit" value="update">
 <h1>Hello</h1>
</form>


<form method="post" action="items.jsp">
 <input  value="Enter item id to delete" name="deleteOne"><br>

 <input type="submit" value="delete">
 
</form>

<%
 out.print(session.getAttribute("statusMsg")); 
%>
<br>
<%
 Item itemObj = new Item(); 
 out.print(itemObj.readItems()); 

%>
</body>
</html>
