<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="kr">

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>TTT_빠른예매</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="resources/assets/img/favicon.png" rel="icon">
<link href="resources/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Raleway:300,400,500,700,800"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="resources/assets/vendor/aos/aos.css" rel="stylesheet">
<link href="resources/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="resources/assets/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="resources/assets/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="resources/assets/css/style.css" rel="stylesheet">

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
				<a href="index" class="scrollto"><img
					src="resources/assets/img/tttlogo.png" alt="TheEvenet" width="200"
					height="1200"></a>
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
	
	<!-- ======= 메인 ======= -->

	<main id="main">

		<div class="page-header mt-3">
			<h2>영화 예매</h2>
		</div>
		<p class="lead">날짜와 영화, 지역, 극장을 선택해 예매할 시간을 확인하세요! 예매할 시간을 선택하면 좌석 선택으로 이동합니다!</p>
		<hr>
		<!-- 예매 후 좌석 선택으로 -->
			<div class="form-group row">
				<div class="col-sm-6 mb-3 mb-sm-0">
				<label>날짜</label>
					<select class="form-control" id="the_Day">
						<option selected>2022-12-19</option>
						<option>2022-12-20</option>
						<option>2022-12-21</option>
						<option>2022-12-22</option>
						<option>2022-12-23</option>
						<option>2022-12-24</option>
						<option>2022-12-25</option>
					</select>
				</div>
				<div class="col-sm-6 mb-3 mb-sm-0">
				<label>영화</label>
					<select class="form-control" id="the_Name">
						<c:if test="${mv_Name eq null}">
						<option selected>영화 제목</option>
						</c:if>
						<c:if test="${mv_Name ne null}">
						<option selected>${mv_Name}</option>
						</c:if>
						<option>아바타:물의길</option>
						<option>올빼미</option>
						<option>세계에서 이 사랑이 사라진다 해도</option>
						<option>원피스 필름 레드</option>
						<option>라비앙 로즈</option>
						<option>나나</option>
						<option>뮤직 by SIA</option>
					</select>
				</div>
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

			</div>
			<br/>
			<label>상영 시간</label>
			<div class="form-group" id="resTime">
				
			</div>
			<div style="width:100%; height:300px; background-color:white;">
    
    </div>
			
	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<footer id="footer">
		<div class="footer-top">
			<div class="container">
				<div class="row">

					<div class="col-lg-3 col-md-6 footer-info">
						<img src="resources/assets/img/tttlogo.png" alt="TheEvenet"
							width="200" height="1200">
						<p></p>
					</div>

					<div class="col-lg-3 col-md-6 footer-links">
						<h4>Useful Links</h4>
						<ul>
							<li><i class="bi bi-chevron-right"></i> <a href="#">홈으로</a></li>
							<li><i class="bi bi-chevron-right"></i> <a href="team">팀
									소개</a></li>
							<li><i class="bi bi-chevron-right"></i> <a href="services">서비스</a></li>
							<!-- 홈페이지 설명 -->
						</ul>
					</div>

					<div class="col-lg-3 col-md-6 footer-contact">
						<h4>Contact Us</h4>
						<p>
							인천 미추홀구 매소홀로488번길 6-32<br> 인천 미추홀구 학익동 663-1 태승빌딩 4층<br>
							<strong>Phone:</strong> 032)876-3332<br> <strong>Email:</strong>
							iciateam2@google.com<br>
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
	</footer>
	<!-- End  Footer -->

	<!-- Vendor JS Files -->
	<script src="resources/assets/vendor/aos/aos.js"></script>
	<script
		src="resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="resources/assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="resources/assets/js/main.js"></script>
	
	<!-- Team Scripts -->
	<script>
		function setTheater(loc1) {
			
			document.getElementById("loc2").innerHTML = "";
			
			if (loc1 == '서울') {
				$("#loc2").html(
						"<select class='form-control' id='the_Loc2' onchange='setRes(this.value)'>"
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
						"<select class='form-control' id='the_Loc2' onchange='setRes(this.value)'>"
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
						"<select class='form-control' id='the_Loc2' onchange='setRes(this.value)'>"
								+ "<option selected>극장 - 인천</option>"
								+ "<option>검단</option>" + "<option>송도</option>"
								+ "<option>영종</option>"
								+ "<option>인천논현</option>"
								+ "<option>청라지젤</option>" + "</select>");
			} else if (loc1 == '대전/충청/세종') {
				$("#loc2").html(
						"<select class='form-control' id='the_Loc2' onchange='setRes(this.value)'>"
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
						"<select class='form-control' id='the_Loc2' onchange='setRes(this.value)'>"
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
						"<select class='form-control' id='the_Loc2' onchange='setRes(this.value)'>"
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
						"<select class='form-control' id='the_Loc2' onchange='setRes(this.value)'>"
								+ "<option selected>극장 - 강원</option>"
								+ "<option>남춘천</option>"
								+ "<option>속초</option>" + "<option>원주</option>"
								+ "<option>원주센트럴</option>"
								+ "<option>춘천석사</option>" + "</select>");
			} else {

			}
		}

		//극장 선택하면 정보를 내보내서 값을 얻어오는 거니까, 날짜, 영화이름, 극장 이렇게 세 개 보내서 가져오면 됨.
		//result는 List타입으로 곧바로 버튼 대량 생산
		//안 되면 submit 대신 onclick=seetForm(seq)으로 해줘서 event.target인가 써서 seq를 매개변수로 넣어 정보 찾아
		//찾은 정보 theater 저장해서 이동
		function setRes(loc2) {
			let the_Day = document.getElementById('the_Day').value;
			let the_Name = document.getElementById('the_Name').value;
			let the_Loc2 = document.getElementById('the_Loc2').value;

			document.getElementById("resTime").innerHTML = "";
			
			$.ajax({
						type : "POST",
						url : "setRes",
						data : {
							"the_Day" : the_Day,
							"the_Name" : the_Name,
							"the_Loc2" : the_Loc2
						},
						async : false,
						dataType : "json",
						success : function(result) {

							let output = "";

							for (let i in result) {

								output += "<button type='button' onclick='seetForm()' value="+ result[i].the_Code + " style='width:700px; height:100px; background-color:white; border-radius:150px;'>";
								output += result[i].the_Start + " ~ "
										+ result[i].the_End + " | "
										+ result[i].the_Name + " "
										+ result[i].the_Type + " | "
										+ result[i].the_Loc2 + " "
										+ result[i].the_Theater
								+ " [" + result[i].the_Seet + "/"
										+ result[i].the_Allseet + "]";
								output += "</button>";
							}

							document.getElementById("resTime").innerHTML = output;

						},
						error : function() {
							alert("setRes 함수 통신실패!");
						}

					});
		}

		function seetForm() {
			
			location.href = "seetForm?the_Code=" + event.target.value;

		}
	</script>

</body>

</html>