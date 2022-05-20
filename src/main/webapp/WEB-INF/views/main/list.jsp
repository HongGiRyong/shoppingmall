<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!--JSTL 사용-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form:form commandName="search" action="/list" method="GET">
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
	</form:form>
	<br>
<c:if test="${cookie != null}">
	최근 검색 목록<br>
	<c:forEach var="cookies" items="${cookies}">
		<c:if test="${cookies != \"JSESSIONID\"}">
			${cookies} <br>
		</c:if>
	</c:forEach>
</c:if>
</body>
</html>