<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../resources/css/login.css">
<style>
.form-label-group {
	position: relative;
	margin-bottom: 1rem;
}
.form-label-group input {
	height: auto;
	border-radius: 2rem;
}
.clear_ok{color:green; display: none;}
.clear_already{color:red; display: none;}
.correct{
    color : green;
}
.incorrect{
    color : red;
}

</style>
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
              
              <form method="post" action="find_pw" name="findpw" class="find"> 
		 
		  <div class="field padding-bottom--24">
                  <label for="name">아이디 </label>
		
                  <input type="text" id="id" name="id" />
                </div>

                <div class="field padding-bottom--24">
                  <label for="name">이름 </label>
		
                  <input type="text" id="name" name="name" />
                </div>

                <div class="field padding-bottom--24">
                  <div class="grid--50-50">
                    <label for="email">이메일 :</label>
                   
                  </div>
                  <input type="text" id="email" name="email" /> 
		<input type="button" class = "email_check_button" 
		onclick = "emailCheck()" value="인증번호 전송"><br>
		<span class="clear_ok">이메일이 전송 되었습니다. 이메일을 확인해주세요.</span>
 			<span class="clear_already">올바르지 못한 이메일 형식입니다.</span>
                </div>
		<div class="email_check_input_box" id = "email_check_input_box_false">
			 <div class="field padding-bottom--24">
			<input type="text" class="email_check_input" id="emailch" name="emailch" disabled="disabled" placeholder="인증번호 입력">	
				<div class="clearfix"></div>
 	 					<span id = "email_check_input_box_warn"></span>
 	 			</div>
 	 			</div>
		
                <div class="field field-checkbox padding-bottom--24 flex-flex align-center">
                  
                </div>
                <div class="field padding-bottom--24">
                 <input class="submit" 
				type="submit" value="비밀번호찾기">
                </div>
		

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
  <c:if test="${check == 1}">
			<label>일치하는 정보가 존재하지 않습니다.</label>
			<a href="/web/member/find_pw_form"><input type="button" value="다시 입력" /></a>
		</c:if>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 
 
	  <script type="text/javascript" >
	  var buttonCheck="";
      $(document).ready(function(){
    	  $(".submit").on("click", function(){
    		 	
    		  if($("#id").val()==""){
					alert("아이디를 입력해주세요.");
					$("#id").focus();
					return false;
				}else{
					buttonCheck = true;
				}
    		  
    		  if($("#name").val()==""){
					alert("이름를 입력해주세요.");
					$("#name").focus();
					return false;
				}else{
					buttonCheck = true;
				}
    		  if($("#email").val()==""){
					alert("이메일을 입력해주세요.");
					$("#email").focus();
					return false;
				}else{
					buttonCheck = true;
				}
    		  

    		  if($("#emailch").val()==""){
					alert("인증번호를 입력해주세요");
					return false;
				}else{
					buttonCheck = true;
				}
    		  
    	  });
      })
    </script>
   

	
<script type="text/javascript">

         
/* 인증번호 이메일 전송 */
var code = "";     
//$(".email_check_button").click(function(){
	
function emailFormCheck(email){
	 var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	 return form.test(email);
}
	
	
function emailCheck() {
	var email = $("#email").val(); //입력한 이메일
	 var checkBox = $(".email_check_input");        // 인증번호 입력란
	 var boxWrap = $(".email_check_input_box"); // 인증번호 입력란 박스

	 if(emailFormCheck(email)){
		 $('.clear_ok').css("display","inline-block");
  		$('.clear_already').css("display", "none");
	    } else {
	   		$('.clear_already').css("display", "inline-block");
	    	 $('.clear_ok').css("display","none");
	        return false;
	    }    
	 
	 $.ajax({
			url:"mailCheck?email=" + email,
	        type:"GET",
	        success:function(data){
	        	
	        	
	        	 console.log("data : " + data);
	        	 checkBox.attr("disabled", false);
	        	 boxWrap.attr("id", "email_check_input_box_true");
	        	 code = data;
	        	
	        }
	
	});
};
var emailnumCheck = "";        // 이메일 인증번호 확인
/* 인증번호 비교*/
$(".email_check_input").blur(function(){
		console.log("code : " + code);
	var inputCode = $(".email_check_input").val();        // 입력코드    
    var checkResult = $("#email_check_input_box_warn");    // 비교 결과     
    
    if(inputCode == code){                            // 일치할 경우
        checkResult.html("인증번호가 일치합니다.");
        checkResult.attr("class", "correct");
        emailnumCheck = true;
        
    } else {                                            // 일치하지 않을 경우
        checkResult.html("인증번호를 다시 확인해주세요.");
        checkResult.attr("class", "incorrect");
        emailnumCheck = false;
       
    }    
});

</script>
 <script type="text/javascript">

//회원가입 버튼(회원가입 기능 작동)

$(".submit").click(function(){
    if(emailnumCheck == true && buttonCheck == true){
    	
	 $(".find").submit();
    }
    	
});
</script>
</body>

</html>