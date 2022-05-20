<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script> 
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>

<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="/web/resources/bootstrap/css/styles.css" rel="stylesheet" />   
 
<style type="text/css">
.form-control{display:block;width:700px;}

.container-fluid h1{
	text-align: center;
}
section{
	padding-left: 20px;
	padding-top: 20px;
	padding-bottom: 20px;
}
</style>

<title>상품 수정 페이지</title>
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
         			<h1 class="mt-4">상품 수정</h1>
		     		<div class="card mb-4"> 
             			<div class="card-header">
                   			<i class="fas fa-file-alt"></i>
							Goods update
						</div>        
						<section>
							<c:forEach var="itemDetail" items="${itemDetail}">
								<form action="/web/admin/itemUpdate" class="form" method="post" enctype="multipart/form-data" onsubmit="return item_name_check()">				
									<img src="<c:url value="/image/${itemDetail.itemThumbImage }"/>" width="200px" height="250px" alt="no">
									<input type="hidden" name="itemThumbImage" value="${itemDetail.itemThumbImage }">
									<input type="hidden" name="itemImage" value="${itemDetail.itemImage }">
									<input type="hidden" name="itemCode" id="itemCode" value="${itemDetail.itemCode }">
									<input type="hidden" name="itemOldSize" id="itemSize" value="${itemDetail.itemSize}"/>
									<div class="form-group">
										<label for="itemPrice">상품가격</label>
										<input name="itemPrice" id="itemPrice" value="${itemDetail.itemPrice}" class="form-control"/>
									</div>

									<div class="form-group">
										<label for="itemSize">상품사이즈</label>
										<input name="itemSize" id="itemSize" value="${itemDetail.itemSize}" class="form-control"/>
									</div>
										
									<div class="form-group">
										<label for="itemName">상품명</label>
										<input type="text" name="itemName" id="itemName" onkeyup="item_name_check()" checked="checked" 
											value="${itemDetail.itemName}" class="form-control"/>
										<div class="check_font" id="id_check" ></div>
									</div>
		
									<div class="form-group">
										<label for="itemQty">상품수량</label>
										<input name="itemQty" id="itemQty" value="${itemDetail.itemQty}" class="form-control"/>
									</div>
		
									<div class="form-group" >
										<label for="itemDesc">상품정보</label>
										<textarea rows="5" cols="25" id="itemDesc" name="itemDesc" class="form-control">${itemDetail.itemDesc }</textarea>
										<script>
											var ckeditor_config={
													resize_enaleb : false,
													enterMode : CKEDITOR.ENTER_BR,
													shiftEnterMode : CKEDITOR.ENTER_P,
													width : '700px',
													filebrowserUploadUrl : "/web/admin/imageUpload"
												};

											CKEDITOR.replace('itemDesc',ckeditor_config);
										</script> 
									</div>
				
									<div class="form-group">
										<label for="itemImage">상품이미지</label>
										<input type="file" name="file" id="itemImage" onchange="PreviewImage();" accept="image/*" />
									</div>
									<div class="user_image"><img id="user_image" width="250"><br></div>
		
									<input type="submit" value="등록"> 	
								</form>
							</c:forEach>
						</section>
					</div>
				</div>
			</main>
		</div>
	</div>
</body>
<script type="text/javascript">

function PreviewImage() {

	var preview = new FileReader();
	preview.onload = function (e) {
		document.getElementById("user_image").src = e.target.result;
	}
	preview.readAsDataURL(document.getElementById("itemImage").files[0]);
}
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="/web/resources/bootstrap/js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="/web/resources/bootstrap/assets/demo/chart-area-demo.js"></script>
<script src="/web/resources/bootstrap/assets/demo/chart-bar-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="/web/resources/bootstrap/js/datatables-simple-demo.js"></script>
</html>
