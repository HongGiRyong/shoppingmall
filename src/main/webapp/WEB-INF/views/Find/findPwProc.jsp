<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../resources/css/login.css">

<meta charset="UTF-8">
<title>아이디 찾기</title>
</head>

<body>
  <div class="login-root">
    <div class="box-root flex-flex flex-direction--column" style="min-height: 100vh;flex-grow: 1;">
      <div class="loginbackground box-background--white padding-top--64">
        <div class="loginbackground-gridContainer">
          <div class="box-root flex-flex" style="grid-area: top / start / 8 / end;">
            <div class="box-root" style="background-image: linear-gradient(white 0%, rgb(247, 250, 252) 33%); flex-grow: 1;">
            </div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 4 / 2 / auto / 5;">
            <div class="box-root box-divider--light-all-2 animationLeftRight tans3s" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 6 / start / auto / 2;">
            <div class="box-root box-background--blue800" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 7 / start / auto / 4;">
            <div class="box-root box-background--blue animationLeftRight" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 8 / 4 / auto / 6;">
            <div class="box-root box-background--gray100 animationLeftRight tans3s" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 2 / 15 / auto / end;">
            <div class="box-root box-background--cyan200 animationRightLeft tans4s" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 3 / 14 / auto / end;">
            <div class="box-root box-background--blue animationRightLeft" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 4 / 17 / auto / 20;">
            <div class="box-root box-background--gray100 animationRightLeft tans4s" style="flex-grow: 1;"></div>
          </div>
          <div class="box-root flex-flex" style="grid-area: 5 / 14 / auto / 17;">
            <div class="box-root box-divider--light-all-2 animationRightLeft tans3s" style="flex-grow: 1;"></div>
          </div>
        </div>
      </div>
      <div class="box-root padding-top--24 flex-flex flex-direction--column" style="flex-grow: 1; z-index: 9;">
        <div class="box-root padding-top--48 padding-bottom--24 flex-flex flex-justifyContent--center">
          <h1><a href="http://blog.stackfindover.com/" rel="dofollow">비밀번호 찾기</a></h1>
        </div>
        <div class="formbg-outer">
          <div class="formbg">
            <div class="formbg-inner padding-horizontal--48">
              <span class="padding-bottom--15"></span>
              
              <form method="post" action="update_pw" name="findpw" 
		 >
	<!-- 정보가 일치하지 않을 때-->
		<c:if test="${check == 1}">
			<label>일치하는 정보가 존재하지 않습니다.</label>
			<div class="field padding-bottom--24">
			<a href="/web/member/find_pw_form"><input 	type="button" value="다시 입력" /></a>
			</div>
		</c:if>
		<c:if test="${check == 0 }">
		  <div class="field padding-bottom--24">
                  <label for="password">변경 할 비밀번호</label>
		
                 <input type="password" id="pwd" name="pwd" />
                </div>

                <div class="field padding-bottom--24">
                  <label for="confirmpassword">변경 할 비밀번호 확인</label>
		
                  <input type="password" id="confirmpwd" 			name="confirmpwd" />
                </div>

                <div class="field field-checkbox padding-bottom--24 			flex-flex align-center">
                  
                </div>
                <div class="field padding-bottom--24">
                <input 
		type="button" value="비밀번호 변경하기" 		onclick="updatePassword()">
			
                </div>
		</c:if>

                <div class="field">
                  
                </div>
		 
              </form>
            </div>
          </div>
          <div class="footer-link padding-top--24">
            <span>Don't have an account? <a href="">Sign up</a></span>
            <div class="listing padding-top--24 padding-bottom--24 flex-flex center-center">
              <span><a href="#">© Stackfindover</a></span>
              <span><a href="#">Contact</a></span>
              <span><a href="#">Privacy & terms</a></span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 
  <script>
	 $("#pwd").change(function(){
	    checkPassword($('#pwd').val());
	});
	function checkPassword(pwd){
	    
	    if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(pwd)){            
	        alert('숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.');
	        $('#pwd').val('').focus();
	        
	    }    
	   
	}
</script>
 
 
  <script type="text/javascript">
		function updatePassword(){
			if(document.findpw.pwd.value==""){
				alert("비밀번호를 입력해주세요.");
				document.findpw.pwd.focus();
			} else if(document.findpw.pwd.value != document.findpw.confirmpwd.value){
				alert("비밀번호가 일치하지 않습니다.");
				document.findpw.confirmpwd.focus();
			} else {
				document.findpw.action="update_pw";
				alert("비밀번호 변경되었습니다.")
				document.findpw.submit();
			}
		}
	</script>
</html>
</body>

</html>