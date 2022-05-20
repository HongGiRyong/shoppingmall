<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
         			<h1 class="mt-4">사이즈 추가</h1>
		     		<div class="card mb-4"> 
             			<div class="card-header">
                   			<i class="fas fa-file-alt"></i>
                          	Add size
						</div>        
						<section>
							<table class="table table-striped">
								<tr>
									<th>상품 번호</th><th>사이즈</th><th>수량</th>
								</tr>
								<c:forEach var="addList" items="${addList}">
									<tr>
										<td>${addList.itemCode}</td>
										<td>${addList.itemSize}</td>
										<td>${addList.itemQty}</td>
									</tr>
									<c:set target="${addList.itemCode}" value="${addList.itemCode}" var="itemCode"/>		 
								</c:forEach>
							</table>
							<form action="/web/admin/itemAddForm" method="post" class="form_s" id="form_s" onsubmit="return check();">
								<input type="hidden" name="itemCode" value="<c:out value="${itemCode}"/>">
								<span>동일 상품에서 추가할</span>
								<input type="text" id="itemSize" name="itemSize" placeholder="사이즈" onkeyup="size_check()"><span>와</span>
								<input type="text" id="itemQty" name="itemQty" placeholder="수량"><span>을 입력하고</span>
								<input type="submit" id="submit" value="추가" > <span>를 눌러주세요</span>
								<div class="check_font" id="size_check" ></div>
							</form>
						</section>
					</div>
				</div>
			</main>
		</div>
	</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="/web/resources/bootstrap/js/scripts.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script> 
<script src="/web/resources/bootstrap/assets/demo/chart-area-demo.js"></script>
<script src="/web/resources/bootstrap/assets/demo/chart-bar-demo.js"></script>-->
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="/web/resources/bootstrap/js/datatables-simple-demo.js"></script>

<script>


function size_check(){
	item_overlap_input = document.querySelector('input[name="itemSize"]');
	
	console.log(item_overlap_input.value);
	
	$.ajax({
		url:"/web/admin/itemSizeCheck",
		data : {'itemSize': item_overlap_input.value},
		datatype: 'json',
		success: function (data) {
			if (data >= "1") {
				$('#size_check').text("이미 존재하는 사이즈 입니다.").show();
				$("#size_check").css("color", "red");
				item_overlap_input.focus();
				result = false;	
			}
			else if (data == "0") {
				$('#size_check').text("추가 가능한 사이즈 입니다.").show();
				$("#size_check").css("color", "green");
				result = true;
			}
		}
	});
	return result;
}
   
function check(){
	var itemSizeCheck_one = /^[0-9]*$/;
	var itemSizeCheck_two = /^[A-Z]*$/;
	if (!itemSizeCheck_one.test($('#itemSize').val()) && !itemSizeCheck_two.test($('#itemSize').val())){
		$('#size_check').text("영어 대문자 또는 숫자만 입력하세요").show();
		$("#size_check").css("color", "red");
		return false;
	}
	if($("#itemSize").val() == ""){
		$('#size_check').text("사이즈를 입력하세요.").show();
		$("#size_check").css("color", "red");
		return false;
	}
	if($("#itemSize").val() != ""){
		$('#size_check').hide();
	}
	if($("#itemQty").val() == ""){
		$('#size_check').text("수량을 입력하세요.").show();
		$("#size_check").css("color", "red");
		return false;
	}
	var itemQtyCheck = /^[0-9]*$/;
	if (!itemQtyCheck.test($('#itemQty').val())){
		$('#size_check').text("숫자만 입력하세요").show();
		$("#size_check").css("color", "red");
		return false;
	}
	if($("#itemQty").val() != ""){
		$('#size_check').hide();
	}
	if(size_check() != true){
		return false;
	}
	
}

</script>

</html>