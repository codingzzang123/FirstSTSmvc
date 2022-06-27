<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		
		.clock{
		    font-family:'Lucida Sans'; 
		    text-align: center;
		    position: relative;
		    top: 50px;
		}
		
		.date{
			font-family: Arial, Helvetica, sans-serif;
		    font-size: 45px; 
		    color: rgb(0, 0, 0);  /* 검은색 */
		    visibility:hidden;
		}
		.time{
		    font-size: 100px;
		    font-weight: bold;
		    color: rgb(0, 0, 0);  /*보라색 */
		}
	</style>
	<script>
		function setClock(){
		    var dateInfo = new Date(); 
		    var hour = modifyNumber(dateInfo.getHours());
		    var min = modifyNumber(dateInfo.getMinutes());
		    var sec = modifyNumber(dateInfo.getSeconds());
		    var year = dateInfo.getFullYear();
		    var month = dateInfo.getMonth()+1; //monthIndex를 반환해주기 때문에 1을 더해준다.
		    var date = dateInfo.getDate();
		    document.getElementById("time").innerHTML = hour + ":" + min  + ":" + sec;
		    document.getElementById("date").innerHTML = year + "년 " + month + "월 " + date + "일";
		}
		function modifyNumber(time){
		    if(parseInt(time)<10){
		        return "0"+ time;
		    }
		    else
		        return time;
		}
		window.onload = function(){
		    setClock();
		    setInterval(setClock,1000); 
		}
	</script>
</head>
<body>
	<jsp:include page="NavBar.jsp"></jsp:include>
	<div class="p-5 mb-4 bg-light rounded-3 text-center">
		<div class="clock">
	        <div id="time" class="time"></div>
	        <div id="date" class="date"></div>
    	</div>
        <div class="container-fluid py-5 mt-5">
            
       		<p class="fs-4">Login is Essential ⛔ </p><br>
     		<p class="fs-4">
       			<a href="${pageContext.request.contextPath }/member/login"><button class="btn btn-dark btn-lg" type="button" style="font-weight: bold;">LOGIN</button></a>
       			<a href="${pageContext.request.contextPath }/member/join"><button class="btn btn-primary btn-lg" type="button" style="font-weight: bold;">JOIN</button></a>
       		</p>
      	</div>
	</div>
</body>
</html>