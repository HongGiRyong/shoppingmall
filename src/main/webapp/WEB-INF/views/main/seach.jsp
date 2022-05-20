<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!--JSTL 사용-->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<meta charset="UTF-8">
<title>shoppingmall</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap"
	rel="stylesheet">
<style>
.container-fluid {
	font-family: 'Dokdo', cursive;
}

.row li {
	list-style: none;
	float: left;
	padding: 13px 15px 0 10px;
	font-weight: 900;
	cursor: pointer;
}
</style>
</head>
<body>
	<nav class="navbar navbar-light bg-success p-2 text-dark bg-opacity-25"
		class="border border-info">
		<div class="container-fluid">
			<a class="navbar-brand"><h3 class="text-success">훈남 3인방 쇼핑몰</h3></a>
			<ul class="nav">
				<li
					class="nav-item btn d-inline-flex align-items-center rounded collapsed">
					<a class="nav-link active" aria-current="page" href="/web/jmain">Home</a></li>
		 
				<li
					class="nav-item btn d-inline-flex align-items-center rounded collapsed">
					<a class="nav-link" href="/web/member/readmypage">MyPage</a></li>
				<c:if test="${admin == 0 || loginuser == null }">
				<li
					class="nav-item btn d-inline-flex align-items-center rounded collapsed">
					<a class="nav-link" href="/web/basket">Basket</a></li>
				</c:if>
				
				<li
					class="nav-item btn d-inline-flex align-items-center rounded collapsed">
					<a class="nav-link disabled">고객센터</a></li>
			</ul>
			<form:form class="d-flex" commandName="cmd" action="/web/jmain"
				method="POST">
				<label> <select class="form-select" name="itemcatecode"
					style="width: 110px; height: 62px;"
					aria-label="Default select example">
						<option value="F">전체</option>
						<option value="A">상의</option>
						<option value="B">하의</option>
						<option value="C">신발</option>
						<option value="D">악세서리</option>
						<option value="E">모자</option>

				</select>
				</label>

				<input class="form-control me-2" type="search"
					placeholder="Search" aria-label="Search" list="new"
					autocomplete="off" name="keyword">
				<button class="btn btn-outline-success" type="submit">검색</button>
				<c:if test="${cookie != null}">
					<datalist id="new">
						<c:forEach var="cookies" items="${cookies}">
							<c:if test="${cookies != \"JSESSIONID\"}">
								<option value="${cookies}">
							</c:if>
						</c:forEach>
					</datalist>
				</c:if>
			</form:form>
		</div>
	</nav>


	<nav id="sidebarMenu"
		class="col-md-3 col-lg-2 d-md-block sidebar collapse">
		<div class="position-sticky pt-3">
			<ul class="nav flex-column">
				<c:if test="${loginuser == null}"> 
					<li class="nav-item"><a class="nav-link active btn d-inline-flex align-items-center rounded"
						aria-current="page" href="/web/member/login"> <span data-feather="home"></span>
							로그인
					</a></li>
					<li class="nav-item"><a class="nav-link btn d-inline-flex align-items-center rounded" href="/web/member/register"> <span
							data-feather="file"></span> 회원가입
					</a></li>
				</c:if>
				<c:if test="${loginuser != null}"> 
				
							<li style = "color: blue"> ${name}님 환영합니다.<li>
					
				<li class="nav-item"><a class="nav-link active btn d-inline-flex align-items-center rounded"
						aria-current="page" href="/web/member/logout"> <span data-feather="home"></span>
							로그아웃
					</a></li>
				</c:if>
			</ul>

			<h6
				class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
				<span>카테고리</span> <a class="link-secondary" href="#"
					aria-label="Add a new report"> <span data-feather="plus-circle"></span>
				</a>
			</h6>
			<ul class="nav flex-column mb-2">
				<li class="nav-item "><a
					class="nav-link btn d-inline-flex align-items-center rounded"
					href="/web/cate/A"> <span data-feather="file-text"></span> 상의
				</a></li>
				<li class="nav-item"><a
					class="nav-link btn d-inline-flex align-items-center rounded"
					href="/web/cate/B"> <span data-feather="file-text"></span> 하의
				</a></li>
				<li class="nav-item"><a
					class="nav-link btn d-inline-flex align-items-center rounded"
					href="/web/cate/C"> <span data-feather="file-text"></span> 신발
				</a></li>
				<li class="nav-item"><a
					class="nav-link btn d-inline-flex align-items-center rounded"
					href="/web/cate/D"> <span data-feather="file-text"></span> 악세서리
				</a></li>
				<li class="nav-item"><a
					class="nav-link btn d-inline-flex align-items-center rounded"
					href="/web/cate/E"> <span data-feather="file-text"></span> 모자
				</a></li>
			</ul>
			<c:if test="${loginuser != null && admin == 1 }">  
				<ul class="nav flex-column mb-2">	
					<li class="nav-item "><a class="nav-link btn d-inline-flex align-items-center rounded" href="/web/admin"> <span
						data-feather="file-text"></span> 관리자 페이지
					</a></li>			
				</ul>
			</c:if>
		</div>
		

	</nav>
	<div class="row"
		style="margin-left: 330px; margin-top: -300px; text-align: center; position: relative; left: 10%; transform: translateX(-15%);">
		<h2 class="text-info" style="text-align: left;">검색 결과</h2>
		<c:forEach var="list" items="${search}">

		<div class="col-lg-2 col-md-6">
				<div class="card" style="width: 15rem;">
					<!-- 정보보기 버튼 대신 화면으로 링크건거 -->
					<a href="/web/item/${list.itemcode}"><img
						src="<c:url value="/image/${list.itemthumbimage}"/>"
						class="card-img-top" alt="..." style="width: 250px; height: 300px"></a>
					<div class="card-body">
						<h5 class="card-title">${list.itemname}</h5>
						<!-- 포맷써서 가격 형식 변경 -->
						<p><fmt:formatNumber pattern="#,###" value="${list.itemprice}"/>원</p>
					</div>
				</div>
			</div>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</c:forEach>
	</div>
	
	<div style="width:600px; text-align:center; margin-top:10px; margin-left:650px;">
		<c:forEach var="i" begin="1" end="${lastpage}">
		 	<a href="search?vpage=${i}">${i}</a>
		</c:forEach>
	</div>
	
	<div class="container">
		<footer class="py-3 my-4">
			<ul class="nav justify-content-center border-bottom">
				<li class="nav-item"><a href="#"
					class="nav-link px-2 text-muted">Home</a></li>
				<li class="nav-item"><a href="#"
					class="nav-link px-2 text-muted">Features</a></li>
				<li class="nav-item"><a href="#"
					class="nav-link px-2 text-muted">Pricing</a></li>
				<li class="nav-item"><a href="#"
					class="nav-link px-2 text-muted">FAQs</a></li>
				<li class="nav-item"><a href="#"
					class="nav-link px-2 text-muted">About</a></li>
			</ul>
			<p class="text-center text-muted">&copy; 2022 Company, Inc</p>
		</footer>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>