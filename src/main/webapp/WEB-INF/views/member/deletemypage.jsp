<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<style>

.container{
	
    position:absolute;
    left:40%;
    top:50%;
    margin-left:-350px;
    margin-top:-150px;
    
}

</style>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>DELETE</title>

</head>
<body>


<section id="contact" class="content-section text-center">
        <div class="contact-section">
            <div class="container">
      	
           
       
        
              <h2>회원탈퇴를 하려면 비밀번호를 입력해주세요.</h2>
              
              <div class="row">
                <div class="col-md-8 col-md-offset-2">
                  <form class="form-horizontal" action="/web/member/deletemypage" method="post" id="deleteForm" name="deleteForm">
                    <div class="form-group">
                      <label for="exampleInputName2"></label>
                      <input type="hidden" id="id" name="id" value="${id}">
                      <input type="password" class="form-control" id="pw" name = "pw" placeholder="비밀번호 입력">
                    </div>
                  		



                    <button type="button" class="btn btn-default" id="delete" name="delete">회원 탈퇴하기</button>
                   
                  </form>

                  <hr>
                    
                  <ul class="list-inline banner-social-buttons">
                    
                    <li><a href="/web/member/updatemypage/${id}" class="btn btn-default btn-lg"> <span class="network-name">정 보 수 정</span></a></li>
                    <li><a href="/web/member/deletemypage/${id}" class="btn btn-default btn-lg"> <span class="network-name">회 원 탈 퇴</span></a></li>
                    <li><a href="/web/jmain" class="btn btn-default btn-lg"> <span class="network-name">메 인 으 로</span></a></li>
                  
                  </ul>
                </div>
              </div>
            </div>
        </div>
      </section>



	



</body>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
		$(document).ready(function(){
		
			$("#delete").on("click", function(){
				
				if($("#pw").val()==""){
					alert("비밀번호를 입력해주세요");
					$("#pw").focus();
					return false
				}
				
				
				
				
				$.ajax({
					url : "/web/member/pwCheck",
					type : "POST",
					dataType : "json",
					data : $("#deleteForm").serializeArray(),
					
					success: function(data){
						console.log("data" + data);
						
						if(data == "0"){
							alert("비밀번호를 확인해주세요.");
							return;
						}else{
							if(confirm("탈퇴하시겠습니까?")){
								$("#deleteForm").submit();
							}
							
						}
					}
				})
			});
		})
	</script>
    	  
</html>