<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }
      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      	body {
		  height: 100%;
		}
		body {
		  display: flex;
		  align-items: center;
		  padding-top: 40px;
		  padding-bottom: 40px;
		  background-color: #f5f5f5;
		}
		
		.form-signin {
		  width: 100%;
		  max-width: 330px;
		  padding: 15px;
		  margin: auto;
		}
		
		.form-signin .checkbox {
		  font-weight: 400;
		}
		
		.form-signin .form-floating:focus-within {
		  z-index: 2;
		}
		
		.form-signin input[type="email"] {
		  margin-bottom: -1px;
		  border-bottom-right-radius: 0;
		  border-bottom-left-radius: 0;
		}
		
		.form-signin input[type="password"] {
		  margin-bottom: 10px;
		  border-top-left-radius: 0;
		  border-top-right-radius: 0;
		}
		.modal{
			display: none;
		}
    </style>
<title>Login</title>
</head>
	<body>
		
	<body class="text-center">
		<main class="form-signin" style="margin-top:150px;">
		  <form action="#" method="post" name="LoginForm"> 
		    <h1 class="h3 mb-3 fw-normal">Please sign in</h1>
		
		    <div class="form-floating" style="margin-top:30px;">
	    	  <input type="text" name="id" class="form-control" id="floatingInput" placeholder="Id"> 
		      <label for="floatingInput">ID</label>
		    </div>
		    <div class="form-floating" style="margin-top:5px;">
		      <input type="password" name="pw" class="form-control" id="floatingPassword" placeholder="Password">
		      <label for="floatingPassword">Password</label>
		    </div>
			
		    <div class="checkbox mb-3">
		      <label>
		      	<input type="checkbox" name="remember" value="remember"> Remember me
		      </label>
		    </div>
		    <input type="button" value="Login" onclick="inputCheck()" class="w-100 btn btn-lg btn-primary">
		    <a href="<c:url value="/member/join"/>">
		    	<button class="w-100 btn btn-lg btn-primary" type="button" style="margin-top:10px;">Sign up</button>
		    </a>
		    <div style="margin-top:15px;">
			    <span class='text-center'>
			    	<a href="#" class="text-sm">비밀번호 찾기</a>
			    	<a href="<c:url value="/main" />" class="text-sm">메인으로 이동</a>
			    </span>
		    </div>
		    <div> <p class="mt-5 mb-3 text-muted">&copy; made by hosun</p></div>
		  </form>
		</main> 
	
	
	<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->
	<!-- 아래는 모달창 내용 입니다.  -->
	<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->
	
	
	<!-- ID에 대한 모달 -->
	<div class="modal" id="IdModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"><b>Please try again</b></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <h5>아이디를 입력해 주세요.</h5>
                </div>
                <div class="modal-footer">
                    <button type="button" id="ModalCloseId" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
	
	<!-- PASSWORD에 대한 모달 -->
	<div class="modal" id="pwModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"><b>Please try again</b></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <h5>비밀번호를 입력해 주세요.</h5>
                </div>
                <div class="modal-footer">
                    <button type="button" id="ModalClosePw" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
	
	<script>
		const myID = document.getElementById('IdModal');
	    const my2 = document.getElementById('closeModal');
	    const myPW = document.getElementById('pwModal');
	    
	    function IdModal(){
	    	myID.style.display = 'block';
	    }
	    function PwModal(){
	    	myPW.style.display = 'block';
	    }
	    
	    ModalCloseId.onclick = function() {
	    	myID.style.display = 'none';
	    }
	    ModalClosePw.onclick = function() {
	    	myPW.style.display = 'none';
	    }
	
	    function inputCheck(){
		    if(document.LoginForm.id.value==""){
		    	IdModal();
		        document.regForm.id.focus();
		        return;
		    }
		    if(document.LoginForm.pw.value==""){
		    	PwModal();
		        document.regForm.pw.focus();
		        return;
		    }
		    
		    document.LoginForm.submit();
		}
	    
    </script>
	</body>
</html>