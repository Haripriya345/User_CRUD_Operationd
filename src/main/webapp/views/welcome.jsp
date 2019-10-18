<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>
.error {
	color: #FF0000
}
</style>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script
	src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<script>
	$(function() {
		$('form[id="userRegForm"]').validate({
			rules : {
				userName : 'required',
				password : 'required',
			    /* email : {
					required : true,
					email : true
				}  */
				email :  'required', 
				phoneNo : 'required',
			},
			messages : {
				userName : 'Please enter username',
				password : 'please enter password',
				email : 'Please enter valid email',
				phoneNo : 'please enter phone number',
			},
			submitHandler : function(form) {
				form.submit();
			}
		});
	});
</script>

</head>
<body>

<!-- <p><font color= "green" >Registration Successful</font></p> -->
<h2><font color="blue">Register Here</font></h2>
<form:form action="submitForm" modelAttribute="user" method="post" id="userRegForm">

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
<input type="reset" value="Reset"/>
<input type="submit" value="Submit"/>
</td>
</tr>

</table>
</form:form>

<a href="viewUser"><font color="blue">ViewUsers</a></font><br>
<a href="viewUserPagination?pn=1"><font color="blue">ViewUsersByPagination</a></font>

</body>
</html>