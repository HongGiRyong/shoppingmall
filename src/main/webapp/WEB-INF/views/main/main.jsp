<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><!--JSTL 사용-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form:form commandName="cmd" action="/web/main" method="POST">
		<label> <select name="itemcatecode">
				<option value=1>전체</option>
				<option value=2>상의</option>
				<option value=3>하의</option>
				<option value=4>신발</option>
				<option value=5>악세서리</option>
				<option value=6>모자</option>
		</select>
		</label>
		<label> 검색 키워드 입력: <input name="keyword"
			placeholder="검색하실 이름을 입력하세요" list="new" autocomplete="off"/>
		</label>
		<c:if test="${cookie != null}">
					<datalist id="new">
			<c:forEach var="cookies" items="${cookies}">
				<c:if test="${cookies != \"JSESSIONID\"}">
						<option value="${cookies}">
					
				</c:if>
			</c:forEach>
			</datalist>
		</c:if>
		<input type="submit" value="검색">
	</form:form>
	<br><br>
		<table border="1">
			<tr>
				<th>상품 번호</th><th>상품 가격</th><th>상품 이름</th>
				<th>상품 내용</th><th>상품 사이즈</th>
			</tr>
			<c:forEach var="item" items="${search}">
				<tr>
					<td>${item.itemcode}</td>
					<td>${item.itemprice}</td>
					<td>${item.itemname}</td>
					<td>${item.itemdesc}</td><td>${item.itemsize}</td>
				</tr>
			</c:forEach>
		</table>
	<br>
</body>
</html>