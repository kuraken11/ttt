<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="kr">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>TTT_전체 영화</title>
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
        <!-- 로고와 이름 -->
        <a href="index.html" class="scrollto"><img src="resources/assets/img/tttlogo.png" alt="TheEvenet" width="200" height="1200"></a>
      </div>
      <!-- header nav -->
      <nav id="navbar" class="navbar order-last order-lg-0">
        <ul>
          <li><a class="nav-link scrollto active" href="index">홈으로</a></li>
          <li class="dropdown"><a href="#"><span>영화</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="allMv">전체 영화</a></li>
              <li><a href="mvPost">무비 포스트</a></li>
            </ul>
          </li>
          <li class="dropdown"><a href="#"><span>예매</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="quickRes">빠른 예매</a></li>
              <!-- <li><a href="schedule">상영 시간표</a></li> -->
            </ul>
          </li>
          <li class="dropdown"><a href="#"><span>극장</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="thTh">전체 극장</a></li>
            </ul>
          </li>
          <c:choose>
          <c:when test="${loginId eq 'admin'}">
          <li class="dropdown"><a href="#"><span>관리자님</span> <i class="bi bi-chevron-down"></i></a>
          <ul>
            <li><a href="myPage?memId=${loginId}">마이페이지</a></li>
            <li><a href="mList">회원목록</a></li>
            <li><a href="addMv">영화등록</a></li>
            <li><a href="mvPost">무비포스트</a></li>
            <li><a href="mLogout">로그아웃</a></li>
          </ul>
        </li>
          </c:when>
          <c:when test="${loginId ne null}">
          <li class="dropdown"><a href="#"><span>${loginId}님</span> <i class="bi bi-chevron-down"></i></a>
          <ul>
            <li><a href="myPage?memId=${loginId}">마이페이지</a></li>
            <li><a href="mvPost">무비포스트</a></li>
            <li><a href="mLogout">로그아웃</a></li>
          </ul>
          </li>
          </c:when>
          <c:otherwise>
          <li class="dropdown"><a href="#"><span>게스트</span> <i class="bi bi-chevron-down"></i></a>
          <ul>
            <li><a href="mJoinForm">회원가입</a></li>
            <li><a href="mLoginForm">로그인</a></li>
          </ul>
          </li>
          </c:otherwise>
          </c:choose>
          
          <!-- <li><a class="nav-link scrollto" href="contact">문의하기</a></li> -->
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->
      <a class="buy-tickets scrollto" href="quickRes">빠른 예매</a>

    </div>
  </header><!-- End Header -->

  <!-- ======= 메인 ======= -->
  <main id="main">

    <!-- ======= main 최초 칸 막이  ======= -->
    <section id="about"><!-- 다용도 칸 막이. id는 about 고정하고 css 건드리기 -->
      <div class="container" data-aos="fade-up">
        <div class="row">
          <div class="col-lg-6">
            
          </div>
          <div class="col-lg-3">
            
          </div>
          <div class="col-lg-3">
            
          </div>
        </div>
      </div>
    </section><!-- End One Section -->
    <section id="schedule">
        <div class="container" data-aos="fade-up">
          <div class="section-header">
            <h2>전체 영화</h2>
          </div>
          
          <ul class="nav nav-tabs" role="tablist" data-aos="fade-up" data-aos-delay="100">
            <li class="nav-item">
              <button onclick="moveAll()" class="nav-link" role="tab" style="width:250px;">박스오피스</button>
              <script type="text/javascript">
              	function moveAll(){
              		location.href = "allMv";
              	}
              </script>
            </li>
            <li class="nav-item">
              <button onclick="moveCs()" class="nav-link active" role="tab" style="width:250px;">상영예정작</button>
              <script type="text/javascript">
              	function moveCs(){
              		location.href = "csMv";
              	}
              </script>
            </li>
          </ul>
        </div>
      </section>
      <!-- ======= Speakers Section ======= -->
    <section id="speakers">
      <div class="container" data-aos="fade-up"></div>
        <h4 class="text-center">사진 또는 영화제목을 누르면 해당 영화 정보를 확인하실 수 있습니다.</h4>
        <br/>
        <div class="row"> <!-- 여기가 영화 정보 가져오는 곳 -->
        
        <c:forEach var="list" items="${mvList}">
        <div class="col-lg-4 col-md-6">
            <div class="speaker" data-aos="fade-up" data-aos-delay="100">
        		<a href="mvInfo?mv_Name=${list.mv_Name}"><img src="resources/assets/poster/${list.mv_PosterName}" class="img-fluid" width="490" height="500"></a>
             	<div class="details">
                	<h3><a href="mvInfo?mv_Name=${list.mv_Name}">${list.mv_Name}</a></h3>
		     		<p>평점 <span style="color: blue; font-size:20px; font-weight: bold;">${list.mv_Point}</span> 개봉일 <span id="mv_Openday" style="color: blue; font-size:15px; font-weight: bold;">${list.mv_Openday}</span>
                	이용등급 <span id="mv_Age" style="color: blue; font-size:15px; font-weight: bold;">${list.mv_Age}</span> 예매율 <span id="mv_Res" style="color: blue; font-size:15px; font-weight: bold;">${list.mv_Res}%</span></p>
                	<h3>${list.mv_Head}</h3>
                	<div class="social">
                  		<p>${list.mv_Content}</p>
                	</div>
             	</div>
             </div>
        </div>
        </c:forEach>
        <!-- 영화 가져오기 끝 -->     
        </div>

    </section><!-- End Speakers Section -->
  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">
    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-3 col-md-6 footer-info">
            <img src="resources/assets/img/tttlogo.png" alt="TheEvenet" width="200" height="1200">
            <p></p>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>Useful Links</h4>
            <ul>
              <li><i class="bi bi-chevron-right"></i> <a href="index">홈으로</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="team">팀 소개</a></li>
              <li><i class="bi bi-chevron-right"></i> <a href="services">서비스</a></li> <!-- 홈페이지 설명 -->
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-contact">
            <h4>Contact Us</h4>
            <p>
              인천 미추홀구 매소홀로488번길 6-32<br>
              인천 미추홀구 학익동 663-1 태승빌딩 4층<br>
              <strong>Phone:</strong> 032)876-3332<br>
              <strong>Email:</strong> iciateam2@google.com<br>
            </p>

          </div>

        </div>
      </div>
    </div>

    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong>ICIA</strong>. All Rights Reserved
      </div>
      <div class="credits">
        <!--
        All the links in the footer should remain intact.
        You can delete the links only if you purchased the pro version.
        Licensing information: https://bootstrapmade.com/license/
        Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=TheEvent
      -->
        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
      </div>
    </div>
  </footer><!-- End  Footer -->

  <a href="quickRes" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-ticket-detailed">빠른 예매</i></a>

  <!-- Vendor JS Files -->
  <script src="resources/assets/vendor/aos/aos.js"></script>
  <script src="resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="resources/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="resources/assets/js/main.js"></script>

</body>

</html>