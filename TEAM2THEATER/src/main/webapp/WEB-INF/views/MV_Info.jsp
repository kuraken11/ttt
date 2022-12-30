<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="kr">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>TTT_영화상세보기</title>
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
  
  <!-- Custom fonts for this template-->
<link
	href="resources/assets2/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link
	href="resources/assets2/css/sb-admin-2.min.css"
	rel="stylesheet">
	
	<!-- 별 -->
	<link href="resources/assets/css/star.css" rel="stylesheet"/>

	<!-- 새 css -->
	<link href="resources/assets/css/oh.css" rel="stylesheet"/>
</head>

<body>
  
  <!-- ======= Header ======= -->
  <header id="header" class="d-flex align-items-center ">
    <div class="container-fluid container-xxl d-flex align-items-center">

      <div id="logo" class="me-auto">
        <!-- 로고와 이름 -->
        <a href="index" class="scrollto"><img src="resources/assets/img/tttlogo.png" alt="TheEvenet" width="200" height="1200"></a>
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

  <!-- ======= 메인: 영화 정보1  ======= -->
  <section id="hero">
    <div class="hero-container" data-aos="zoom-in" data-aos-delay="100">
      <h1 class="mb-4 pb-0">${movie.mv_Name}</h1>
      <img src="resources/assets/poster/${movie.mv_PosterName}" width="400" height="400"/>
      <p class="mb-4 pb-0">예고편 보기</p>
      
      <a href="${movie.mv_Review}" class="glightbox play-btn mb-4"></a>
      
    </div>
  </section><!-- End Hero Section -->
    <!-- ======= 예비 버튼 겸 주요 정보======= -->
    <section id="schedule">
        <div class="container" data-aos="fade-up">
          <div class="section-header">
            <h2>영화 상세 보기</h2>
          </div>
          
        </div>
        <br/>
        <div id="movieInfos">
            <h1 style="font-weight: bold;">${movie.mv_Head}</h1>
            <h4>${movie.mv_Content}</h4>
            <!-- 좋아요 버튼 -->
			<button style="width:90px; height:40px; background-color:white;" onclick="movieLike('${loginId}','${movie.mv_Name}')"><span id="movieLikeHeart"></span> <span id="likeNum"></span> </button>
            <br/>
            <hr/>
            <h6 style="font-size:20px">상영타입 : ${movie.mv_Type}</h6>
            <h6 style="font-size:20px">감독 : ${movie.mv_Director} | 장르 : ${movie.mv_Genre} | 총시간 : ${movie.mv_Time}분 | 등급 : ${movie.mv_Age}관람가 | 개봉일 : ${movie.mv_Openday}</h6>
            <h6 style="font-size:20px">출연진 : ${movie.mv_Actor}</h6>
        </div>
		<br/>
		<hr/>
		<br/>
		<c:choose>
		
		<c:when test="${movie.mv_Notice == 0}">
		
		</c:when>
		<c:otherwise>
		<h2 id="coommeenntt" style="font-weight:bold;">관람평</h2>
    
        <!-- 댓글 입력 -->
        <div class="card shadow" style="width:70%;">
			<div class="card-header py-3">
            	<h6 class="m-0 font-weight-bold text-primary">관람평 작성</h6>
        	</div>
        	<!-- 댓글 좋아요 버튼 -->
	
			<!-- 댓글 -->
			<div>
				<input type="hidden" value="${loginId}" id="cmt_Id" />
				<input type="hidden" value="${movie.mv_Name}" id="cmt_Mvname" />
				<textarea rows="5" cols="70%" id="cmt_Comment" ></textarea>
		
				<button id="cmtWriteButton" onclick="cmtWrite()" style="border-radius:150px; backgroud-color:red;">작성 완료</button>
				
				<form class="mb-3" name="myform" id="myform" method="post">
			
					<span class="text-bold">별점을 선택해주세요</span> <input type="radio"
						name="reviewStar" value="5" id="rate1"><label for="rate1">★</label>
					<input type="radio" name="reviewStar" value="4" id="rate2"><label
						for="rate2">★</label> <input type="radio" name="reviewStar"
						value="3" id="rate3"><label for="rate3">★</label> <input
						type="radio" name="reviewStar" value="2" id="rate4"><label
						for="rate4">★</label> <input type="radio" name="reviewStar"
						value="1" id="rate5"><label for="rate5">★</label>
			
				</form>
			</div>
		</div>

		<!-- 관람평 목록 -->
		<div id="cmtArea"></div>
  		</c:otherwise></c:choose>
      </section>

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

  <a href="quickRes?mv_Name=${movie.mv_Name}" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-ticket-detailed">빠른 예매</i></a>
  <!-- 현재 방식이라면 백 투 탑 버튼 필수-->
  
  </body>

  <!-- Vendor JS Files -->
  <script src="resources/assets/vendor/aos/aos.js"></script>
  <script src="resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="resources/assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="resources/assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="resources/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="resources/assets/js/main.js"></script>
  
  <!-- Comment Scripts -->
  <script src="https://code.jquery.com/jquery-3.6.1.js"
	integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
	crossorigin="anonymous"></script>
<script>
	$.ajax({
		type : "POST",
		url : "comment/cList",
		data : {
			"cmt_Mvname" : "${movie.mv_Name}"
		},
		dataType : "json",
		success : function(result) {
			commentList(result);
		},
		error : function() {
			alert("댓글 불러오기 통신 실패!");
		}
	});
	
	// 좋아요 수 출력
	$.ajax({
		type : "POST",
		url : "movieLikeCount",
		data : {
			"ml_Movie" : "${movie.mv_Name}"
		},
		dataType : "text",
		success : function(Count){
			console.log(Count);
			document.getElementById("likeNum").innerHTML = Count;
		},
		error : function(){
			alert("댓글 불러오기 통신 실패!");
		}
		
	});
	$.ajax({
		type : "POST",
		url : "mlCheck",
		data :{
			"ml_Id" : "${loginId}",
			"ml_Movie" : "${movie.mv_Name}",
		},
		dataType : "json",
		success : function(mlCheck){

			if(mlCheck.ml_Check =="NO"){
				// 색깔을 만들어 주고
				$('#movieLikeHeart').html("<img src='resources/assets/img/heart.png' width='20px' height='20px'/>");
				
			}else{
				// 색깔을 빨간색에서 색 비워주고
				$('#movieLikeHeart').html("<img src='resources/assets/img/heart-fill.png' width='20px' height='20px'/>");
			}
		},
		error : function(){
			alert('댓글 작성 통신 실패!');
		}
		
	});
	
	
	// 댓글 불러오기 함수
	function commentList(list) {
		let output= "";
		let outputLike ="";
		
		
		output += "<div class='card shadow mb-4'>";
		output += "<div class='card-header py-3'>";
		output += "<h6 class='m-0 font-weight-bold text-primary'>관람평 목록</h6>";
		output += "</div>";
		output += "<div class='card-body'>";
		output += "<div class='table-responsive'>";
		output += "<table class='table table-bordered' id='dataTable' width='70%' cellspacing='0'>";
		output += "<tr>";
		output += "<th>작성자</th>";
		output += "<th>내용</th>";
		output += "<th>좋아요</th>";
		output += "<th>평점</th>";
		output += "<th>작성일</th>";
		output += "<th>수정</th>";
		output += "<th>삭제</th>";
		output += "</tr>";
		
		for(let i in list){
			
			output += "<tr>";
			output += "<td>"+ list[i].cmt_Id+"</td>";
			output += "<td><span id=cmtModiContent"+list[i].cmt_Id+">"+list[i].cmt_Comment+"<span></td>";
			output += "<td>"+ "<button style='width:90px; height:40px; background-color:white;' onclick=\"commentLike('"+list[i].cmt_Id+"','"+"${movie.mv_Name}"+"','"+"${loginId}"+"')\"><span id='commentLikeHeart"+list[i].cmt_Id+"'></span> <span id='cLikeNum"+list[i].cmt_Id+"'></span> </button>" +"</td>";
			output += "<td>"+ list[i].cmt_Point+"</td>";
			output += "<td>"+list[i].cmt_Time+"</td>";
			
			commentLikeBefore(list[i].cmt_Id,"${movie.mv_Name}","${loginId}")
			
			if('${loginId}' == list[i].cmt_Id || '${loginId}' == 'admin'){
			output += "<td><button style='background-color:aqua; border-radius:150px;' onclick=\"cmtCon('"+list[i].cmt_Id+"')\">수정</button></td>";
			output += "<td><button style='background-color:aqua; border-radius:150px;' onclick=\"cmtDelete('"+list[i].cmt_Id+"')\">삭제</button></td>";
			}else{
				output += "<td></td><td></td>";	
			}
			
			/* "안에는 따음표를 뒤에 백슬레시를 넣어준다. /'/' '" */
		
			output += "</tr>";			
		}
		output += "</table>";
		output += "</div>";
		output += "</div>";
		output += "</div>";
		
		document.getElementById("cmtArea").innerHTML = output;
	} // 수정할 필요가 있음 합칠때
	
	// 댓글 삭제
	function cmtDelete(cmt_Id) {
		console.log(cmt_Id);
		let cmt_Mvname = "${movie.mv_Name}";
		
		$.ajax({
			type : "POST",
			url : "comment/cmtDelete",
			data : {
				"cmt_Id" : cmt_Id,
				"cmt_Mvname" : cmt_Mvname
			},
			dataType : "json",
			success : function(list){
				commentList(list);
				$('#cmt_Comment').val("");
			},
			error : function(){
				alert('댓글 작성 통신 실패!');
			}
		});
	}
	
		
	
	//댓글 입력
	function cmtWrite(){
		let cmt_Id = document.getElementById("cmt_Id").value;
		let cmt_Comment = $("#cmt_Comment").val();
		let cmt_Mvname = $("#cmt_Mvname").val();
		let cmt_Point = $('input:radio[name="reviewStar"]:checked').val();
		
		if(${loginId eq null}){
			alert('로그인 후 이용가능합니다!')
			location.href = "mLoginForm"
		} else {
		
		$.ajax({
			type : "POST",
			url : "comment/cmtWrite",
			data : {
				"cmt_Id" : cmt_Id,
				"cmt_Comment" : cmt_Comment,
				"cmt_Mvname" : cmt_Mvname,
				"cmt_Point" : cmt_Point
			},
			dataType : "json",
			success : function(list){
				commentList(list);
				$('#cmt_Comment').val("");
			},
			error : function(){
				
			}
		});
		
		}
		
		
	}
	 // 댓글 수정시 입력값 생성
	function cmtCon(cmt_Id){
		
		$("#cmtModiContent"+cmt_Id).html("<input type='text' id='cContent'/> <input type='button' value='확인' onclick=\"cmtModify('"+cmt_Id+"')\"/>");
		
	}
	
	// 댓글 수정
	function cmtModify(cmt_Id){
		let cmt_Comment = document.getElementById("cContent").value;

		$.ajax({
			type : "POST",
			url : "comment/cmtModify",
			data : {
				"cmt_Id" : cmt_Id,
				"cmt_Mvname" : "${movie.mv_Name}",
				"cmt_Comment" : cmt_Comment
			},
			dataType : "json",
			success : function(list){
				commentList(list);
				$('#cmt_Comment').val("");
				// 입력 초기화
			},
			error : function(){
				alert('댓글 작성 통신 실패!');
			}
		});
	}
	// 좋아요 
	function movieLike(ml_Id,ml_Movie){
		
		if(${loginId eq null}){
			alert('로그인 후 이용가능합니다!')
			location.href = "mLoginForm"
		} else {

		$.ajax({
			type : "POST",
			url : "mlCheck",
			data :{
				"ml_Id" : ml_Id,
				"ml_Movie" : ml_Movie,
			},
			dataType : "json",
			success : function(mlCheck){

				if(mlCheck.ml_Check =="NO"){
					// 색깔을 만들어 주고
					$('#movieLikeHeart').html("<img src='resources/assets/img/heart-fill.png' width='20px' height='20px'/>");
					movieLikeUp(mlCheck.ml_Id,mlCheck.ml_Movie); // 좋아요 갯수 올리기
					movieLikeNum();  // 좋아요 갯수 출력
				}else{
					// 색깔을 빨간색에서 색 비워주고
					$('#movieLikeHeart').html("<img src='resources/assets/img/heart.png' width='20px' height='20px'/>");
					movieLikeDown(mlCheck.ml_Id,mlCheck.ml_Movie); // 좋아요 내리기
					movieLikeNum();	// 좋아요 갯수 출력
				}
			},
			error : function(){
				alert('댓글 작성 통신 실패!');
			}
			
		});
		
		}
	}
	// 좋아요 올리기
	function movieLikeUp(ml_Id,ml_Movie){
		console.log(ml_Id)
		console.log(ml_Movie)
		
		$.ajax({
			type : "POST",
			url : "movieLikeUp",
			data : {
				"ml_Id" : ml_Id,
				"ml_Movie" : ml_Movie,
			},
			
			dataType : "json",
			success : function(test){
			},
			error : function(){
				alert('댓글 작성 통신 실패!');
			}
			
			
		})
		
		
	};
	// 좋아요 내리기
		function movieLikeDown(ml_Id,ml_Movie){
		console.log(ml_Id)
		console.log(ml_Movie)
		
		$.ajax({
			type : "POST",
			url : "movieLikeDown",
			data : {
				"ml_Id" : ml_Id,
				"ml_Movie" : ml_Movie,
			},
			dataType : "json",
			success : function(test){
				
			},
			error : function(){
				alert('댓글 작성 통신 실패!');
			}
			
			
		})
		
		
	};
	
	// 좋아요 갯수 출력
	function movieLikeNum(){ 
	$.ajax({
		type : "POST",
		url : "movieLikeCount",
		data : {
			"ml_Movie" : "${movie.mv_Name}"
		},
		dataType : "text",
		success : function(Count){
			console.log(Count);
			document.getElementById("likeNum").innerHTML = Count;
		},
		error : function(){
			alert("댓글 불러오기 통신 실패!");
		}
		
	});
	
	};
	
	// 댓글 좋아요 불러오기 ajax
	function commentLike(cl_CmtId,cl_Movie,cl_Id){
		
		if(${loginId eq null}){
			alert('로그인 후 이용 가능합니다!')
			location.href = "mLoginForm"
		} else {
		
		$.ajax({
			type : "POST",
			url : "comment/cmtLikeCheck",
			data : {
				"cl_CmtId" : cl_CmtId,
				"cl_Movie" : cl_Movie,
				"cl_Id" : cl_Id
			},
			dataType : "json",
			success : function(cmt){
				console.log(cmt.cl_Check);
				console.log(cmt.cl_Num);
				if(cmt.cl_Check=="OK"){
					$('#commentLikeHeart'+cmt.cl_CmtId).html("<img src='resources/assets/img/heart-fill.png' width='20px' height='20px'/>");
					$('#cLikeNum'+cmt.cl_CmtId).html(cmt.cl_Num);
				}else{
					$('#commentLikeHeart'+cmt.cl_CmtId).html("<img src='resources/assets/img/heart.png' width='20px' height='20px'/>");
					$('#cLikeNum'+cmt.cl_CmtId).html(cmt.cl_Num);
				}
				
			},
			error : function(){
				alert('댓글 좋아요 통신 실패');
			}
		});
		
		}
	}
	
	
	function commentLikeBefore(cl_CmtId,cl_Movie,cl_Id){
		
		
		$.ajax({
			type : "POST",
			url : "comment/cmtLikeCheckBefore",
			data : {
				"cl_CmtId" : cl_CmtId,
				"cl_Movie" : cl_Movie,
				"cl_Id" : cl_Id
			},
			dataType : "json",
			success : function(cmt){
				console.log(cmt.cl_Check);
				console.log(cmt.cl_Num);
				if(cmt.cl_Check=="OK"){
					$('#commentLikeHeart'+cmt.cl_CmtId).html("<img src='resources/assets/img/heart.png' width='20px' height='20px'/>");
					$('#cLikeNum'+cmt.cl_CmtId).html(cmt.cl_Num);
				}else{
					
					$('#commentLikeHeart'+cmt.cl_CmtId).html("<img src='resources/assets/img/heart-fill.png' width='20px' height='20px'/>");
					$('#cLikeNum'+cmt.cl_CmtId).html(cmt.cl_Num);
				}
				
			},
			error : function(){
				alert('댓글 좋아요 통신 실패');
			}
		})
		
	};
	
	// 댓글 입력시 로그인 여부 확인
  	function checkLogin(){
		console.log("${loginId}")
		if(${loginId eq null} ){
			$("#cmt_Comment").blur();
			alert('로그인 후 사용해주세요.')
			location.href="mLoginForm";
		}
	}
</script>

</html>