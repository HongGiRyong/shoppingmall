<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script> 
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="/web/resources/bootstrap/css/styles.css" rel="stylesheet" />   
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>

<style>
.container-fluid h1{
	text-align: center;
}
</style>

<title>관리자 상품 등록</title>
</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="/web/jmain">ShoppingMall</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
	</nav>
 	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">Menu</div>
						 <a class="nav-link collapsed" href="" data-bs-toggle="collapse" data-bs-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
							<div class="sb-nav-link-icon"><i class="fas fa-home"></i></div>
							메인으로
							<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
						</a> 
						<div class="collapse" id="collapsePages" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="/web/admin">관리자 페이지</a>
								<a class="nav-link" href="/web/jmain">일반 페이지</a>
							</nav>
						</div> 
						<a class="nav-link collapsed" href="" data-bs-toggle="collapse" data-bs-target="#collapseMember" aria-expanded="false" aria-controls="collapseMember">
    						<div class="sb-nav-link-icon"><i class="fas fa-user"></i></div>
    						회원 관리
    						<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
						</a>
						<div class="collapse" id="collapseMember" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="/web/admin/memberManage">회원 목록</a>
								<a class="nav-link" href="/web/admin/withdrawalMemberManage">탈퇴 회원 목록</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="" data-bs-toggle="collapse" data-bs-target="#collapseItemReg" aria-expanded="false" aria-controls="collapseItemReg"> 
							<div class="sb-nav-link-icon"><i class="fas fa-file-alt"></i></div>
    						상품 등록
    						<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
						</a>
						<div class="collapse" id="collapseItemReg" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="/web/admin/itemNewReg">신규 상품 추가</a>
								<a class="nav-link" href="/web/admin/itemAddList">기존 상품 옵션 추가</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="/web/admin/itemList">
    						<div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
    						상품 목록
						</a>
						<a class="nav-link collapsed" href="" data-bs-toggle="collapse" data-bs-target="#collapseOrder" aria-expanded="false" aria-controls="collapseOrder">
    						<div class="sb-nav-link-icon"><i class="fas fa-shopping-cart"></i></div>
    						주문 관리
    						<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
   						</a> 
   						<div class="collapse" id="collapseOrder" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="/web/admin/orderList">현재 주문</a>
								<a class="nav-link" href="/web/admin/orderCompleteList">완료 주문</a>
							</nav>
						</div>          
					</div> 
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">Welcome :-)</div>
						Admin pages
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<div class="container-fluid px-4">
         			<h1 class="mt-4">회원 상제 정보</h1>
		     		<div class="card mb-4"> 
             			<div class="card-header">
							<i class="fas fa-user"></i>
                          	Member info
						</div>        
						<section>
							<table  class="table table-striped">
								<tr>
									<th>회원 번호</th><th>이름</th><th>아이디</th>
									<th>닉네임</th><th>주소</th><th>핸드폰 번호</th>
									<th>생년월일</th><th>이메일</th><th>가입 날짜</th>
								</tr>
								<c:forEach var="list" items="${list}">
									<c:set var="admin" value="${list.admin}"/>
									<tr>
										<td>${list.num}</td>
										<td>${list.name}</td>
										<td>${list.id}</td>
										<td>${list.nickName}</td>
										<td>${list.address1} ${list.address2}</td>
										<td>${list.phone}</td>
										<td>${list.birth}</td>
										<td>${list.email}</td>
										<td>${list.regDate}</td>
										<td>
											<button class="checkbtn" >회원 삭제</button>
										</td>
									</tr>	
								</c:forEach>
							</table>
	  						<div class="card-header">
                   				<i class="fas fa-shopping-cart"></i>
                          		Order list
                            </div>  
							<table class="table table-striped">
								<tr>
									<th>주문 번호</th><th>주문 상세 주소</th><th>주문 날짜</th><th>배송 현황</th>
								</tr>
								<c:forEach var="detailList" items="${detailList}">
									<tr>
										<td><a href="/web/admin/orderDetail/${detailList.orderId}">${detailList.orderId}</a></td>
										<td>${detailList.userAddr1} ${detailList.userAddr2} ${detailList.userAddr3}</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd" value="${detailList.orderDate}"/></td>
										<td>${detailList.delivery}</td>			
									</tr>	
								</c:forEach>
								<c:if test="${empty detailList}">
									<tr>
										<td colspan="4" align="center"><b>현재 주문 내역 없음</b></td>
									</tr>
								</c:if>
							</table>
						</section>
					</div>
				</div>
			</main>
		</div>
	</div>
<script>
$(".checkbtn").click(function(){ 
	var rlt = confirm('삭제하시겠습니까?')
	
	if(rlt){
	var checkbtn = $(this)
	var tr = checkbtn.parent().parent()
	var td = tr.children();
	
	console.log("id tr : " + tr.text());
	console.log("id td : " + td.eq(1).text());
	
	$.ajax({
		url:"/web/admin/memberDelete",
		data : {'id': td.eq(2).text(), 'admin' : '${admin}'},
		datatype: 'json',
		success: function (data) {
			if(data == 1){
				console.log(data)
				alert("회원이 삭제되었습니다.")
				location.href="/web/admin/memberManage"
			}else if(data == 0){
				console.log(data)
				alert("회원을 다시 확인해주세요.")
			}else if(data == 2){
				console.log(data)
				alert("관리자 아이디입니다.")
			}
			
		}
	});
	}else{
		return false;	
	}
});
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="/web/resources/bootstrap/js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="/web/resources/bootstrap/assets/demo/chart-area-demo.js"></script>
<script src="/web/resources/bootstrap/assets/demo/chart-bar-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="/web/resources/bootstrap/js/datatables-simple-demo.js"></script>
</body>
</html>
