<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book List</title>
<style>
	.img{
			width:140px;
		    height:170px;
		    overflow:hidden;
		    margin:0 auto;
		}
	#image-thumbnail {
	   	width: 100%;
		height: 100%;
		object-fit: contain;
	}
	.content{vertical-align: middle;}
	li{margin-left:3px;}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/main/NavBar.jsp"></jsp:include>
	
	<div class="container mt-5" style="font-size: 20px; font-weight: bold; width: 100%; text-align:center;">
        <h1><b>Book📚</b></h1>
        <table class="table table-striped table-hover mt-4">
            <thead>
                <tr>
                    <th >No</th>
                    <th >Cover</th>
                    <th >Title</th>
                    <th >Writer</th>
                    <th >Publisher</th>
                    <th >Price</th>
                </tr>
            </thead>
            <tbody>
    			<c:choose>
    				<c:when test="${empty ls }">
    					<tr>
            			<td> ❓ 등록된 도서정보가 없습니다. </td>
            			<td></td>
            			<td></td>
            			<td></td>
            			<td></td>
            			</tr>
    				</c:when>
    				<c:when test="${!empty ls }">
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
    				</c:when>
    			</c:choose>        
	        </tbody>
      	</table>
      	
      	<!-- 등록 버튼 -->
      	<div class="row mt-2">
        	<div class="col-lg-10"></div>
        	<div class="col-lg-2 text-end">
         			<a href="add"><button type="button" class="btn btn-success btn-lg">
                		 도서 정보 추가</button></a>
        	</div>
        </div>
        
        
        <!-- 페이징 부분 -->
        <div class="row">
	        <div class="col-lg-11">
	            <nav aria-label="Page navigation example">
	                <ul class="pagination  nav justify-content-center">
	                	<!-- 페이징 << 버튼 -->
	                	<c:choose>
                			<c:when test="${keyword eq null }">
                				<c:choose>
	                				<c:when test="${now ne start }">
			                			<li class="page-item">
								      		<a class="page-link" href="${pageContext.request.contextPath }/books/list?pageNum=${now-1 }" aria-label="Previous">
									        	<span aria-hidden="true">&laquo;</span>
									     	</a>
								     	</li>
			                		</c:when>
			                		<c:otherwise>
			                			<li class="page-item">
								      		<a class="page-link" aria-label="Previous">
									        	<span aria-hidden="true">&laquo;</span>
									     	</a>
								     	</li>
			                		</c:otherwise>
		                		</c:choose>
                			</c:when>
                			<c:when test="${keyword ne null }">
                				<c:choose>
	                				<c:when test="${now ne start }">
			                			<li class="page-item">
								      		<a class="page-link" href="${pageContext.request.contextPath }/books/list?pageNum=${now-1 }&search=${search }&keyword=${keyword }" aria-label="Previous">
									        	<span aria-hidden="true">&laquo;</span>
									     	</a>
								     	</li>
			                		</c:when>
			                		<c:otherwise>
			                			<li class="page-item">
								      		<a class="page-link" aria-label="Previous">
									        	<span aria-hidden="true">&laquo;</span>
									     	</a>
								     	</li>
			                		</c:otherwise>
		                		</c:choose>
                			</c:when>
	                	</c:choose>
			      		
					   
					    <!-- 페이징 블럭 번호  -->
					    <c:forEach begin="${start }" end="${end }" var="i">
					    	<c:choose>
					    		<c:when test="${keyword ne null }">
					    			<c:choose>
					    				<c:when test="${i eq now }">
					    					<li class="page-item active" aria-current="true">
												<a class="page-link" href="${pageContext.request.contextPath }/books/list?pageNum=${i }&search=${search }&keyword=${keyword }">${i }</a>
											</li>
					    				</c:when>
					    				<c:otherwise>
					    					<li class="page-item" aria-current="true">
												<a class="page-link" href="${pageContext.request.contextPath }/books/list?pageNum=${i }&search=${search }&keyword=${keyword }">${i }</a>
											</li>
					    				</c:otherwise>
					    			</c:choose>
					    		</c:when>
					    		<c:otherwise>
					    			<c:choose>
					    				<c:when test="${i eq now }">
					    					<li class="page-item active" aria-current="true">
												<a class="page-link" href="${pageContext.request.contextPath }/books/list?pageNum=${i }">${i }</a>
											</li>
					    				</c:when>
					    				<c:otherwise>
					    					<li class="page-item" aria-current="true">
												<a class="page-link" href="${pageContext.request.contextPath }/books/list?pageNum=${i }">${i }</a>
											</li>
					    				</c:otherwise>
					    			</c:choose>
					    		</c:otherwise>
					    	</c:choose>
					    </c:forEach>
					    
					    <!-- 페이징 >> 버튼 -->
					    <c:choose>
	                		<c:when test="${keyword eq null }">
                				<c:choose>
	                				<c:when test="${now ne end }">
			                			<li class="page-item">
								      		<a class="page-link" href="${pageContext.request.contextPath }/books/list?pageNum=${now+1 }" aria-label="Next">
									        	<span aria-hidden="true">&raquo;</span>
									     	</a>
								     	</li>
			                		</c:when>
			                		<c:otherwise>
			                			<li class="page-item">
								      		<a class="page-link" aria-label="Next">
									        	<span aria-hidden="true">&raquo;</span>
									     	</a>
								     	</li>
			                		</c:otherwise>
		                		</c:choose>
                			</c:when>
                			<c:when test="${keyword ne null }">
                				<c:choose>
	                				<c:when test="${now ne end }">
			                			<li class="page-item">
								      		<a class="page-link" href="${pageContext.request.contextPath }/books/list?pageNum=${now+1 }&search=${search }&keyword=${keyword }" aria-label="Next">
									        	<span aria-hidden="true">&raquo;</span>
									     	</a>
								     	</li>
			                		</c:when>
			                		<c:otherwise>
			                			<li class="page-item">
								      		<a class="page-link" aria-label="Next">
									        	<span aria-hidden="true">&raquo;</span>
									     	</a>
								     	</li>
			                		</c:otherwise>
		                		</c:choose>
                			</c:when>
	                	</c:choose>
					    
					</ul>
	            </nav>
	        </div>
	    </div>
	    
	    
        <!-- 검색 부분 -->
      	<div class="row	mt-5 mb-5">
            <div class="text-center">	
                <form>
					<input type="hidden" name="pageNum" value="1">
                    <select name="search">
                        <option value="title" selected>Title</option>
                        <option value="writer" selected>Writer</option>
                    </select> 
					<input name="keyword" type="text" size="50" value="">
                    <button type="submit">Search</button>
                </form>
            </div>
       	</div>
     </div>
</body>
</html>