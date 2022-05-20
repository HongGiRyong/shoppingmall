<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link href="https://fonts.googleapis.com/css?family=Oswald:700|Patua+One|Roboto+Condensed:700" rel="stylesheet">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" type = "text/css" href="${pageContext.request.contextPath }/resources/css/mypage.css">


<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>UPDATE</title>
<style>
.nick_ok{color:green; display: none;}
.nick_already{color:red; display: none;}


</style>
</head>
<body>


<section id="contact" class="content-section text-center">
        <div class="contact-section">
            <div class="container">
              <h2>정보 수정</h2>
              
              <div class="row">
                <div class="col-md-8 col-md-offset-2">
                  <form class="form-horizontal" action="/web/member/updatemypage" method = "post" name = "update" >
                    <div class="form-group">
                      <label for="exampleInputName2">이름</label>
                      <input type="text" class="form-control" id="name" name = "id" value = "${readmypage.name}">
                    	<div class="name_check"></div>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputEmail2">아이디</label>
                      <input type="text" class="form-control" id="id" name = "name" value = "${readmypage.id}" readonly="readonly">
                    </div>
                    <div class="form-group">
                      <label for="exampleInputEmail2">변경할 비밀번호</label>
                      <input type="password" class="form-control" id="pw" name = "pw" >
                    </div>
                    <div class="form-group">
                      <label for="exampleInputEmail2">변경할 비밀번호 확인</label>
                      <input type="password" class="form-control" id="pwcheck" name = "pwcheck" >
                    </div>
                    <div class="form-group ">
                      <label for="exampleInputText">휴대전화</label>
                     <input type="tel" class="form-control" id="phone" name = "phone" value = "${readmypage.phone}">
                    </div>
		 <div class="form-group">
                      <label for="exampleInputName2">생년월일</label>
                      <input type="date" class="form-control" id="birth" name = "birth" value = "${readmypage.birth}">
                    </div>
			 <div class="form-group">
                      <label for="exampleInputName2">이메일</label>
                      <input type="email" class="form-control" id="email" name = "email" value = "${readmypage.email}" readonly="readonly">
                    </div>
		 <div class="form-group">
                      <label for="exampleInputName2">주소</label><br>
                      <input type="button" class="btn btn-default"  onclick = "execDaumPostcode()" value="우편번호 찾기">
                      <input type="text" class="form-control" id="address2" name = "address1" value = "${readmypage.address1}" readonly="readonly">
                      <input type="text" class="form-control" id="address3" name = "address2" value = "${readmypage.address2}" readonly="readonly">
                    </div>

			 <div class="form-group">
                      <label for="exampleInputName2">닉네임</label>
                      <input type="text" class="form-control" id="nickname"name = "nickname" value = "${readmypage.nickname}" oninput="nickCheck()">
                    	<span class="nick_ok">사용 가능한 닉네임 입니다.</span>
 					<span class="nick_already">사용중인 닉네임 입니다.</span>    
                    </div>		



                    <button type="submit" class="btn btn-default" id="submit">정보 수정하기</button>
                    <a href="/web/member/readmypage"><input type="button" class="btn btn-default" value="뒤 로 가 기"></a>
                  </form>

                  <hr>
                    
                  <ul class="list-inline banner-social-buttons">
                    
                    <li><a href="/web/member/updatemypage/${readmypage.id}" class="btn btn-default btn-lg"> <span class="network-name">정 보 수 정</span></a></li>
                    <li><a href="/web/member/deletemypage/${readmypage.id}" class="btn btn-default btn-lg"> <span class="network-name">회 원 탈 퇴</span></a></li>
                    <li><a href="/web/jmain" class="btn btn-default btn-lg"> <span class="network-name">메 인 으 로</span></a></li>
                  </ul>
                </div>
              </div>
            </div>
        </div>
      </section>




				
			


	
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	 <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/register.js"></script>
<script>
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
             $("#address1").val(data.zonecode);
            //$("[name=memberAddr1]").val(data.zonecode);    // 대체가능
            $("#address2").val(addr);
            //$("[name=memberAddr2]").val(addr);
                // 커서를 상세주소 필드로 이동한다.
                $("#address3").attr("readonly",false);
                $("#address3").focus();
            }
        }).open();
    }
</script>
 
 <script type="text/javascript" >
      $(document).ready(function(){
    	  $("#submit").on("click", function(){
    		  
    		  	if($("#name").val()==""){
					alert("성명을 입력해주세요.");
					$("#name").focus();
					return false;
				}
				if($("#pw").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#pw").focus();
					return false;
				}
				
			  	if($("#phone").val()==""){
					alert("휴대전화를 입력해주세요.");
					$("#phone").focus();
					return false;
				}
			  	if($("#birth").val()==""){
					alert("생년월일을 입력해주세요.");
					$("#birth").focus();
					return false;
				}
			  	if($("#email").val()==""){
					alert("이메일을 입력해주세요.");
					$("#email").focus();
					return false;
				}
			  	if($("#address1").val()==""){
					alert("주소를 입력해주세요.");
					$("#address1").focus();
					return false;
				}
			  	if($("#address2").val()==""){
					alert("상세주소를 입력해주세요.");
					$("#address2").focus();
					return false;
				}
			  	if($("#nickname").val()==""){
					alert("닉네임을 입력해주세요.");
					$("#nickname").focus();
					return false;
				}else {
					document.update.action="/web/member/updatemypage";
					alert("정보가 수정되었습니다.")
					document.update.submit();
				}
			});  
      })
    </script>
</body>
</html>