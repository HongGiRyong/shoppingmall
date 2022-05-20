<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!--JSTL 사용-->
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
<script>
var i = 0;
function submit2(frm) { 
  frm.action='/web/delete'; 
  frm.submit(); 
  return true; 
} 
</script>
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
		</div>

	</nav>
	<div class="row"
		style="margin-left: 230px; margin-top: -300px; text-align: center; position: relative; left: 10%; transform: translateX(-15%);">
		<form action="/web/buy" method="POST">
		<c:if test="${basketselect != null}">
			<table border="1" width="1000" class="table table-striped"> 
				<tr>
					<td id="qtyall" >전체 0 개</td>

					<td>상품사진</td>
					<td>상품이름</td>
					<td>총 가격</td>
					<td>사이즈</td>
					<td colspan="3">수량</td>
				</tr>

				<c:forEach var="bb" items="${basketselect}"> 
					<tr>
						<td><input type="checkbox" id="check${bb.kartnum}"
							name="basketbuy" value="${bb.kartnum}"
							onclick="checkqty(${bb.kartnum},${bb.price})"></td>
						
						<td><img src="<c:url value="/image/${bb.itemimage}"/>" style="width: 80px; height: 80px;"/></td>
						<td>${bb.itemname}</td>
						<c:if test="${basketselect != null}">
							<td id="price${bb.kartnum}">${bb.price*bb.itemqty}원</td>
						</c:if>
						<c:if test="${basketselect == null}">
							<td id="price${bb.kartnum}"></td>
						</c:if>
						<td>${bb.itemsize}</td>
						
							
									<td>
									<input type="button" id="mius" name="mius" value="-"
										onclick="miusqty(${bb.kartnum},${bb.price})"class="btn btn-info"></td>
										
									<c:if test="${basketselect != null}">
										<td id="qty${bb.kartnum}">${bb.itemqty}</td>
										
									</c:if>
									<c:if test="${basketselect == null}">
										<td id="qty${bb.kartnum}"></td>
										
									</c:if>
									<td><input type="button" id="plus" name="plus" value="+"
										onclick="plusqty(${bb.kartnum},${bb.price})"class="btn btn-info"></td>				
							
								
							
				</c:forEach>
			</table>
		</c:if >
		<div style="margin-left:1200px; margin-top: 15px;">
		<input type="submit" value="주문" class="btn btn-success">
		<input type="button" value="삭제" class="btn btn-success" onclick="return submit2(this.form);">
		</div>
	</form>
	</div>
	<c:if test="${basket != null}">
		<script>alert("${basket}");</script>
	</c:if>
	<c:if test="${error != null}">
		<script>alert("${error}");</script>
	</c:if>
	<c:if test="${good != null}">
		<script>alert("${good}");</script>
	</c:if>
		
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
		<script> 
		function plusqty(name,price) {
			fetch("buy/qty", {
				method : "POST",
				headers : {
					"Content-Type" : "application/json; charset=UTF-8",
				},
				body : JSON.stringify({
					kartnum : name,
					value : '+',
					itemprice : price,
				})
			}).then(function(response) {
				response.text().then(function(text) {
					 var jsonObj = JSON.parse(text);
					 console.log(jsonObj);
					 document.querySelector('#qty'+jsonObj.kartnum).innerHTML = jsonObj.itemqty;
					 document.querySelector('#price'+jsonObj.kartnum).innerHTML = jsonObj.itemprice*jsonObj.itemqty+'원';
					 if(jsonObj.info != null){
						 alert(jsonObj.info);
					 }
				})
			})
		}
		function miusqty(name,price) {
			fetch("buy/qty", {
				method : "POST",
				headers : {
					"Content-Type" : "application/json; charset=UTF-8",
				},
				body : JSON.stringify({
					kartnum : name,
					value : '-',
					itemprice : price,
				})
			}).then(function(response) {
				response.text().then(function(text) {
					 var jsonObj = JSON.parse(text);
					 console.log(jsonObj);
					 document.querySelector('#qty'+jsonObj.kartnum).innerHTML = jsonObj.itemqty;
					 document.querySelector('#price'+jsonObj.kartnum).innerHTML = jsonObj.itemprice*jsonObj.itemqty+'원';
					 if(jsonObj.info != null){
						 alert(jsonObj.info);
					 }
				})
			})
			
		}
		function checkqty(name) {
			fetch("buy/check", {
				method : "POST",
				headers : {
					"Content-Type" : "application/json; charset=UTF-8",
				},
				body : JSON.stringify({
					kartnum : name,
				})
			}).then(function(response) {
				response.text().then(function(text) {
					console.log('1111111111111111');
					console.log(text);
					console.log('1111111111111111');
					var jsonObj = JSON.parse(text);
					console.log('2222222222222222');
					console.log(jsonObj);
					console.log('2222222222222222');
					console.log(jsonObj.kartnum);
					console.log('33333333333333333');
					var aa = document.getElementById('check'+jsonObj.kartnum).checked;
					if(aa){
						i = i + 1;
					}else{
						i = i - 1;
					}
					console.log(document.querySelector('#price'+jsonObj.kartnum));
					document.querySelector('#qtyall').innerHTML = '전체 '+i+' 개';
					
				})
			})
		}
	</script>
</body>
</html>