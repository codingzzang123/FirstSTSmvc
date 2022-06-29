<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
	<meta charset="utf-8">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<style>
		img {
		  width: 200px;
		  height: 350px;
		  object-fit: cover;
		}
	</style>
	
</head>
<body>
	
   <div id ="resp"></div>
    
</body>	

		
	<script>
		$(document).ready(function(){
			
				console.log('click');
				let xhr = new XMLHttpRequest();
				xhr.open("GET", "https://api.themoviedb.org/3/discover/movie?api_key=e8b937d602d4a3d3bda9a5be4c9a6a44&&with_watch_providers=337&watch_region=KR&language=ko&page=1", true);
				xhr.onload = ()=>{
						console.log(JSON.parse(xhr.response));
						response = JSON.parse(xhr.response);
						results = response.results;
						resultHTML = '';
						for(let i = 0; i < results.length; i++){
							console.log(results[i]);
							resultHTML += '<img src="https://image.tmdb.org/t/p/original'+ results[i].poster_path + '">'
						};
						console.log(resultHTML);
						document.querySelector('#resp').innerHTML = resultHTML;
						
				}
				xhr.send();
		}); 
		
	</script>
</html>