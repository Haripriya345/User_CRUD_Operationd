<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script>
		function confirmDelete(){
			var status= confirm("Are u sure, u want to delete");
			if(status){
				return true;
			} else{
				return false;
			}
		}
</script>
</head>
<body>
<h1><font color="blue">Existing Users In DB</font></h1>

        <table border=1>
			<tbody>
			
			<tr><th>UserName</th><th>Email</th><th>PhoneNo</th> <th>Country</th><th>Operarions</th></tr> 
				
              <c:forEach  items="${usersList}" var="user" varStatus="index">
                   <tr>
                    
                    
                    <td>${user.userName}</td>
                    <td>${user.email}</td>
                    <td>${user.phoneNo}</td>
                    <td>${user.country}</td>
                    <td><a href="editUser?userId=${user.userId }">Edit</a> &nbsp &nbsp
                    <a href="deleteUser?userId=${user.userId}" onclick="return confirmDelete()">Delete</a></td>
                    
          		   </tr>
            </c:forEach> 
			</tbody>
		</table>
		
<br>
<a href="welcome"><font color="blue">Add New User</font></a>
</body>
</html>