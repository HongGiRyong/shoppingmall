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

<meta charset="UTF-8">
<meta http-equiv="refresh" content="3; url=/web/jmain"> 
<title>DELETE</title>

<style>
.container{
	position:absolute;
    left:40%;
    top:50%;
    margin-left:-350px;
    margin-top:-150px;
	
}
</style>
<script>
     $(function() {
            var seconds = 3;
            function counting() {
	            $(".seconds").html(seconds--);
                setTimeout(counting, 1000);
            }
            counting();
     });
    </script>
</head>
<body>


<section id="contact" class="content-section text-center">
        <div class="contact-section">
            <div class="container">
      	
           
       
        
              <h2>그동안 저희 쇼핑몰을 이용해 주셔서 감사합니다.</h2>
              
              <div class="row">
                <div class="col-md-8 col-md-offset-2">
                  <form class="form-horizontal" >
                    <div class="form-group">
                      <label for="exampleInputName2"></label>
                     
                     
                    </div>
                  		



         
                   
                  </form>

                  <hr>
                   <h3><span class="seconds">3</span>초 후에 페이지가 이동합니다.</h3> 
                  <ul class="list-inline banner-social-buttons">
                    
                    
                  
                  
                  </ul>
                </div>
              </div>
            </div>
        </div>
      </section>



	



</body>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>


    	  
</html>