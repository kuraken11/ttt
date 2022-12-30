<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="kr">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>TTT_무비 포스트 상세보기</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="resources/assets/img/favicon.png" rel="icon">
  <link href="resources/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Raleway:300,400,500,700,800" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="resources/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="resources/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="resources/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="resources/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="resources/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="resources/assets/css/style.css" rel="stylesheet">

</head>

<body>
  
  <!-- ======= Header ======= -->
  <header id="header" class="d-flex align-items-center ">
    <div class="container-fluid container-xxl d-flex align-items-center">

      <div id="logo" class="me-auto">
        <img src="resources/assets/img/tttlogo.png" alt="TheEvenet" width="200" height="1200">
      </div>

    </div>
  </header><!-- End Header -->

  <main id="main">

    <!-- ======= main 최초 칸 막이  ======= -->
    <section id="about">
      <div class="container" data-aos="fade-up">
        <div class="row">
          <div class="col-lg-6">
            <!-- 다용도 칸 막이 -->
          </div>
          <div class="col-lg-3">
            
          </div>
          <div class="col-lg-3">
            
          </div>
        </div>
      </div>
    </section><!-- End About Section -->
    
    <div class="container-fluid">
					 
            <div class="card shadow mb-4" style="width:80%;">
                  
                  <div class="card-body">
                       <div class="table-responsive">
                       <table class="table table-bordered" id="dataTable" cellspacing="0">
                       <tr>
	 						<th> 게시글 번호 </th>
	 						<td>${moviepost.mp_Seq}</td>
	 				   </tr>
	 				   <tr>
	 						<th> 작성자 </th>
	 						<td>${moviepost.mp_Id}</td>
	 				   </tr>
	 				   <tr>
	 						<th> 영화 </th>
	 						<td><a href="mvInfo?mv_Name=${moviepost.mp_Mvname}">${moviepost.mp_Mvname}</a></td>
	 				   </tr>
	 				   <tr>
	 						<th> 제목 </th>
	 						<td>${moviepost.mp_Title}</td>
	 				   </tr>
	 				   <tr>
	 						<th> 영화의 한장면 </th>
	 						<td><img src="${pageContext.request.contextPath}/resources/fileUpload/${moviepost.mp_PosterName}" width="400px" height="500px"></td>
	 				   </tr>
	 				   <tr>
	 						<th> 작성자 코멘트 </th>
	 						<td>${moviepost.mp_Content}</td>
	 				   </tr>
	 				   <tr>
	 						<th> 작성일자 </th>
	 						<td>${moviepost.mp_Time}</td>
	 				   </tr>
	 				   <tr>
	 						<th> 좋아요 </th>
	 						<td> ${moviepost.mp_Like}명 </td>
	 				   </tr>
	 				   
	 	
	 				   <c:choose>
	 				   <c:when test="${loginId eq moviepost.mp_Id || loginId eq 'admin'}">
	 				   <tr>
	 						<th colspan="2">
	 							<input type="button" value="수정" onclick="location.href='mvModifyForm?mp_Seq=${moviepost.mp_Seq}'" style="width:100px; background-color:red; color:white;"/>
	 							<input type="button" value="삭제" onclick="toDelete(${moviepost.mp_Seq})" style="width:100px; background-color:red; color:white;"/>
	 						</th>
	 				   </tr>
	 				   </c:when>
	 				   <c:otherwise>
	 						<tr><th colspan="2"></tr>
	 				   </c:otherwise>
	 				   </c:choose>
	 				   </table>
	 				   
	 </div></div></div></div>
	 
  </main><!-- End #main -->

  <!-- Vendor JS Files -->
  <script src="resources/assets/vendor/aos/aos.js"></script>
  <script src="resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="resources/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="resources/assets/js/main.js"></script>

</body>
<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous"></script>
	
<script>
	function toDelete(seq){
		
		let conf = confirm('정말로 삭제하시겠습니까?');
		
		if(conf){
			location.href='mvDelete?mp_Seq=' + seq
		} else {
			alert('취소하셨습니다.')
		}
		
	}
</script>

</html>