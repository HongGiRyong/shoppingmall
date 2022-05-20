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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
	
</script>
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

				<input class="form-control me-2" type="search" placeholder="Search"
					aria-label="Search" list="new" autocomplete="off" name="keyword">
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
		style="margin-left: 230px; margin-top: -300px; position: relative; left: 10%; transform: translateX(-15%);">
		<h2>주문서 작성하기</h2>
		<form action="itemorder" method="POST" onsubmit="return registerCheck()">
			<div class="mb-3">
				배송지 선택<br> 신규 배송지 <input type="radio" value="1"
					name="useraddr1" checked> 기존 배송지 <input type="radio"
					value="0" name="useraddr1">
			</div>
			<div class="mb-3">
				<label class="form-label">수령인</label> <input type="text"
					class="form-control" id="username" name="username"
					style="width: 300px;">
			</div>
			<div class="mb-3">
				<label class="form-label">배송지 주소</label> <input type="button" id="add3"
					onclick="execDaumPostcode()" value="우편번호 찾기" /><br>
				<input type="text" class="form-control" id="useraddr1"
					name="useraddr1" style="width: 300px;"> <label
					class="form-label">상세 주소</label> <input type="text"
					class="form-control" id="useraddr2" name="useraddr2"
					style="width: 300px;">
			</div>


			<div class="mb-3">
				배송시 요청사항 <select name="orderinfo">
					<option value="부재시 문앞">부재시 문앞</option>
					<option value="부재시 경비실">부재시 경비실</option>
					<option value="문앞에 두고 문자">문앞에 두고 문자</option>
					<option value="문앞에 두고 전화">문앞에 두고 전화</option>

				</select>
			</div>
			<div class="mb-3">
				<label class="form-label">핸드폰 번호</label> <input type="text"
					class="form-control" id="orderphon" name="orderphon"
					style="width: 300px;">
					<div class="phone_check"></div>
			</div>
			<input type="submit" value="주문"> <input type="button"
				value="취소" onclick="submit3();">
		</form>
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
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function submit3() {
			location.href = "/web/buyX";
		}
		
		 function execDaumPostcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		              
		                var addr = ''; 
		                var extraAddr = ''; 

		                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }

		                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		                if(data.userSelectedType === 'R'){
		                    
		                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있고, 공동주택일 경우 추가한다.
		                    if(data.buildingName !== '' && data.apartment === 'Y'){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                    if(extraAddr !== ''){
		                        extraAddr = ' (' + extraAddr + ')';
		                    }
		                 // 주소변수 문자열과 참고항목 문자열 합치기
		                    addr += extraAddr;
		                
		                } else {
		                	addr += ' ';
		                }

		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		            // $("[name=useraddr1]").val(data.zonecode);
		            //$("[name=memberAddr1]").val(data.zonecode);    // 대체가능
		            $("[name=useraddr1]").val(addr);
		            //$("[name=memberAddr2]").val(addr);
		                // 커서를 상세주소 필드로 이동한다.
		                $("[name=useraddr2]").attr("readonly",false);
		                $("[name=useraddr1]").focus();
		            }
		        }).open();
		    }
	var phoneJ = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
		
		var phonech ="";
		$("#orderphon").blur(function() {
			if (phoneJ.test($(this).val())) {
					console.log(phoneJ.test($(this).val()));
					$(".phone_check").text('');
					phonech = true;
			} else {
				$('.phone_check').text('휴대전화를 다시 입력해주세요.');
				$('.phone_check').css('color', 'red');
				phonech = false;
			}
		});

	$(document).ready(function() {
			$("input:radio[name=useraddr1]").click(function() {

				if ($("input[name=useraddr1]:checked").val() == "1") {
					$("input:text[name=useraddr1]").attr("disabled", false);
					$("input:text[name=useraddr2]").attr("disabled", false);
					document.getElementById("add3").style.display="inline";
				} else if ($("input[name=useraddr1]:checked").val() == "0") {
					$("input:text[name=useraddr1]").attr("disabled", true);
					$("input:text[name=useraddr2]").attr("disabled", true);
					document.getElementById("add3").style.display="none";
				}
			});
		});
		function registerCheck() {
			if ($.trim($('#username').val()) == '') {
				alert("수령인을 입력해주세요.");
				return false;
			}
			if ($("input[name=useraddr1]:checked").val() == "1") {
				if ($.trim($('#useraddr1').val()) == '') {
					alert("신규 주소를 입력하세요");
					return false;
				}
			}
			if ($.trim($('#orderphon').val()) == '') {
				alert("휴대폰 번호를 입력하세요.");
				return false;
			} else {
				return true;
			}

		}
	</script>
</body>
</html>