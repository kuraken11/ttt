<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="kr">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>TTT_좌석선택</title>
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
  
  <!-- New CSS File -->
  <link href="resources/assets/css/oh.css" rel="stylesheet">
  
  <!-- Ajax -->
  <script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous"></script>

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

  <!-- ======= 메인: 현재 최고 인기 영화 링크  ======= -->
  <section id="hero">
    <div class="hero-container" data-aos="zoom-in" data-aos-delay="100">
      
    	<div class="text-center" style="width:80%; height:470px; color:white; border-radius:150px; margin-left:10%;">
    		<h3 style="color:white;">선택한 영화정보</h3>
    		<img src="resources/assets/poster/${theater.the_PosterName}" width="180px" height="240px"/>
    		<p>${theater.the_Name}</p>
    		<p>${theater.the_Loc2} | ${theater.the_Theater}</p>
    		<p>${theater.the_Age}관람가 | ${theater.the_Type} | ${theater.the_Day}</p>
    		<p>${theater.the_Start} ~ ${theater.the_End}</p>
    	</div>
    </div>
  </section><!-- End Hero Section -->

  <!-- ======= 메인 ======= -->
  <main id="main">
  	<br/>

    <h1>좌석 선택</h1>
    <hr/>
    <c:choose>
    <c:when test="${loginId ne null}">
    
    </c:when>
    <c:otherwise>
    	<script>
    		alert('로그인 후 이용해주세요!');
    		location.href = "mLoginForm";
    	</script>
    </c:otherwise>
    </c:choose>
    
    <input type="hidden" id="the_Id" value="${loginId}"/>
    <input type="hidden" id="the_Name" value="${theater.the_Name}"/>
    <input type="hidden" id="the_Loc2" value="${theater.the_Loc2}"/>
    <input type="hidden" id="the_Theater" value="${theater.the_Theater}"/>
    <input type="hidden" id="the_Type" value="${theater.the_Type}"/>
    <input type="hidden" id="the_Day" value="${theater.the_Day}"/>
    <input type="hidden" id="the_Start" value="${theater.the_Start}"/>
    <input type="hidden" id="the_End" value="${theater.the_End}"/>
    
    	<br/>
    	<div class="text-center" style="width:60%; height:100px; border:solid 1px black; border-radius:150px; margin-left:20%;">
    		<h3>좌석 구분</h3>
    		<button type="button" style="width:100px; height:40px; border:solid 1px black; background-color:greenyellow;">선택 가능</button>
    		<button type="button" style="width:100px; height:40px; border:solid 1px black;">선택 불가</button>
    		<button type="button" style="width:100px; height:40px; border:solid 1px black; background-color:aqua;">선택한 좌석</button>
    		<!--  background-color:red; -->
    	</div>
    	<br/>
    	
    	<div>
    		<h3 class="text-center">관람료 안내 ※주의: 입장시 관람비용과 연령, 인원 수가 맞지 않는 경우 입장이 제한될 수 있습니다.</h3>
    		<h4 class="text-center">2D 성인: 10000원/ 청소년: 8000원/ 어린이: 무료</h4>
    		<h4 class="text-center">3D 성인: 11000원/ 청소년: 9000원/ 어린이: 무료</h4>
    	</div>
    	

    <div class="text-center" style="border-radius:150px;"> <!--인원 선택. 아이콘 필요-->
        <span style="width:60px; height:30px;font-size:25px;">어른 </span>&nbsp;&nbsp;<button type="button" onclick="upAdult()" style="width:50px; height:30px; line-height:30px; font-size:30px;">+</button><span id="adult" style="font-size:25px;"> 0 </span><button type="button" onclick="downAdult()" style="width:50px; height:30px; line-height:30px; font-size:30px;">-</button>&nbsp;
        <span style="width:60px; height:30px;font-size:25px;">청소년 </span>&nbsp;&nbsp;<button type="button" onclick="upYouth()" style="width:50px; height:30px; line-height:30px; font-size:30px;">+</button><span id="youth" style="font-size:25px;"> 0 </span><button type="button" onclick="downYouth()" style="width:50px; height:30px; line-height:30px; font-size:30px;">-</button>&nbsp;
        <span style="width:60px; height:30px;font-size:25px;">어린이 </span>&nbsp;&nbsp;<button type="button" onclick="upChild()" style="width:50px; height:30px; line-height:30px; font-size:30px;">+</button><span id="child" style="font-size:25px;"> 0 </span><button type="button" onclick="downChild()" style="width:50px; height:30px; line-height:30px; font-size:30px;">-</button>&nbsp;
        <span style="width:60px; height:30px; font-size:25px;">결제금액</span>&nbsp;&nbsp;&nbsp;<span id="pay" style="font-size:25px;"> 0 </span><span style="font-size:25px;">원</span>
    </div>
    
    <br/>
    <div>
    
    <!-- <button id="creditButton" type="button" onclick="init()"
    style="width:200px; height:70px; background-color:red;
	font-weight: bold; font-size: 30px; border-radius:150px; margin-bottom:20px; margin-right:100px; float:right;"><i class="bi bi-cash-coin"></i>&nbsp;&nbsp;좌석 선택</button> -->

    </div>
	<br/>
	<div class="text-center">
	<br/>
	<h1 class="text-center"> Screen </h1>
	<br/>
	<button type="button" class="forCheck">A</button>
    <button type="button" class="seet" name="A-1" value="A-1">A-1</button>
    <button type="button" class="seet" name="A-2" value="A-2">A-2</button>
    <button type="button" class="seet" name="A-3" value="A-3">A-3</button>
    <button type="button" class="seet" name="A-4" value="A-4">A-4</button>
    <button type="button" class="seet" name="A-5" value="A-5">A-5</button>
    <button type="button" class="seet" name="A-6" value="A-6">A-6</button>
    <button type="button" class="seet" name="A-7" value="A-7">A-7</button>
    <button type="button" class="seet" name="A-8" value="A-8">A-8</button>
    <button type="button" class="seet" name="A-9" value="A-9">A-9</button>
    <button type="button" class="seet" name="A-10" value="A-10">A-10</button>
    <br/>
    <button type="button" class="forCheck">B</button>
    <button type="button" class="seet" name="B-1" value="B-1">B-1</button>
    <button type="button" class="seet" name="B-2" value="B-2">B-2</button>
    <button type="button" class="seet" name="B-3" value="B-3">B-3</button>
    <button type="button" class="seet" name="B-4" value="B-4">B-4</button>
    <button type="button" class="seet" name="B-5" value="B-5">B-5</button>
    <button type="button" class="seet" name="B-6" value="B-6">B-6</button>
    <button type="button" class="seet" name="B-7" value="B-7">B-7</button>
    <button type="button" class="seet" name="B-8" value="B-8">B-8</button>
    <button type="button" class="seet" name="B-9" value="B-9">B-9</button>
    <button type="button" class="seet" name="B-10" value="B-10">B-10</button>
    <br/>
    <button type="button" class="forCheck">C</button>
    <button type="button" class="seet" name="C-1" value="C-1">C-1</button>
    <button type="button" class="seet" name="C-2" value="C-2">C-2</button>
    <button type="button" class="seet" name="C-3" value="C-3">C-3</button>
    <button type="button" class="seet" name="C-4" value="C-4">C-4</button>
    <button type="button" class="seet" name="C-5" value="C-5">C-5</button>
    <button type="button" class="seet" name="C-6" value="C-6">C-6</button>
    <button type="button" class="seet" name="C-7" value="C-7">C-7</button>
    <button type="button" class="seet" name="C-8" value="C-8">C-8</button>
    <button type="button" class="seet" name="C-9" value="C-9">C-9</button>
    <button type="button" class="seet" name="C-10" value="C-10">C-10</button>
    <br/>
    <button type="button" class="forCheck">D</button>
    <button type="button" class="seet" name="D-1" value="D-1">D-1</button>
    <button type="button" class="seet" name="D-2" value="D-2">D-2</button>
    <button type="button" class="seet" name="D-3" value="D-3">D-3</button>
    <button type="button" class="seet" name="D-4" value="D-4">D-4</button>
    <button type="button" class="seet" name="D-5" value="D-5">D-5</button>
    <button type="button" class="seet" name="D-6" value="D-6">D-6</button>
    <button type="button" class="seet" name="D-7" value="D-7">D-7</button>
    <button type="button" class="seet" name="D-8" value="D-8">D-8</button>
    <button type="button" class="seet" name="D-9" value="D-9">D-9</button>
    <button type="button" class="seet" name="D-10" value="D-10">D-10</button>
    <br/>
    <button type="button" class="forCheck">E</button>
    <button type="button" class="seet" name="E-1" value="E-1">E-1</button>
    <button type="button" class="seet" name="E-2" value="E-2">E-2</button>
    <button type="button" class="seet" name="E-3" value="E-3">E-3</button>
    <button type="button" class="seet" name="E-4" value="E-4">E-4</button>
    <button type="button" class="seet" name="E-5" value="E-5">E-5</button>
    <button type="button" class="seet" name="E-6" value="E-6">E-6</button>
    <button type="button" class="seet" name="E-7" value="E-7">E-7</button>
    <button type="button" class="seet" name="E-8" value="E-8">E-8</button>
    <button type="button" class="seet" name="E-9" value="E-9">E-9</button>
    <button type="button" class="seet" name="E-10" value="E-10">E-10</button>
    <br/>
    <button type="button" class="forCheck">F</button>
    <button type="button" class="seet" name="F-1" value="F-1">F-1</button>
    <button type="button" class="seet" name="F-2" value="F-2">F-2</button>
    <button type="button" class="seet" name="F-3" value="F-3">F-3</button>
    <button type="button" class="seet" name="F-4" value="F-4">F-4</button>
    <button type="button" class="seet" name="F-5" value="F-5">F-5</button>
    <button type="button" class="seet" name="F-6" value="F-6">F-6</button>
    <button type="button" class="seet" name="F-7" value="F-7">F-7</button>
    <button type="button" class="seet" name="F-8" value="F-8">F-8</button>
    <button type="button" class="seet" name="F-9" value="F-9">F-9</button>
    <button type="button" class="seet" name="F-10" value="F-10">F-10</button>
    <br/>
    <button type="button" class="forCheck">G</button>
    <button type="button" class="seet" name="G-1" value="G-1">G-1</button>
    <button type="button" class="seet" name="G-2" value="G-2">G-2</button>
    <button type="button" class="seet" name="G-3" value="G-3">G-3</button>
    <button type="button" class="seet" name="G-4" value="G-4">G-4</button>
    <button type="button" class="seet" name="G-5" value="G-5">G-5</button>
    <button type="button" class="seet" name="G-6" value="G-6">G-6</button>
    <button type="button" class="seet" name="G-7" value="G-7">G-7</button>
    <button type="button" class="seet" name="G-8" value="G-8">G-8</button>
    <button type="button" class="seet" name="G-9" value="G-9">G-9</button>
    <button type="button" class="seet" name="G-10" value="G-10">G-10</button>
    <br/>
    <button type="button" class="forCheck">H</button>
    <button type="button" class="seet" name="H-1" value="H-1">H-1</button>
    <button type="button" class="seet" name="H-2" value="H-2">H-2</button>
    <button type="button" class="seet" name="H-3" value="H-3">H-3</button>
    <button type="button" class="seet" name="H-4" value="H-4">H-4</button>
    <button type="button" class="seet" name="H-5" value="H-5">H-5</button>
    <button type="button" class="seet" name="H-6" value="H-6">H-6</button>
    <button type="button" class="seet" name="H-7" value="H-7">H-7</button>
    <button type="button" class="seet" name="H-8" value="H-8">H-8</button>
    <button type="button" class="seet" name="H-9" value="H-9">H-9</button>
    <button type="button" class="seet" name="H-10" value="H-10">H-10</button>
    <br/>
    <button type="button" class="forCheck">I</button>
    <button type="button" class="seet" name="I-1" value="I-1">I-1</button>
    <button type="button" class="seet" name="I-2" value="I-2">I-2</button>
    <button type="button" class="seet" name="I-3" value="I-3">I-3</button>
    <button type="button" class="seet" name="I-4" value="I-4">I-4</button>
    <button type="button" class="seet" name="I-5" value="I-5">I-5</button>
    <button type="button" class="seet" name="I-6" value="I-6">I-6</button>
    <button type="button" class="seet" name="I-7" value="I-7">I-7</button>
    <button type="button" class="seet" name="I-8" value="I-8">I-8</button>
    <button type="button" class="seet" name="I-9" value="I-9">I-9</button>
    <button type="button" class="seet" name="I-10" value="I-10">I-10</button>
    <br/>
    <button type="button" class="forCheck">J</button>
    <button type="button" class="seet" name="J-1" value="J-1">J-1</button>
    <button type="button" class="seet" name="J-2" value="J-2">J-2</button>
    <button type="button" class="seet" name="J-3" value="J-3">J-3</button>
    <button type="button" class="seet" name="J-4" value="J-4">J-4</button>
    <button type="button" class="seet" name="J-5" value="J-5">J-5</button>
    <button type="button" class="seet" name="J-6" value="J-6">J-6</button>
    <button type="button" class="seet" name="J-7" value="J-7">J-7</button>
    <button type="button" class="seet" name="J-8" value="J-8">J-8</button>
    <button type="button" class="seet" name="J-9" value="J-9">J-9</button>
    <button type="button" class="seet" name="J-10" value="J-10">J-10</button>
    </div>
    <br/>
    
    <h3 style="margin-left:60px;">선택한 좌석 목록</h3>
    <div id="checkSelect" style="font-size: 20px; margin-left:60px;"></div>
    
    <button id="creditButton" type="button" onclick="doPay()"
    style="width:200px; height:70px; background-color:red;
	font-weight: bold; font-size: 30px; border-radius:150px; margin-bottom:20px; margin-right:100px; float:right;"><i class="bi bi-cash-coin"></i>&nbsp;&nbsp;결제</button>
    
    <div style="width:100%; height:300px; background-color:white;">
    
    </div>
    
  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer" style="clear:both;">
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

  </body>

  <!-- Vendor JS Files -->
  <script src="resources/assets/vendor/aos/aos.js"></script>
  <script src="resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="resources/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="resources/assets/js/main.js"></script>
  
  <!-- set Ajax -->
  <script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
	
  <!-- My Scripts -->
  <script>
    //선택한 좌석 모음
    let selectedSeet = [];

    //모두 동일한 클래스로 시작
    let seet = document.getElementsByClassName("seet");
	
	//필요한 정보
	//각 인원 수. 애기들도 좌석 수는 세워야 해서 더해줘야 함
    let adultCnt = 0;
    let youthCnt = 0;
    let childCnt = 0;
    let sumCnt = 0;

    //총 결제금액. 어린이 무료, 2d 청소년 = 8000, 어른 = 10000/ 3d 청소년 = 9000, 어른 = 11000 
    
    let pay = 0;

    let res_Id = document.getElementById("the_Id").value;
    let res_Day = document.getElementById("the_Day").value;
	let res_Mvname = document.getElementById("the_Name").value;
    let res_Loc2 = document.getElementById("the_Loc2").value;
    let res_Theater = document.getElementById("the_Theater").value;
    let res_Type = document.getElementById("the_Type").value;
    let res_End = document.getElementById("the_End").value;
    let res_Start = document.getElementById("the_Start").value;
    let res_Person = sumCnt;
    let res_Adult = adultCnt;
    let res_Youth = youthCnt;
    let res_Child = childCnt;
    let res_Price = pay;
    
    console.log("res_Datas: " + res_Id + res_Day + res_Mvname + res_Loc2 + res_Theater + res_Type + res_End + res_Start
    		+ res_Person + res_Adult + res_Youth + res_Child + res_Price);
    
    function handleClick(event) {

        if (event.target.classList[2] === "clicked") {
            
            event.target.classList.remove("clicked");
        
            for (let i = 0; i < selectedSeet.length; i++) {
                if (selectedSeet[i] === event.target.value) {
                    selectedSeet.splice(i, 1);
                    i--;
                }
            }
        
        } else {
        
            event.target.classList.add("clicked");

            selectedSeet.push(event.target.value);
        
            if (selectedSeet.length > 8) {
                alert('좌석은 한 번에 여덟개 까지만 선택할 수 있습니다!')
                selectedSeet.pop();
                event.target.classList.remove("clicked");
            }
        }
        
        let seetList = "";

        for(let i = 0; i < selectedSeet.length; i++){
            if(i != (selectedSeet.length-1)){
                seetList += selectedSeet[i] + ", ";
            } else {
                seetList += selectedSeet[i];
            }
        }

        document.getElementById("checkSelect").innerHTML = seetList;
        
    }
    
    let setColorCnt = 0;
    
    $(document).ready(init());
    
  //좌석 색상 부여
    function setColor(seetName){
       
       let res_Seet = seetName
       
       $.ajax({
				type : "POST",
				url : "setColor",
				data: {
					"res_Day" : res_Day,
					"res_Mvname" : res_Mvname,
					"res_Loc2" : res_Loc2,
                    "res_Theater" : res_Theater,
                    "res_Type" : res_Type,
                    "res_Seet" : res_Seet,
                    "res_Start" : res_Start,
                    "res_End" : res_End
				},
				async : false,
				dataType : "text",
				success : function(result){
					
					if(result == 'OK'){
						
                        seet[setColorCnt].classList.add('test');
                        setColorCnt++;
                        
                        
                    } else {
                        //seet[setColorCnt].classList.add('test2');
                        setColorCnt++;
                        
                    }
					
				},
				error : function() {
					
					console.log(result)
				}
				
		});	
    }
	
    
	function init() {
	
        for (var i = 0; i < seet.length; i++) {
            setColor(seet[i].value);
        }    
        
        let test = document.getElementsByClassName("test");
        
        for (var i = 0; i < test.length; i++) {
            test[i].addEventListener("click", handleClick);
        }

    }

    
    //결제
    //인원 수와 좌석 수가 맞으면 예매에 필요한 정보 전부 전송해서 예매 테이블에 insert
    //로그인아이디 날짜 영화이름 극장이름 상영관 타입 끝나는/시작 시간 총인원 어른 청소년 어린이 결제금액 예매좌석
    function doPay(){
    	
		let conf = confirm('결제하시겠습니까?');
		
		if(conf){
			
			if(selectedSeet.length != sumCnt){
	    		alert('선택한 인원과 좌석 수가 맞지 않습니다!')
	    	} else {
	    	    
	    	    for(let i = 0; i < selectedSeet.length; i++){
	    	    	
	    	       let res_Seet = selectedSeet[i];  
				
	    	       $.ajax({
	    					type : "POST",
	    					url : "doPay",
	    					data: {
	    						"res_Id" : res_Id,
	    						"res_Day" : res_Day,
	    						"res_Mvname" : res_Mvname,
	    						"res_Loc2" : res_Loc2,
	    	                    "res_Theater" : res_Theater,
	    	                    "res_Type" : res_Type,
	    	                    "res_Seet" : res_Seet,
	    	                    "res_Start" : res_Start,
	    	                    "res_End" : res_End,
	    	                    "res_Person" : res_Person,
	    		    	        "res_Adult" : res_Adult,
	    		    	        "res_Youth" : res_Youth,
	    		    	        "res_Child" : res_Child,
	    		    	        "res_Price" : res_Price,
	    		    	        "res_Seet" : res_Seet
	    					},
	    					async : false,
	    					dataType : "text",
	    					success : function(result){
	    						
	    						if(result = "OK"){
	    							location.href = "myPage?memId=" + res_Id;
	    	                        
	    	                    } else {
	    	                        alert('이미 예약된 좌석이 있습니다!')
	    	                    }
	    						
	    					},
	    					error : function() {
	    						alert("doPay 함수 통신실패!");
	    					}
	    					
	    			});
	    	    }
	    	}
			
			//location.href = "myPage?memId=" + res_Id;

		} else {
			alert('취소하셨습니다.')
		}

    }

    //결제금액 상시 계산
    //띄우는 창 id를 pay로

    //어른 수 증감
    function upAdult(){
        
        adultCnt += 1; 

        document.getElementById('adult').innerHTML = adultCnt;

        if(res_Type == '2D'){
            pay += 10000;
        } else {
            pay += 11000;
        }

        document.getElementById('pay').innerHTML = pay;
        sumCnt = adultCnt + youthCnt + childCnt;
        
        res_Adult = adultCnt;
        res_Price = pay;
        res_Person = sumCnt;
    }

    function downAdult(){
	
    	if (adultCnt==0) {
			alert('뺄 인원 수 가 없습니다')
		} else {
			if(res_Type == '2D'){
   	        	 pay -= 10000
   	    	 } else {
   	   	      pay -= 11000;
    		 } 
			adultCnt -= 1; 
		}
		
        document.getElementById('adult').innerHTML = adultCnt;
		
        document.getElementById('pay').innerHTML = pay;
        sumCnt = adultCnt + youthCnt + childCnt;
        
        res_Adult = adultCnt;
        res_Price = pay;
        res_Person = sumCnt;

    }

    //청소년 수 증감
    function upYouth(){
    	
        youthCnt += 1; 

        document.getElementById('youth').innerHTML = youthCnt;

        if(res_Type == '2D'){
            pay += 8000;
        } else {
            pay += 9000;
        }

        document.getElementById('pay').innerHTML = pay;
        sumCnt = adultCnt + youthCnt + childCnt;
        
        res_Youth = youthCnt;
        res_Price = pay;
        res_Person = sumCnt;
    }

    function downYouth(){
    	
    	if (youthCnt==0) {
			alert('뺄 인원 수 가 없습니다')
		} else {
			if(res_Type == '2D'){
   	        	 pay -= 8000;
   	    	 } else {
   	   	      pay -= 9000;
    		 } 
			youthCnt -= 1; 
		}
        
		document.getElementById('youth').innerHTML = youthCnt;
        document.getElementById('pay').innerHTML = pay;
        sumCnt = adultCnt + youthCnt + childCnt;
        
        res_Youth = youthCnt;
        res_Price = pay;
        res_Person = sumCnt;
    }

    //어린이 수 증감
    function upChild(){
    	
        childCnt += 1; 
        document.getElementById('child').innerHTML = childCnt;
        sumCnt = adultCnt + youthCnt + childCnt;
        
        res_Child = chileCnt;
        res_Price = pay;
        res_Person = sumCnt;

    }

    function downChild(){
    	
        if (childCnt==0) {
			alert('뺄 인원 수 가 없습니다')
		} else {
			childCnt -= 1;
		}
		document.getElementById('child').innerHTML = childCnt;
		sumCnt = adultCnt + youthCnt + childCnt;
		
		res_Child = chileCnt;
        res_Price = pay;
        res_Person = sumCnt;
    }
    
</script>

</html>