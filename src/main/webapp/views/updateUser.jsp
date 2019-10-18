<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form:form action="updateUser?userId=${user.userId }" modelAttribute="user" method="post" id="userRegForm">

<table>

<tr>
<td>UserName</td>
<td>
<form:input type="text"  path="userName"></form:input>
</td>
</tr>

<tr>
<td>Password</td>
<td>
<form:input type="password" path="password"></form:input>
</td>
</tr>

<tr>
<td>Email</td>
<td>
<form:input type="text"  path="email"></form:input>
</td>
</tr>

<tr>
<td>PhoneNumber</td>
<td> 
<form:input type="text" path="phoneNo"></form:input>
</td>
</tr>

<tr>
<td>Country</td>
<td> 
<form:select path="country" items="${countriesList}"></form:select>
</td>
</tr>

<tr>
<td>
<input type="submit" value="Update"/>
</td>
</tr>

</table>
</form:form>

<!-- <a href="viewUser" >ViewUsers</a> -->

</body>
</html>