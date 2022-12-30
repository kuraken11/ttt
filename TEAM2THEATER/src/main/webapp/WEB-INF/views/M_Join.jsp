<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="kr">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>TTT_회원가입 페이지</title>
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

  <!-- ======= 메인: 현재 최고 인기 영화 링크  ======= -->
  <section id="hero">
  	<br/><br/>
    <div class="container">

		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class="col-lg-5 d-none d-lg-block bg-register-image"><img src="resources/assets/img/tttlogo2.png" width="500" height="640"/></div>
					<div class="col-lg-7">
						<div class="p-5">
							<div class="text-center" style="background-color:black; border-radius:150px;">
								<h1 style="color:white;">회원가입 페이지</h1>
							</div>
							<form class="user" action="mJoin" method="POST" name="joinForm">
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input type="text" class="form-control form-control-user"
											id="memId" name="memId" onkeyup="checkId()" placeholder="아이디" />
										<br /> <span id="check1"></span>
									</div>
								</div>

								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input type="password" class="form-control form-control-user"
											name="memPw" id="memPw" onkeyup="pwRegexp()"
											placeholder="비밀번호(영문, 숫자, 특수문자 혼합!)" /> <br> <span
											id="pwResult1"></span>
									</div>
									<div class="col-sm-6">
										<input type="password"
											class="form-control form-control-user" id="checkPw"
											onkeyup="pwCheck()" placeholder="비밀번호 확인" /> <br/> <span
											id="pwResult2"></span>
									</div>
								</div>
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input type="text" class="form-control form-control-user"
											id="memName" name="memName" placeholder="이름" style="margin-bottom:20px;"/>
									</div>
								</div>
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input type="date" class="form-control form-control-user"
											id="memBirth" name="memBirth" placeholder="생년월일" style="margin-bottom:20px;"/>
									</div>
									
								</div>
								
								<div class="form-group">
									<input type="email" class="form-control form-control-user"
										id="memEmail" name="memEmail" size="40" placeholder="이메일" />
									<span id="confEmail"><input type="button"
										value="인증번호 발송" onclick="checkEmail()"
										style="height: 40px; width: 200px; background-color: red; color:white; border-radius:150px; margin-bottom:20px;" /></span>
								</div>
								<div id="checkOk"></div>
								
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input type="text" class="form-control form-control-user"
											id="memPhone" name="memPhone" placeholder="전화번호" />
									</div>
								</div>

								<div class="form-group row">
									<input type="button" onclick="checkConfirm()" value="가입"
									style="height: 40px; width: 90px; background-color:red; color:white;
									border-radius:150px; margin-top:10px; margin-left:300px"/>
									
								</div>

							</form>
							<hr/>
							<div class="text-center" style="height:40px; line-height:40px; width:300px; background-color:red; border-radius:150px; margin-left:180px;">
								<a class="small" href="mLoginForm" style="color:white;">이미 회원가입하셨다면 로그인!</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
  </section><!-- End Hero Section -->

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

  <!-- Vendor JS Files -->
  <script src="resources/assets/vendor/aos/aos.js"></script>
  <script src="resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="resources/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="resources/assets/js/main.js"></script>
  
  <!-- Ajax -->
  <script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous"></script>

<!-- My Scripts -->
<script>

//비밀번호 형식확인
function pwRegexp() {
	let memPw = document.getElementById("memPw").value;
	let pwResult1 = document.getElementById("pwResult1");
	
	let num = memPw.search(/[0-9]/);
	let eng = memPw.search(/[a-z]/);
	let spe = memPw.search(/[`~!@#$%^&*|\\\'\":;\/?]/);
	let spc = memPw.search(/\s/);

	if(memPw.length < 8 || memPw.length > 16){
		pwResult1.style.color = "#ff0000"
		pwResult1.innerHTML = " 비밀번호는 8자리에 16자리 이내로 입력해주세요."
		return false;
		
	} else if(memPw.search(/\s/) != -1){
		pwResult1.style.color = "#ff0000"
			pwResult1.innerHTML = "비밀번호는 공백없이 입력해주세요."
			return false;
		
	}	else if(num < 0 || eng < 0 || spe < 0){
		pwResult1.style.color = "#ff0000"
		pwResult1.innerHTML = "영문, 숫자, 특수문자를 혼합하여 입력해주세요."
		return false;
		
	}	else{
		pwResult1.style.color = "#0000ff"
		pwResult1.innerHTML = " 사용가능한 비밀번호 입니다."
		return true;
	}
	
	
}

//비밀번호 재확인
function pwCheck(){
	let memPw = document.getElementById("memPw").value;
	let checkPw = document.getElementById("checkPw").value;
	let pwResult2 = document.getElementById("pwResult2");
	
	if(memPw != checkPw){
		pwResult2.style.color = "#ff0000"
		pwResult2.innerHTML = "비밀번호를 다시 확인해주세요."
		
		return false;
	} else{
		pwResult2.style.color = "#0000ff"
		pwResult2.innerHTML = "비밀번호가 일치합니다."
		return true;
	}
}

//최종확인 및 회원가입
function checkConfirm(){
	let memName = document.getElementById("memName").value;
	let memBirth = document.getElementById("memBirth").value;
	let memPhone = document.getElementById("memPhone").value;
	
	if(!pwRegexp() && !pwCheck()){
		
		alert('비밀번호를 확인하세요.');
		
	} else if(!checkEmail2()){
		
		alert('이메일 인증을 해주세요');
		
	} else if(memName == null||memBirth == null||memPhone == null){
		
	    alert('빠진 정보가 없어야합니다!');
	    
	} else {
		
		joinForm.submit();
		
	}
}

//아이디 중복 확인
function checkId(){
	let memId = document.getElementById("memId").value;
	
	let check1 = document.getElementById("check1");
	
	$.ajax({
		type : "POST",
		url : "idoverlap",
		data: {
			"memId" : memId
		},
		async : false,
		dataType : "text",
		success : function(result){
			if(result=="OK"){
				// 사용할 수 있는 아이디일 경우 실행
				check1.innerHTML = "사용가능한 아이디";
				check1.style.color = "#0000ff";
			}else {
				// 사용할 수 없는 아이디일 경우 실행	
				check1.innerHTML = "이미 사용중인 아이디";
				check1.style.color = "#ff0000";
			}
		},
		 error : function() {
			alert("idoverlap함수 통신실패!");
		}
		
	});	
}

//이메일 확인
function checkEmail(){
	
	let memEmail = $("#memEmail").val();
	
	$.ajax({
		type : "POST",
		url : "mCheckEmail",
		data : {
			"memEmail" : memEmail
		},
		dataType : "text",
		success : function(uuid) {
			console.log("이메일 인증번호 : " + uuid);
			$("#confEmail").html("<br/><input type='text' id='uuidCheck'/>"
					+" <input type='hidden' value='"+ uuid +"' id='uuid'/>"
					+" <input type='button' value='인증' onclick=\"checkEmail2()\" style='height: 40px; width: 90px; background-color: red; color:white; border-radius:150px;'/>");
		},
		error : function() {
			alert('이메일 인증 통신 실패!');
		}
	});
}

let boolUUID = false;

//인증번호 확인
function checkEmail2(){
	let uuid = $("#uuid").val();
	console.log("인증번호 : " + uuid);
	
	let uuidCheck = $("#uuidCheck").val();
	console.log("입력한 인증번호 : " + uuidCheck);
	
	if(uuidCheck==null || uuidCheck==""){
		
	}else if(uuid == uuidCheck){
		$("#checkOk").html("<p style='font-size:20px; color:blue;'>인증완료</p>")
		boolUUID = true;
		
	} else {
		alert('인증실패!');
	}
	
	return boolUUID;
}
</script>

</body>

</html>