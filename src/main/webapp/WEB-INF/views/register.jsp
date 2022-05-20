<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>회원가입 </title>
<link rel="stylesheet" type="text/css" href="../resources/css/login.css">
<link rel="stylesheet" type = "text/css" href="${pageContext.request.contextPath }/resources/css/register.css">
<style type="text/css">
  
input[class="btn btn-default"] {
    background-color: rgb(84, 105, 212);
    box-shadow: rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(0, 0, 0, 0.12) 0px 1px 1px 0px, 
                rgb(84, 105, 212) 0px 0px 0px 1px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(0, 0, 0, 0) 0px 0px 0px 0px, 
                rgba(60, 66, 87, 0.08) 0px 2px 5px 0px;
    color: #fff;
    font-weight: 600;
    cursor: pointer;
}
</style>
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
          <h1><a href="/web/jmain" rel="dofollow">회원가입</a></h1>
        </div>
        <div class="formbg-outer">
          <div class="formbg">
            <div class="formbg-inner padding-horizontal--48">
              <span class="padding-bottom--15"></span>
              
              <form action="/web/member/register" method="post" class= "submit" >

                <div class="field padding-bottom--24">
                <div class="grid--50-50">
                  <label for="name">이름</label>
		 	<div class="reset-pass">
    
                    </div>
                    </div>
                 <input class="form-control" id="name" name = "name">
 	 				<div class="name_check">
                
                </div>

                <div class="field padding-bottom--24">
                  <div class="grid--50-50">
                    <label for="id">아이디</label>
                    <div class="reset-pass">
                
                    </div>
                  </div>
                 <input class="form-control" id="id" name = "id" oninput="idCheck()">
 	 				<span class="id_ok">사용 가능한 아이디 입니다.</span>
 					<span class="id_already">사용중인 아이디 입니다.</span>   
                </div>

<div class="field padding-bottom--24">
                  <div class="grid--50-50">
                    <label for="pw">비밀번호</label>
                    <div class="reset-pass">
                
                    </div>
                  </div>
                 <input type="password" class="form-control" id="pw" name = "pw">  
                </div>

<div class="field padding-bottom--24">
                  <div class="grid--50-50">
                    <label for="pwcheck">비밀번호 확인</label>
                    <div class="reset-pass">
                
                    </div>
                  </div>
                 <input type="password" class="form-control" id="pwcheck" name = "pwcheck">   
                </div>

<div class="field padding-bottom--24">
                  <div class="grid--50-50">
                    <label for="phone">휴대전화</label>
                    <div class="reset-pass">
                
                    </div>
                  </div>
                  <input type="tel" class="form-control" id="phone" name = "phone">
 	 				<div class="phone_check"></div>    
                </div>

<div class="field padding-bottom--24">
                  <div class="grid--50-50">
                    <label for="birth">생년월일</label>
                    <div class="reset-pass">
                
                    </div>
                  </div>
                 <input type="date" class="form-control" id="birth" name = "birth">
 	 				<div class="birth_check"></div>    
                </div>

<div class="field padding-bottom--24">
                  <div class="grid--50-50">
                    <label for="pw">이메일</label>
                    <div class="reset-pass">
                
                    </div>
                  </div>
                  <input  class="form-control" id="email_input" name = "email" oninput="emailCheck3()">
 					<span class="email_ok">사용 가능한 이메일 입니다.</span><br>
 					<span class="email_already">사용중인 이메일 입니다.</span><br>
 	 				<span class="clear_ok">이메일이 전송 되었습니다. 이메일을 확인해주세요.</span>
 					<span class="clear_already">올바르지 못한 이메일 형식입니다.</span>    
<div class="btn btn-default">
							<span onclick = "emailCheck()">인증번호 전송</span>
						</div>                
</div>				<div class="grid--50-50" id = "email_check_input_box_false">
				<input type="text" class="form-control" id="emailch" name="emailch" disabled="disabled" placeholder="인증번호 입력">
					
 	 		
				</div>
				<div class="clearfix"></div>
 	 					<span id = "email_check_input_box_warn"></span>

<div class="field padding-bottom--24">
                 
                    <label for="pw">주소</label>
                    <div class="reset-pass">
                
                    </div>
                  </div>
                 	<div class ="address_input_1_wrap">
 	 					
 	 					<div class="btn btn-default">
		 	 				<span onclick = "execDaumPostcode()">우편번호 찾기</span>
		 	 			</div>
		 	 			
		 	 			
		 	 			<div class="form-group">
 	 						<input  class="grid--50-50" id = "address_input_1" placeholder="우편번호" readonly="readonly">
 	 					
		 	 			
		 	 			</div>
 	 						<div class="clearfix"></div>	
 	 				</div>
 	 				<div class="address_input_2_wrap">
 	 					<div class="form-group">
 	 						<input class="grid--50-50" id = "address_input_2" name = "address1" placeholder="주소" readonly="readonly">
 	 					</div>
 	 				</div>  
 	 		 		<div class ="address_input_3_wrap">
						<div class="form-group">
							<input class="grid--50-50" id = "address_input_3" name = "address2" placeholder="상세주소" readonly="readonly">
						</div>
					</div>    
                </div>

<div class="field padding-bottom--24">
                  <div class="grid--50-50">
                    <label for="pw">닉네임</label>
                    <div class="reset-pass">
                
                    </div>
                  </div>
                  <input class="form-control" id="nickname" name = "nickname" oninput="nickCheck()">
 	 				<span class="nick_ok">사용 가능한 닉네임 입니다.</span>
 					<span class="nick_already">사용중인 닉네임 입니다.</span>    
                </div>
		
                <div class="field field-checkbox padding-bottom--24 flex-flex align-center">
                  
                </div>





                <div class="field padding-bottom--24">
                 <input type="button" class="btn btn-default" id="button" value="가입하기" />
                </div>
                <div class="field">
                  <a class="ssolink" href="/web/jmain">메 인 으 로</a>
                </div>
              </form>
            </div>
          </div>
          <div class="footer-link padding-top--24">
           
            <div class="listing padding-top--24 padding-bottom--24 flex-flex center-center">
              <span><a href="#">Home</a></span>
              <span><a href="#">Features</a></span>
              <span><a href="#">Pricing</a></span>
              <span><a href="#">FAQs</a></span>
              <span><a href="#">About</a></span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>



 
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/register.js"></script>  	
</body>
</html>