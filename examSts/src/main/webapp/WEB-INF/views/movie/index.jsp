<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
  
<title>Insert title here</title>

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
	<c:set var="Image_URL" value="https://image.tmdb.org/t/p/original"/>
	
	
	<section class="awards">
	  <div>
	  	<span>What's Popular 🎞</span>
	  	<button disabled>Movie</button>
	  </div>
      <div class="inner">
        <div class="swiper">
          <div class="swiper-wrapper">
          	<c:forEach var="release_date" begin="0" end="19" step="1" items="${ls}"> 
            <div class="swiper-slide">
              <img src="${Image_URL }${release_date.poster_path }"><br>
              <span>${release_date.original_title }</span>
            </div>
            </c:forEach>
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
	
	<br><br>
	
	<section class="awards">
	  <div>
	  	<span>What's Popular 🎞</span>
	  	<button disabled>Tv</button>
	  </div>
      <div class="inner">
        <div class="swiper">
          <div class="swiper-wrapper">
          	<c:forEach var="release_date" begin="0" end="19" step="1" items="${ls}"> 
            <div class="swiper-slide">
              <img src="${Image_URL }${release_date.poster_path }"><br>
              <span>${release_date.original_title }</span>
            </div>
            </c:forEach>
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
      new Swiper('.awards .swiper', {
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
    </script>


</body>
</html>