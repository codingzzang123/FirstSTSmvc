<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
	<meta charset="utf-8">
	<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
	
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
	
	
	<style>
		img {
		  width: 200px;
		  height: 350px;
		  object-fit: cover;
		}
		.awards {
        	background-color: #ffffff;
        }

        .awards .inner {
          padding: 40px 0;
        }

        .awards .swiper {
          width: 100%;
          height: 400px;
        }

        .awards .swiper-prev,
        .awards .swiper-next {
          width: 42px;
          height: 42px;
          border: 2px solid rgb(206, 5, 5);
          border-radius: 50%;
          outline: none;
          color: rgb(206, 5, 5);;
          opacity: 0.3;
          cursor: pointer;
          display: flex;
          justify-content: center;
          align-items: center;
          position: absolute;
          top: 0;
          bottom: 0;
          margin: auto;
        }

        .awards .swiper-prev {
          left: -100px;
        }

        .awards .swiper-next {
          right: -100px;
        }
        .awards .swiper-prev:hover,
        .awards .swiper-next:hover {
          background-color: #fff;
          color: rgb(129, 163, 237);
        }
	</style>
</head>
<body>
	
   <!-- <div id ="resp"></div> -->
   
   <section class="awards">
	  <div>
	  	<span>What's Popular 🎞</span>
	  	<button disabled>Tv</button>
	  </div>
      <div class="inner">
        <div class="swiper">
          <div class="swiper-wrapper" id="movieSlide">
	            <!-- 영화 20개가 들어갈 예정  -->
          </div>
        </div>
        <div class="swiper-prev">
          <div class="material-icons">arrow_back</div>
        </div>
        <div class="swiper-next">
          <div class="material-icons">arrow_forward</div>
        </div>
      </div>
    </section>
    


		
	<script>
		
	var swiper = new Swiper('.awards .swiper', {
        direction: 'horizontal',
        autoplay: true,
        loop: false,
        spaceBetween: 30,
        slidesPerView: 7,
        navigation: {
          prevEl: '.awards .swiper-prev',
          nextEl: '.awards .swiper-next'
        }
      });
		
		$(document).ready(function(){
				
				let xhr = new XMLHttpRequest();
				xhr.open("GET", "https://api.themoviedb.org/3/discover/movie?api_key=e8b937d602d4a3d3bda9a5be4c9a6a44&&with_watch_providers=337&watch_region=KR&language=ko&page=1", true);
				xhr.onload = ()=>{
						console.log(JSON.parse(xhr.response));
						response = JSON.parse(xhr.response); 
						results = response.results; //results = movie에 대한 json데이터
						resultHTML = [];
						for(let i = 0; i < results.length; i++){
							console.log(results[i]);
							
							resultHTML.push( 
								'<div class="swiper-slide">'+
									'<img src="https://image.tmdb.org/t/p/original'+ results[i].poster_path + '"><br>'+
										'<span>'+ results[i].original_title +'</span></div>');
							
							
						};
						//document.querySelector('#movieSlide').innerHTML = resultHTML;
						swiper.appendSlide(resultHTML);
						swiper.update()
				}
				xhr.send();
		}); 
		
	</script>
</body>	
</html>