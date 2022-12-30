<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="kr">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>TTT_전체극장</title>
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
    
    <h1>전체 극장</h1>

	<div class="col-sm-6">
		<label>지역</label>
			<select class="form-control" onchange="setTheater(this.value)">
				<option selected>지역</option>
				<option>서울</option>
				<option>경기</option>
				<option>인천</option>
				<option>대전/충청/세종</option>
				<option>부산/대구/경상</option>
				<option>광주/전라</option>
				<option>강원</option>
			</select>
	</div>
    <br/>
	<label>극장</label>
	<div class="col-sm-6" id="loc2">
				
	</div>
	
	<br/>
	<div class="col-sm-6">
		<label>날짜</label>
			<select class="form-control" onchange="test(this.value)">
				<option selected>날짜 선택</option>
				<option>2022-12-19</option>
				<option>2022-12-20</option>
				<option>2022-12-21</option>
				<option>2022-12-22</option>
				<option>2022-12-23</option>
				<option>2022-12-24</option>
				<option>2022-12-25</option>
			</select>
	</div>
	
	<div>
		<span id="TheaterListArea"></span>
	</div>
	
	<div style="width:100%; height:300px; background-color:white;">
    
    </div>
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
<script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous"></script>
<script>

function setTheater(loc1) {
	if (loc1 == '서울') {
		$("#loc2").html(
				"<select class='form-control' id='the_Loc2'>"
						+ "<option selected>극장 - 서울</option>"
						+ "<option>강남</option>"
						+ "<option>강남대로(씨티)</option>"
						+ "<option>강동</option>" + "<option>군자</option>"
						+ "<option>더 부티크 목동현대백화점</option>"
						+ "<option>동대문</option>"
						+ "<option>마곡</option>" + "<option>목동</option>"
						+ "<option>상봉</option>"
						+ "<option>상암월드컵경기장</option>)"
						+ "<option>성수</option>"
						+ "<option>센트럴</option>"
						+ "<option>송파파크하비오</option>"
						+ "<option>신촌</option>" + "<option>이수</option>"
						+ "<option>창동</option>"
						+ "<option>코엑스</option>"
						+ "<option>홍대</option>" + "<option>화곡</option>"
						+ "<option>ARTNINE</option>" + "</select>");
	} else if (loc1 == '경기') {
		$("#loc2").html(
				"<select class='form-control' id='the_Loc2'>"
						+ "<option selected>극장 - 경기</option>"
						+ "<option>고양스타필드</option>"
						+ "<option>광명AK플라자</option>"
						+ "<option>광명소하</option>"
						+ "<option>금정AK플라자</option>"
						+ "<option>김포한강신도시</option>"
						+ "<option>남양주</option>"
						+ "<option>남양주현대아울렛 스페이스원</option>"
						+ "<option>동탄</option>"
						+ "<option>미사강변</option>"
						+ "<option>백석</option>)"
						+ "<option>별내</option>"
						+ "<option>부천스타필드시티</option>"
						+ "<option>분당</option>" + "<option>수원</option>"
						+ "<option>수원남문</option>"
						+ "<option>수원호매실</option>"
						+ "<option>시흥배곧</option>"
						+ "<option>안산중앙</option>"
						+ "<option>안성스타필드</option>"
						+ "<option>양주</option>" + "<option>영통</option>"
						+ "<option>용인기흥</option>"
						+ "<option>용인테크노밸리</option>"
						+ "<option>의정부민락</option>"
						+ "<option>일산</option>"
						+ "<option>일산벨라시타</option>"
						+ "<option>킨텍스</option>"
						+ "<option>파주금촌</option>"
						+ "<option>파주운정</option>"
						+ "<option>파주출판도시</option>"
						+ "<option>하남스타필드</option>" + "</select>");
	} else if (loc1 == '인천') {
		$("#loc2").html(
				"<select class='form-control' id='the_Loc2'>"
						+ "<option selected>극장 - 인천</option>"
						+ "<option>검단</option>" + "<option>송도</option>"
						+ "<option>영종</option>"
						+ "<option>인천논현</option>"
						+ "<option>청라지젤</option>" + "</select>");
	} else if (loc1 == '대전/충청/세종') {
		$("#loc2").html(
				"<select class='form-control' id='the_Loc2'>"
						+ "<option selected>극장 - 대전/충청/세종</option>"
						+ "<option>공주</option>" + "<option>논산</option>"
						+ "<option>대전</option>"
						+ "<option>대전신세계 아트앤사이언스</option>"
						+ "<option>대전유성</option>"
						+ "<option>대전현대아울랫</option>"
						+ "<option>세종(조치원)</option>"
						+ "<option>세종나성</option>"
						+ "<option>세종청사</option>"
						+ "<option>오창</option>" + "<option>제천</option>"
						+ "<option>진천</option>" + "<option>천안</option>"
						+ "<option>청주사창</option>"
						+ "<option>충주</option>"
						+ "<option>홍성내포</option>" + "</select>");
	} else if (loc1 == '부산/대구/경상') {
		$("#loc2").html(
				"<select class='form-control' id='the_Loc2'>"
						+ "<option selected>극장 - 부산/대구/경상</option>"
						+ "<option>경북도청</option>"
						+ "<option>경산하양</option>"
						+ "<option>경주</option>"
						+ "<option>구미강동</option>"
						+ "<option>김천</option>"
						+ "<option>남포항</option>"
						+ "<option>대구신세계(동대구)</option>"
						+ "<option>대구이시아</option>"
						+ "<option>덕천</option>" + "<option>마산</option>"
						+ "<option>문경</option>"
						+ "<option>부산극장</option>"
						+ "<option>부산대</option>"
						+ "<option>북대구(칠곡)</option>"
						+ "<option>사상</option>"
						+ "<option>삼천포</option>"
						+ "<option>양산</option>"
						+ "<option>양산라피에스타</option>"
						+ "<option>울산</option>" + "<option>정관</option>"
						+ "<option>진주(중안)</option>"
						+ "<option>창원</option>"
						+ "<option>찬원내서</option>"
						+ "<option>포항</option>"
						+ "<option>해운대(장산)</option>" + "</select>");
	} else if (loc1 == '광주/전라') {
		$("#loc2").html(
				"<select class='form-control' id='the_Loc2'>"
						+ "<option selected>극장 - 광주/전라</option>"
						+ "<option>광주상무</option>"
						+ "<option>광주하남</option>"
						+ "<option>목포하당(포르모)</option>"
						+ "<option>송천</option>" + "<option>순천</option>"
						+ "<option>여수뭉천</option>"
						+ "<option>전대(광주)</option>"
						+ "<option>전주혁신</option>"
						+ "<option>첨단</option>" + "</select>");
	} else if (loc1 == '강원') {
		$("#loc2").html(
				"<select class='form-control' id='the_Loc2'>"
						+ "<option selected>극장 - 강원</option>"
						+ "<option>남춘천</option>"
						+ "<option>속초</option>" + "<option>원주</option>"
						+ "<option>원주센트럴</option>"
						+ "<option>춘천석사</option>" + "</select>");
	} else {
		
	}
}

function TheaterList(list){
	
	document.getElementById("TheaterListArea").innerHTML = "";
	
	let output= "";
	let outputLike ="";
	
	output += "";
	output += "<div class='card shadow mb-4'>";
	output += "<div class='card-header py-3'>";
	output += "<h6 class='m-0 font-weight-bold text-primary'>상영 정보</h6>";
	output += "</div>";
	output += "<div class='card-body'>";
	output += "<div class='table-responsive'>";
	output += "<table class='table table-bordered' id='dataTable' width='70%' cellspacing='0'>";
	output += "<tr>";
	output += "<th>영화 이름</th>";
	output += "<th>영화 타입</th>";
	output += "<th>상영관</th>";
	output += "<th>관람시작시간</th>";
	output += "<th>관람끝시간</th>";
	output += "<th>여분 좌석</th>";
	output += "<th>전체 좌석</th>";
	output += "<th>관람가</th>";
	output += "</tr>";
	
	for(let i in list){
		output += "<tr>";
		output += "<td>"+ list[i].the_Name+"</td>";
		output += "<td>"+ list[i].the_Type+"</td>";
		output += "<td>"+ list[i].the_Theater+"</td>";
		output += "<td>"+ list[i].the_Start+"</td>";
		output += "<td>"+ list[i].the_End+"</td>";
		output += "<td>"+ list[i].the_Seet+"</td>";
		output += "<td>"+ list[i].the_Allseet+"</td>";
		output += "<td>"+ list[i].the_Age+"</td>";
		//output += "<td><span id=\"TheaterInfoArea"+list[i].the_Name+"\">정보</td>"
		output += "</tr>";			
	}
	
	output += "</table>";
	output += "</div>";
	output += "</div>";
	output += "</div>";
	
	document.getElementById("TheaterListArea").innerHTML = output;
} // 수정할 필요가 있음 합칠때

function test(date){
	let loc = $('#the_Loc2').val();
	console.log(date)
	console.log(loc)
	
	$.ajax({
		type : "POST",
		url : "trDate",
		data : {
			"the_Day" : date,
			"the_Loc2" : loc
		},
		dataType : "json",
		success : function(list) {
			
			TheaterList(list);
			// 영화 이름 가져오기 그리고 영화이름과 그 지역에 대한 정보 끌어서 나열
			// 이것을 영화 갯수 만큼 반복 
		},
		error : function() {
			alert("극장 정보 불러오기 통신 실패!");
		}
	});
}

</script>

</html>