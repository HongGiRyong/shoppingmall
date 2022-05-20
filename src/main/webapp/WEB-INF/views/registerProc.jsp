<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Proc</title>
<link rel="stylesheet" type="text/css" href="../resources/css/login.css">
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
          <h1><a href="/web/jmain" rel="dofollow">훈남 3인방 쇼핑몰</a></h1>
        </div>
        <div class="formbg-outer">
          <div class="formbg">
            <div class="formbg-inner padding-horizontal--48">
              <span class="padding-bottom--15"></span>
              <form id="stripe-login" action = "/web/member/login" >
                <div class="field padding-bottom--24">
                
                 <h2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회원가입을 축하드립니다<h2>
		 	
                 
                 
                
                </div>
                <div class="field padding-bottom--24">
                  <div class="grid--50-50">
                    <label for=""></label>
                    <div class="reset-pass">
                      
                    </div>
                  </div>
                 
                </div>
	
                <div class="field field-checkbox padding-bottom--24 flex-flex align-center">
                 
                </div>
                <div class="field padding-bottom--24">
                 <input type="submit"  value = "로 그 인"/>
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




<h1>회원가입에 성공하셨습니다</h1>
 <li>
  <a href="/web/member/login">로그인</a>
 </li>
 <li>
 <a href="/web/jmain">메인으로</a>
</li>
</body>
</html>