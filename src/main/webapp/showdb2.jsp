<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
<html>
<head>
<title>SELECT Operation</title>
</head>
<body>

String host = System.getenv("OPENSHIFT_MYSQL_DB_HOST");
String port = System.getenv("OPENSHIFT_MYSQL_DB_PORT");
String usr = System.getenv("OPENSHIFT_MYSQL_DB_USERNAME");
String passwd = System.getenv("OPENSHIFT_MYSQL_DB_PASSWORD");

<%=host%>
<%=usr%>
 <% out.println(passwd);%>
 
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://" + host + "/jbossas"
     user="+usr"  password="+passwd"/>
 
<sql:query dataSource="${snapshot}" var="result">
SELECT * from Employees;
</sql:query>
 
<table border="1" width="100%">
<tr>
   <th>Emp ID</th>
   <th>First Name</th>
   <th>Last Name</th>
   <th>Age</th>
</tr>
<c:forEach var="row" items="${result.rows}">
<tr>
   <td><c:out value="${row.id}"/></td>
   <td><c:out value="${row.first}"/></td>
   <td><c:out value="${row.last}"/></td>
   <td><c:out value="${row.age}"/></td>
</tr>
</c:forEach>
</table>
 
</body>
</html>
