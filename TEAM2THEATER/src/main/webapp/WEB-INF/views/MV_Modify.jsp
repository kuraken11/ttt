<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="kr">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>TTT_무비 포스트 수정</title>
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
  
  <!-- Template Main CSS File -->
  <link href="resources/assets2/css/style.css" rel="stylesheet">

</head>

<body>
  
  <!-- ======= Header ======= -->
  <header id="header" class="d-flex align-items-center ">
    <div class="container-fluid container-xxl d-flex align-items-center">

      <div id="logo" class="me-auto">
        <!-- 로고와 이름 -->
        <a href="index.html" class="scrollto"><img src="resources/assets/img/tttlogo.png" alt="TheEvenet" width="200" height="1200"></a>
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
					
            <div class="card shadow mb-4" style="width:900px;">
                  <div class="card-header py-3">
                       <h6 class="m-0 font-weight-bold text-primary">무비 포스트 수정</h6>
                  </div>
                  <div class="card-body">
                       <div class="table-responsive">
                       <form action="mvModify" method="POST" enctype="multipart/form-data">
	 						<input type="hidden" name="mp_Seq" value="${modify.mp_Seq}"/>
		 					<input type="hidden" name="mp_PosterName" value="${modify.mp_PosterName}"/>
	 						<input type="hidden" name="mp_Id" value="${modify.mp_Id}"/>
	 						<table class="table table-bordered" id="dataTable" cellspacing="0">
	 							<tr>
	 								<th>영화명</th>
	 								<td><input type="text" name="mp_Mvname" placeholder="${modify.mp_Mvname}" style="width:400px; border:solid 1px blue;"/></td>
	 							</tr>
	 							<tr>
	 								<th>제목</th>
	 								<td><input type="text" name="mp_Title" placeholder="${modify.mp_Title}" style="width:400px; border:solid 1px blue;"/></td>
	 							</tr>
	 							<tr>
	 								<th>내용</th>
	 								<td><textarea name="mp_Content" placeholder="${modify.mp_Content}" rows="40px" cols="100px"></textarea></td>
	 							</tr>
	 							<tr>
	 								<th>파일업로드</th>
	 								<td><input type="file" name="mp_Poster"/></td>
	 							</tr>
	 							<tr>
	 								<th colspan="2"><input type="submit" value="수정 완료" style="width:400px; border:solid 1px blue; background-color:red; color:white;"/></th>
	 							</tr>
	 						</table>
	 						</form>
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
	
	<c:if test="${loginId eq null}">
<script>
	alert('로그인 후에 사용해주세요.');
	location.href="mLoginForm";
</script>
</c:if>

</html>