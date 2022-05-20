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
<title>MYPAGE</title>
<style>

.container{
	position:absolute;
    left:40%;
    top:20%;
    margin-left:-350px;
    margin-top:-150px;
	
}

</style>



</head>
<body>

<section id="contact" class="content-section text-center">
        <div class="contact-section">
            <div class="container">
              <h2>My Page</h2>
            
              <div class="row">
                <div class="col-md-8 col-md-offset-2">
                  <form class="form-horizontal">
                    <div class="form-group">
                      <label for="exampleInputName2">이름</label>
                      <div class="form-control" id="exampleInputName2">${readmypage.name}</div>
                    </div>
                    <div class="form-group">
                      <label for="exampleInputEmail2">아이디</label>
                      <div class="form-control" id="exampleInputEmail2">${readmypage.id}</div>
                    </div>
                    <div class="form-group ">
                      <label for="exampleInputText">휴대전화 : </label>
                     <div class="form-control" id="exampleInputEmail2">${readmypage.phone} </div>
                    </div>
		 <div class="form-group">
                      <label for="exampleInputName2">생년월일</label>
                      <div class="form-control" id="exampleInputName2">${readmypage.birth}</div>
                    </div>
			 <div class="form-group">
                      <label for="exampleInputName2">이메일</label>
                      <div class="form-control" id="exampleInputName2">${readmypage.email}</div>
                    </div>
		 <div class="form-group">
                      <label for="exampleInputName2">주소 : </label>
                      <div class="form-control" id="exampleInputName2"> ${readmypage.address1}${readmypage.address2}  </div>
                    </div>

			 <div class="form-group">
                      <label for="exampleInputName2">닉네임</label>
                      <div class="form-control" id="exampleInputName2">${readmypage.nickname}</div>
                    </div>		

				


                  </form>
				   <hr>
		 <table
            border="1"
            width="100%"
            height="140"
            cellspacing="5">
            <caption style = "color:white">주문 조회</caption>
             <thead>
            
                <tr text-align="center" bgcolor="">
                  
                    <th>주 문 번 호</th>
                    <th>상 품 이 름</th>
                    <th>주 소</th>
                    <th>가 격</th>
                    <th>배 송 현 황</th>
                </tr>
            </thead>
            <c:forEach var="detail" items="${myorderDetail}">
         

            <tbody>
                <tr>
               
                    <td>${detail.orderId}</td>
                    <td>${detail.itemName}</td>
                    <td>${detail.userAddr1}${detail.userAddr2}</td>
                    <td>${detail.amount}</td>
                   <td>${detail.delivery}</td>
                </tr>
         
            </tbody>
            </c:forEach>
        </table>
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
      
	
</body>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</html>