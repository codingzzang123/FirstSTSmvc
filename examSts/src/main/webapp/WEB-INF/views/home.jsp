<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=UTF-8"%>
<html>
<head>
	<meta charset="utf-8">
	<title>Home</title>
	<style>
		.clock{
		    font-family:'Lucida Sans'; 
		    text-align: center;
		    position: relative;
		    top: 50px;
		}
		.clock{
		    background-color: rgb(61, 61, 61);  /* 회색 */
		}
		.date{
		    font-size: 45px; 
		    color: rgb(0, 0, 0);  /* 검은색 */
		}
		.time{
		    font-size: 100px;
		    font-weight: bold;
		    color: rgb(179, 21, 171);  /*보라색 */
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
		    setInterval(setClock,1000); //1초마다 setClock 함수 실행
		}
	</script>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

	<div class="clock">
        <div id="time" class="time"></div>
        <div id="date" class="date"></div>
    </div>
    
    
</body>
</html>
