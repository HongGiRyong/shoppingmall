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
<title>상품 주문</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
	
</script>

</head>
<body>
	<h2>주문서 작성하기</h2>

	<form action="order" method="POST" onsubmit="return registerCheck()">
		<table border="1">
			<tr>
				<td>배송지 선택</td>
				<td>신규 배송지 <input type="radio" value="1" name="useraddr1"
					checked></td>
				<td>기존 배송지 <input type="radio" value="0" name="useraddr1"></td>
			</tr>
			<tr>
				<td>수령인</td>
				<td colspan="2"><input type="text" name="orderrec"
					id="orderrec"></td>
			</tr>
			<tr>
				<td>배송지 주소</td>
				<td colspan="2"><input type="text" name="useraddr1"
					id="useraddr1">
				<td>상세 주소</td>
				<td colspan="2"><input type="text" name="useraddr2"
					id="useraddr2">
			</tr>
			<tr>
				<td>배송시 요청사항</td>
				<td><select name="orderinfo">
						<option value="부재시 문앞">부재시 문앞</option>
						<option value="부재시 경비실">부재시 경비실</option>
						<option value="문앞에 두고 문자">문앞에 두고 문자</option>
						<option value="문앞에 두고 전화">문앞에 두고 전화</option>

				</select></td>
			</tr>
			<tr>
				<td>핸드폰 번호</td>
				<td colspan="2"><input type="text" id="orderphon"
					name="orderphon"></td>
			</tr>

		</table>
		<input type="submit" value="주문"> <input type="button"
			value="취소" onclick="submit3();">
	</form>
	<script>
		function submit3() {
			location.href = "/web/buyX";
		}

		$(document).ready(function() {

			// 라디오버튼 클릭시 이벤트 발생
			$("input:radio[name=useraddr1]").click(function() {

				if ($("input[name=useraddr1]:checked").val() == "1") {
					$("input:text[name=useraddr1]").attr("disabled", false);
					$("input:text[name=useraddr2]").attr("disabled", false);
					// radio 버튼의 value 값이 1이라면 활성화

				} else if ($("input[name=useraddr1]:checked").val() == "0") {
					$("input:text[name=useraddr1]").attr("disabled", true);
					$("input:text[name=useraddr2]").attr("disabled", true);
					// radio 버튼의 value 값이 0이라면 비활성화
				}
			});
		});
		function registerCheck() {
			if ($.trim($('#orderrec').val()) == '') {
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