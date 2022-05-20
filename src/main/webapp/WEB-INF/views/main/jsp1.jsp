<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!--스프링프레임워크의 JSP 기술중에 form taglib 가 있습니다. form 태그라이브러리를 사용하면 
	HTML 폼에 데이터를 바인딩하거나 에러메세지 처리등을 간편하게 할 수 있습니다.-->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!--메시지를 사용하기 위해 추가-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!--JSTL 사용-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 목록</title>
<script> 
  function submit2(frm) { 
    frm.action='/web/delete'; 
    frm.submit(); 
    return true; 
  } 
</script> 
</head>
<body>
<script>
var i = 0;
</script>
	<h2>장바구니</h2>
	<form action="/web/buy" method="POST">
		<c:if test="${basketselect != null}">
			<table border="1">
				<tr>
					<td id="qtyall" >전체 0 개</td>
					<td>장바구니 번호</td>
					<td>상품사진</td>
					<td>상품이름</td>
					<td>총 가격</td>
					<td>사이즈</td>
					<td>수량</td>
				</tr>

				<c:forEach var="bb" items="${basketselect}">
					<tr>
						<td><input type="checkbox" id="check${bb.kartnum}"
							name="basketbuy" value="${bb.kartnum}"
							onclick="checkqty(${bb.kartnum},${bb.price})"></td>
						<td>${bb.kartnum}</td>
						<td>${bb.itemimage}</td>
						<td>${bb.itemname}</td>
						<c:if test="${basketselect != null}">
							<td id="price${bb.kartnum}">${bb.price*bb.itemqty}원</td>
						</c:if>
						<c:if test="${basketselect == null}">
							<td id="price${bb.kartnum}"></td>
						</c:if>
						<td>${bb.itemsize}</td>
						<td>
							<table>
								<tr>
									<td><input type="button" id="mius" name="mius" value="-"
										onclick="miusqty(${bb.kartnum},${bb.price})"></td>
									<c:if test="${basketselect != null}">
										<td id="qty${bb.kartnum}">${bb.itemqty}</td>
									</c:if>
									<c:if test="${basketselect == null}">
										<td id="qty${bb.kartnum}"></td>
									</c:if>
									<td><input type="button" id="plus" name="plus" value="+"
										onclick="plusqty(${bb.kartnum},${bb.price})"></td>
								</tr>
							</table>
							
				</c:forEach>
			</table>
		</c:if>
		<input type="submit" value="주문">
		<input type="button" value="삭제" onclick="return submit2(this.form);">
	</form>
	<c:if test="${basket != null}">
		<script>alert("${basket}");</script>
	</c:if>
	<c:if test="${error != null}">
		<script>alert("${error}");</script>
	</c:if>
	<c:if test="${good != null}">
		<script>alert("${good}");</script>
	</c:if>
</body>
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
</html>