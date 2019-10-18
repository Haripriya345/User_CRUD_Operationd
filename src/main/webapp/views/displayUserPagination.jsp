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
<h1>Existing Users In DB</h1>

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
		<font color="blue">
		<c:if test="${cp!=1}">
		<a href="viewUserPagination?pn=${cp-1 }">Previous</a>
		</c:if>
		
		<c:forEach begin="1" end="${tp}" var="i">
		
		<c:choose>
			<c:when test="${cp==i }">
			<c:out value="${i}"/>
		</c:when>
		<c:otherwise>
			<a href="viewUserPagination?pn=${i}"><c:out value="${i}"/></a>
		</c:otherwise>
		</c:choose>
		
		</c:forEach>
		
		<c:if test="${cp!=tp}">
		<a href="viewUserPagination?pn=${cp+1}">Next</a>
		</c:if>
</font>		
<br><br>
<a href="welcome"><font color="blue">Add New User</font></a>
</body>
</html>