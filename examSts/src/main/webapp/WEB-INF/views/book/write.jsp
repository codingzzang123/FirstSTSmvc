<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<title>Insert title here</title>
	<style>
		
		.select_img{
			width:380px;
		    height:500px;
		    overflow:hidden;
		    margin:0 auto;
		}
		#image-thumbnail {
		    width:100%;
		    height:100%;
		    object-fit:cover;
		}
	</style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/main/NavBar.jsp"></jsp:include>
	<div class="container mt-5 mb-5" style="font-size: 20px; font-weight: bold; width: 100%;">
		<h1><b>도서 정보 추가 📝</b></h1><br><br>
		<form:form modelAttribute="writeForm" method="post" enctype="multipart/form-data">
		
			<table class="table table-borderless align-middle">
		         <tr>  
		            <td rowspan="6" width="200" height="250">
		            	<div class="select_img"><img src="" id="image-thumbnail"/></div>
		            </td>
		            <th style="padding-left: 5%;"><b>BOOK ISBN</b></th>
		            <td><form:input path="isbn" class="form-control" type="text" id="isbn" />
		            	<form:errors path="isbn" />
	            	</td>
		         </tr>
		         
		         <tr>
		            <th style="padding-left: 5%;"><b>도서명</b></th>
		            <td><input class="form-control" type="text" name="bookname">
		            	<form:errors path="bookname"/>
		            </td>
		         </tr>
		         <tr>
		            <th style="padding-left: 5%;"><b>저자</b></th>
		            <td><input class="form-control" type="text" name="writer"><form:errors path="writer"/></td>
		         </tr>
		         <tr>
		            <th style="padding-left: 5%;"><b>출판사</b></th>
		            <td><input class="form-control" type="text" name="publisher"><form:errors path="publisher"/></td>
		         </tr>
		         <tr>
		            <th style="padding-left: 5%;"><b>도서 가격</b></th>
		            <td><form:input path="price" class="form-control" type="text" /><form:errors path="price"/></td>
		         </tr>
		         <tr>
		            <th style="padding-left: 5%;"><b>이미지</b></th>
		            <td><input class="form-control" type="file" name="img" id="gdsImg"><form:errors path="img"/></td>
		         </tr>
		         <tr>
		            <th style="padding-left: 13%;"><b>책소개</b></th>
		            <td colspan="2"><textarea class="form-control" name="info" rows="10" cols="100" style="resize: none;"></textarea><form:errors path="info"/></td>
		         </tr>
		     </table>
		
			<div class="row mt-2">
	        	<div class="col-lg-8"></div>
	        	<div class="col-lg-2 text-end">
	         			<a href="javascript:window.history.back();"><button type="button" class="btn btn-danger btn-lg">
	                		 뒤로 가기</button></a>
	        	</div>
	        	<div class="col-lg-2 text-end">
	         			<button type="submit" class="btn btn-success btn-lg">
	                		 도서 정보 추가</button>
	        	</div>
        	</div>
	    </form:form>
	</div>
	<script>
	
	$("#gdsImg").change(function(){
		   if(this.files && this.files[0]) {
		    var reader = new FileReader;
		    reader.onload = function(data) {
		     $(".select_img img").attr("src", data.target.result).width(350);        
		    }
		    reader.readAsDataURL(this.files[0]);
		   }
	});
	
	
	 $("#isbn").blur(function() {
			// id = "id_reg" / name = "userId"
			//var id = $('#id').val();
			$.ajax({
				url:'./makeIsbn', //Controller에서 요청 받을 주소
	            type:'post', //POST 방식으로 전달
				success : function(data) {
					console.log("isbn : "+ data);							
						$("#isbn").attr("value", data);
					},error : function() {
						console.log("실패");
					}
				});
			});
    </script>
</body>
</html>