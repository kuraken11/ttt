<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="kr">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>TTT_회원상세정보</title>
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
  <link href="resources/assets2/css/style.css" rel="stylesheet">
  
  <!-- 예매 취소 -->
  <script>
  	function deleteRes(seq){
  		
  		let conf = confirm('정말로 취소하시겠습니까?');
  		
  		if(conf){
  			location.href = "deleteRes?res_Seq=" + seq
  		} else {
  			alert('취소하셨습니다.')
  		}
  		
  	}
  </script>
  

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

            <!-- Page Heading -->
            <h1 class="h3 mb-4 text-gray-800"><span>${view.memId}</span>님의 상세정보</h1>
					
            <div class="card shadow mb-4" style="width:65%;">
                  <div class="card-header py-3">
                       <h6 class="m-0 font-weight-bold text-primary">${view.memId}님의 상세정보</h6>
                  </div>
                  <div class="card-body">
                       <div class="table-responsive">
					       <table class="table table-bordered" id="dataTable" cellspacing="0">

							<tr>
								<th>아이디</th>
								<td>${view.memId}</td>
							</tr>
						
							<c:choose>
							<c:when test="${loginId eq view.memId||loginId eq 'admin'}">
								<tr>
									<th>비밀번호</th>
									<td>${view.memPw}</td>
								</tr>
							</c:when>
							<c:otherwise>
							
							</c:otherwise>
							</c:choose>
						
							<c:choose>
							<c:when test="${loginId eq view.memId||loginId eq 'admin'}">
								<tr>
									<th>이름</th>
									<td>${view.memName}</td>
								</tr>
							</c:when>
							<c:otherwise>
							
							</c:otherwise>
							</c:choose>
						
							<tr>
								<th>생년월일</th>
								<td>${view.memBirth}</td>
							</tr>
						
							<tr>
								<th>이메일</th>
								<td>${view.memEmail}</td>
							</tr>
						
							<c:choose>
							<c:when test="${loginId eq view.memId||loginId eq 'admin'}">
							<tr>
								<th>연락처</th>
								<td>${view.memPhone}</td>
							</tr>
							</c:when>
							<c:otherwise>
							
							</c:otherwise>
							</c:choose>
						
							<c:choose>
							<c:when test="${loginId eq view.memId||loginId eq 'admin'}">
								<tr>
									<th colspan="2">
										&nbsp;&nbsp;
										<input type="button" value="회원 정보 수정" onclick="location.href='mModiForm?memId=${view.memId}'" style="background-color:red; color:white;"/>
										&nbsp;
										<input type="button" value="탈퇴" onclick="mDelete()" style="background-color:red; color:white;"/>
										<script>
											function mDelete(){
												let conf = confirm('탈퇴하시겠습니까?')
												
												if(conf){
													location.href='mDelete?memId=' + ${view.memId}
												}else{
													alert('취소하셨습니다.')
												}
											}
										</script>
									</th>
								</tr>

							</c:when>
							<c:otherwise>
								<tr>
									<th colspan="2">다른 사용자는 이용 불가능한 기능입니다.</th>
								</tr>
							</c:otherwise>
							</c:choose>
							
					</table>
					</div></div></div>

				</div>
                <!-- /.container-fluid -->
                <section id="buy-tickets" class="section-with-bg">
      			<div class="container" data-aos="fade-up">
				<div class="section-header">
          			<h2>예매 목록</h2>
        		</div>
        		<div class="row">
                
                <c:forEach var="list" items="${Ticket}">
                <div class="col-lg-4" data-aos="fade-up" data-aos-delay="100" style="margin-bottom:20px;">
            		<div class="card mb-5 mb-lg-0">
					<div class="card-body text-center" style="border-radius:30px; background-color:black;">
						
						<hr/>
						<h3 style="font-weight:bold; color:white;">${list.res_Mvname}</h3>
						<hr/>
						<h4 style="font-weight:bold; color:white;">${list.res_Loc2} | ${list.res_Theater} | ${list.res_Type} </h4>
						<h2 style="font-weight:bold; color:white;">${list.res_Seet}</h2><button class="text-center" type="button" onclick="deleteRes(${list.res_Seq})" style="background-color:red; color:white;">예매 취소</button>
						<h4 style="font-weight:bold; color:white;">${list.res_Day} | ${list.res_Start}</h4>
						<h3 style="font-weight:bold; color:white;">결제금액: ${list.res_Price} 원</h3>
						<h2 style="font-weight:bold; color:red;">TTT</h2>
						<img src="resources/assets/img/바코드.png" width="200px" height="60px"/>
						<br/>
					</div></div></div>
			    </c:forEach>
			    </div></div></section>


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