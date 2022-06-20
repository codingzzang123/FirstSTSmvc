<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	  
	<c:forEach var="vo" items="${vo }">
		<h1>id = ${vo.id }</h1><br>
		<h1>name = ${vo.name }</h1><br>
		<h1>birth = ${vo.birth }</h1><br>
	</c:forEach>
</body>
</html>