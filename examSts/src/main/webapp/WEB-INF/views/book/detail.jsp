<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<title>Insert title here</title>
<style>
.select_img {
	width: 380px;
	height: 500px;
	overflow: hidden;
	margin: 0 auto;
}

#image-thumbnail {
	width: 100%;
	height: 100%;
	object-fit: contain;
}

.content {
	padding-left: 5%;
	horizontal-align: middle; 
}
</style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/main/NavBar.jsp"></jsp:include>

	<div class="container mt-5 mb-5"
		style="font-size: 20px; font-weight: bold; width: 100%;">
		<h1>
			<b>${ls.bookname }🔎</b>
		</h1>
		<br> <br>
		<form method="post" enctype="multipart/form-data" name="createForm">
			<table class="table table-borderless align-middle">
				<tr>
					<td rowspan="6" width="200" height="250">
						<div class="select_img">
							<img id="image-thumbnail"
								src="<c:url value="/resources/bookImg/${ls.img }"/>" />
						</div>
					</td>
					<th style="padding-left: 5%;">BOOK ISBN</th>
					<td><input class="form-control" type="text"
						value="${ls.isbn }" id="isbn" disabled></td>
				</tr>

				<tr>
					<th style="padding-left: 5%;"><b>도서명</b></th>
					<td><input class="form-control" type="text"
						value="${ls.bookname }" disabled></td>
				</tr>
				<tr>
					<th style="padding-left: 5%;">저자</th>
					<td><input class="form-control" type="text"
						value="${ls.writer }" disabled></td>
				</tr>
				<tr>
					<th style="padding-left: 5%;">출판사</th>
					<td><input class="form-control" type="text"
						value="${ls.publisher }" disabled></td>
				</tr>
				<tr>
					<th style="padding-left: 5%;">도서 가격</th>
					<td><input class="form-control" type="text"
						value="${ls.price }" disabled></td>
				</tr>
				<tr>
					<th style="padding-left: 5%;">이미지</th>
					<td><input class="form-control" type="file" value="${ls.img }"
						disabled id="gdsImg"></td>
				</tr>
				<tr>
					<th style="padding-left: 13%;"><b>책소개</b></th>
					<td colspan="2"><textarea class="form-control" rows="10"
							cols="100" style="resize: none;" disabled>${ls.info }</textarea></td>
				</tr>
			</table>

			<div class="row mt-2">
				<div class="col-lg-10"></div>
				<div class="col-lg-2 text-end">
					<a href="javascript:window.history.back();"><button type="button" class="btn btn-danger btn-lg">뒤로 가기</button></a>
				</div>
			</div>
		</form>
	</div>
</body>
</html>