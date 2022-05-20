<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" >
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script> 
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>

<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="/web/resources/bootstrap/css/styles.css" rel="stylesheet" />   

<style>
.container-fluid h1{
	text-align: center;
}  
.form-control{
	display:block;
	width:700px;
}
.form-group{
	margin-top: 15px;
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
				<div class="container-fluid px-4" >
         			<h1 class="mt-4">신규 상품 등록</h1>
		     		<div class="card mb-4"> 
             			<div class="card-header">
                   			<i class="fas fa-file-alt"></i>
                          	Goods register
                   		</div>        
						<form:form commandName="itemRegisterVo" name="form" class="form" method="post" enctype="multipart/form-data" >
							<section style="margin-left: 20px; margin-bottom: 30px; margin-top: 20px;">
								<div class="inputBox" >								
									<label>분류</label>
									<select class="category" name="itemCateCode" id="itemCateCode" onchange="item_size_select(this)">
										<option value="">전체</option>
										<option value="A">상의</option>
										<option value="B">하의</option>
										<option value="C">신발</option>
										<option value="D">악세사리</option>
										<option value="E">모자</option>
									</select>
			
									<label for="itemSize">상품사이즈</label>
									<select class="itemSize" id="itemSize" name="itemSize" id="itemSize">
										<option value="">전체</option>
									</select>
								</div>
	
								<div class="check_font" id="itemCateCode_check" ></div>
								<div class="check_font" id="itemSize_check" ></div>
		
								<div class="form-group">
									<label for="itemPrice">상품가격</label>
									<form:input path="itemPrice" id="itemPrice" class="form-control"/>
									<form:errors path="itemPrice"/>
									<div class="check_font" id="price_check" ></div>
								</div>
								
								<div class="form-group">
									<label for="itemName">상품명</label>
									<input type="text" class="form-control" name="itemName" id="itemName" onkeyup="item_name_check()" checked="checked" />
									<div class="check_font" id="id_check" ></div>
								</div>
								
								<div class="form-group">
									<label for="itemQty">상품수량</label>
									<form:input path="itemQty" class="form-control"/>
									<form:errors path="itemQty"/>
									<div class="check_font" id="itemQty_check" ></div>
								</div>
								
								<div class="form-group">
									<label for="itemDesc">상품정보</label>
									<textarea rows="5" cols="25" id="itemDesc" class="form-control" name="itemDesc"></textarea>
									<form:errors path="itemDesc"/>
									<div class="check_font" id="itemDesc_check" ></div>
									 <script>
										var ckeditor_config={
										
										width : '700px',
										filebrowserUploadUrl : "/web/admin/imageUpload"
										};
							
										CKEDITOR.replace('itemDesc',ckeditor_config);
									</script> 
								</div>
								
								<div class="form-group">
									<label for="itemImage">상품이미지</label>
									<input type="file" name=file id="itemImage" onchange="PreviewImage();" accept="image/*" />
								</div>
								<div id="itemImage_check"></div>
						 		
						 		<div class="user_image"><img id="user_image" width="250"><br></div>
						 		
								<input type="button" class="btn btn-success" value="등록" id="submit_btn">
							</section> 	
						</form:form>
					</div>
				</div>
			</main>
		</div>
	</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="/web/resources/bootstrap/js/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="/web/resources/bootstrap/assets/demo/chart-area-demo.js"></script>
<script src="/web/resources/bootstrap/assets/demo/chart-bar-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
<script src="/web/resources/bootstrap/js/datatables-simple-demo.js"></script>
<script>
function item_size_select(e){
	var item_a = ["S","M","L","XL","XXL"];
	var item_b = ["26","28","30","32","34"];
	var item_c = ["230","235","240","245","250","255","260","265","270","275","280"];
	var item_d = ["FREE"];
	var item_e = ["FREE"];
	var target = document.getElementById("itemSize");
	
	if(e.value == "A"){
		var b = item_a;
	}else if(e.value == "B"){
		var b = item_b;
	}else if(e.value == "C"){
		var b = item_c;
	}else if(e.value == "D"){
		var b = item_d;
	}else if(e.value == "E"){
		var b = item_e;
	}
	target.options.length = 0;
	
	for (x in b) {
		var opt = document.createElement("option");
		opt.value = b[x];
		opt.innerHTML = b[x];
		target.appendChild(opt);
	}
}

function item_name_check(){
	item_overlap_input = document.querySelector('input[name="itemName"]');
	
	$.ajax({
		url:"itemNameCheck",
		data : {'itemName': item_overlap_input.value},
		datatype: 'json',
		success: function (data) {
			if (data == "1") {
				$('#id_check').text("이미 존재하는 상품명 입니다.").show();
				$("#id_check").css("color", "red");
				item_overlap_input.focus();
				search_var = 2;	
			}
			else if (data == "0") {
				$('#id_check').text("사용가능한 상품명 입니다.").show();
				$("#id_check").css("color", "green");
				search_var = 1;
			}
		}
	});
	return search_var;
}

$("#submit_btn").click(function(){
	if ($('#itemCateCode').val() == ""){
		$('#itemCateCode_check').text("상품 카테고리를 선택하세요.").show();
		$("#itemCateCode_check").css("color", "red");
		return;
	}
	if ($('#itemCateCode').val() != ""){
		$('#itemCateCode_check').hide();
	}
	if ($('#itemSize').val() == ""){
		$('#itemSize_check').text("상품 사이즈를 선택하세요.").show();
		$("#itemSize_check").css("color", "red");
		return;
	}
	if ($('#itemSize').val() != ""){
		$('#itemSize_check').hide();
	}
	if ($('#itemPrice').val() == ""){
		$('#price_check').text("가격을 입력하세요").show();
		$("#price_check").css("color", "red");
		return;
	}
	var itemPriceCheck = /^[0-9]*$/;
	if (!itemPriceCheck.test($('#itemPrice').val())){
		$('#price_check').text("숫자만 입력하세요").show();
		$("#price_check").css("color", "red");
		return;
	}
	if ($('#itemPrice').val() != "" && itemPriceCheck.test($('#itemPrice').val())){
		$('#price_check').hide();
	}
	if($('#itemName').val() == ""){
		$('#id_check').text("상품명을 입력하세요.").show();
		$("#id_check").css("color", "red");
		return;
	}
	if($('#itemQty').val() == ""){
		$('#itemQty_check').text("상품 수량을 입력하세요.").show();
		$("#itemQty_check").css("color", "red");
		return;
	}
	var itemQtyCheck = /^[0-9]*$/;
	if (!itemQtyCheck.test($('#itemQty').val())){
		$('#itemQty_check').text("숫자만 입력하세요").show();
		$("#itemQty_check").css("color", "red");
		return;
	}
	if($('#itemQty').val() != ""){
		$('#itemQty_check').hide();
	}
	if ($('#itemImage').val() == ""){
		$('#itemImage_check').text("상품 이미지 파일을 선택하세요.").show();
		$("#itemImage_check").css("color", "red");
		return;
	}
	var fileForm = /(.*?)\.(jpg|jpeg|png|gif|bmp|pdf)$/;
	if (!$('#itemImage').val().match(fileForm)){
		$('#itemImage_check').text("이미지 파일 종류를 확인하세요.").show();
		$("#itemImage_check").css("color", "red");
		return;
	}	
	if (item_name_check() == true){
		$(".form").submit();	 
  	}else{
  		console.log("else : " + item_name_check())
		alert("등록 폼 확인바랍니다.");
    	form.itemName.focus();
  	}	
})

function PreviewImage() {

	var preview = new FileReader();
	preview.onload = function (e) {
		document.getElementById("user_image").src = e.target.result;
	}
	preview.readAsDataURL(document.getElementById("itemImage").files[0]);
}
</script>
</html>