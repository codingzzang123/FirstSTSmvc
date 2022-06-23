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
<h1>요청 결과 = ${test }</h1><br><br><br>
<c:forEach var="ls" items="${ls }">
	    					<tr>
					            <th class="content">${ls.no }</th>
						        <td class="content"><img class="img" src="<c:url value="/resources/bookImg/${ls.img }"/>" /></td>
						        <td class="content"><a href="detail/${ls.no }">${ls.bookname }</a></td>
						        <td class="content">${ls.writer }</td>
						        <td class="content">${ls.publisher }</td>
						        <td class="content">${ls.price }</td>
					        </tr>
    					</c:forEach>
</body>
</html>