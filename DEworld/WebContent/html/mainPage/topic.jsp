<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="kr.or.ddit.member.service.MemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
   	 String userId = (String)request.getSession().getAttribute("userId");
    String mem1 = "rjsdnsla2244";
    String mem2 = "vhfndrk";
    String mem3 = "kdhz1001";
    String mem4 = "asd1111";
    String mem5 = "ccccc12";
    String mem6 = "skxz13";
    
    IMemberService memberService = MemberServiceImpl.getInstance();
    MemberVO logininfo = memberService.getMember(userId);
//     MemberVO hompiinfo = memberService.getMember(hompiId);
    
    
    %>
<!DOCTYPE html>
<html lang="en">

<head>

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="">
	<meta name="author" content="">

	<title>DEWorld</title>
	<style type="text/css">
		#FaqTb tr:hover{
			background-color: #B4FBFF;
		}
	</style>

	<!-- Bootstrap core CSS -->
	<link href="/DEworld/html/mainPage/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- Custom styles for this template -->
	<link href="/DEworld/html/mainPage/css/business-frontpage.css" rel="stylesheet">
	
	<!-- favicon -->
	<link rel="icon" type="image/png" sizes="32x32" href="/DEworld/image/DEWorld-favicion.png" />
	
	<!-- js -->
	<script src="/DEworld/js/jquery-3.6.0.js"></script>
	<script src="/DEworld/js/mainPage/mainPage.js"></script>
	<script src="/DEworld/js/item/itemList.js"></script>
	<!-- 공지사항  -->
	<link rel="stylesheet" href="/DEworld/html/mainPage/css/notice/topic_notice.css">
	<script type="text/javascript" src="/DEworld/js/mainPage/main_Notice.js"></script>
	<script src="/DEworld/js/faq/faqList.js"></script>
	
	<!-- bootstrap -->
	<link
		href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
		rel="stylesheet" id="bootstrap-css">
	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<link rel="stylesheet"
		href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
		integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
		crossorigin="anonymous">
	<link rel="stylesheet"
		href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
		integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
		crossorigin="anonymous">
	<!-- 공통사항 -->
	<script type="text/javascript" src="/DEworld/js/common/commonMainpage.js"></script>
	<script src="/DEworld/js/music/musicList.js"></script>
	<!-- Channel Plugin Scripts -->
	<script>
	
	if(sessionStorage.getItem("nowLogin") == "user"){
	    channelChatBot();
	}
	
	function channelChatBot(){
	  (function() {
	    var w = window;
	    if (w.ChannelIO) {
	      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
	    }
	    var ch = function() {
	      ch.c(arguments);
	    };
	    ch.q = [];
	    ch.c = function(args) {
	      ch.q.push(args);
	    };
	    w.ChannelIO = ch;
	    function l() {
	      if (w.ChannelIOInitialized) {
	        return;
	      }
	      w.ChannelIOInitialized = true;
	      var s = document.createElement('script');
	      s.type = 'text/javascript';
	      s.async = true;
	      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
	      s.charset = 'UTF-8';
	      var x = document.getElementsByTagName('script')[0];
	      x.parentNode.insertBefore(s, x);
	    }
	    if (document.readyState === 'complete') {
	      l();
	    } else if (window.attachEvent) {
	      window.attachEvent('onload', l);
	    } else {
	      window.addEventListener('DOMContentLoaded', l, false);
	      window.addEventListener('load', l, false);
	    }
	  })();
	  ChannelIO('boot', {
	    "pluginKey": "ad03c7e1-7548-42e4-9984-8a98037031f4"
	  });
	}
	</script>
	<!-- End Channel Plugin -->
	<style>
	
	#header{
		background-image: url("/DEworld/image/banner.jpg");
	}
	
	#topImage {
		height: 300px;
	}
	.btn {
		display: inline-block;
		padding: 6px 12px;
		margin-bottom: 0;
		font-size: 14px;
		font-weight: normal;
		line-height: 1.42857143;
		text-align: center;
		white-space: nowrap;
		vertical-align: middle;
		cursor: pointer;
		-webkit-user-select: none;
		-moz-user-select: none;
		-ms-user-select: none;
		user-select: none;
		background-image: none;
		border: 1px solid transparent;
		border-radius: 4px;
		padding: 10px 16px;
	}
	
	.btn-lg {
		font-size: 18px;
		line-height: 1.33;
		border-radius: 6px;
	}
	
	.btn-primary {
		color: #fff;
		background-color: #428bca;
		border-color: #357ebd;
	}
	
	.btn-primary:hover, .btn-primary:focus, .btn-primary:active,
		.btn-primary.active, .open .dropdown-toggle.btn-primary {
		color: #fff;
		background-color: #3276b1;
		border-color: #285e8e;
	}
	
	.btn-primary.raised {
		box-shadow: 0 3px 0 0 #007299;
	}
	
	.btn-primary.raised:active, .btn-primary.raised.active {
		background: #33a6cc;
		box-shadow: none;
		margin-bottom: -3px;
		margin-top: 3px;
	}
	
	/***********************
	  CUSTON BTN VALUES
	************************/
	.btn {
		padding: 14px 24px;
		border: 0 none;
		font-weight: 700;
		letter-spacing: 1px;
		text-transform: uppercase;
	}
	
	.btn:focus, .btn:active:focus, .btn.active:focus {
		outline: 0 none;
	}
	
	.btn-primary {
		background: #0099cc;
		color: #ffffff;
	}
	
	.btn-primary:hover, .btn-primary:focus, .btn-primary:active,
		.btn-primary.active, .open>.dropdown-toggle.btn-primary {
		background: #33a6cc;
	}
	
	.btn-primary:active, .btn-primary.active {
		background: #007299;
		box-shadow: none;
	}
	.modal-body{
		margin: 0 auto;
		width: 70%;
	}
	#giftInfo{
	    display: flex;
	    flex-direction: column;
	    align-items: center;
	}
	#giftInfo img{
		width: 200px;
    	display: block;
    	margin-bottom: 20px;
	}
	textarea{
		display:block;
		width:100%;
		padding:10px;
	}
	.modal-footer{
		display: flex;
    	justify-content: center;
	}
	</style>
</head>

<body>
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<img src="/DEworld/image/DEWorld-350x350.png" style="width: 32px">
			<!-- 링크 안맞을수도 확인할 것 ★ ☆  -->
			<a class="navbar-brand" href="topic.jsp">&nbsp;DEWorld</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="d-flex justify-content">
				<div class="searchbar">
					<input class="search_input" type="text" name="" placeholder="닉네임을 입력해주세요"> 
					<a href="#" class="search_icon" onclick="searchNick()">
						<i class="fas fa-search"></i>
					</a>
				</div>
			</div>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item">
						<a class="nav-link" onclick="logOut()">
							<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
								fill="currentColor" class="bi bi-door-closed"
								viewBox="0 0 16 16">
							  <path d="M3 2a1 1 0 0 1 1-1h8a1 1 0 0 1 1 1v13h1.5a.5.5 0 0 1 0 1h-13a.5.5 0 0 1 0-1H3V2zm1 13h8V2H4v13z" />
							  <path d="M9 9a1 1 0 1 0 2 0 1 1 0 0 0-2 0z" />
			  				</svg> LogOut
						</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Header -->
	<header class="bg-primary py-3 mb-5" id="header">
		<div class="container h-100">
			<div class="row h-100 align-items-center">
				<div class="col-lg-12">
					<h1 class="display-4 text-white mt-5 mb-2">
						"<span id="idArea"></span>" 님 어서오세요
					</h1>
					<br>
					<button type="button" class="btn btn-primary btn-lg raised" id="changeBtn" onclick="goHompi('<%=userId%>')">내
						미니홈피</button>
					<br>
					<br>
					<p class="lead mb-5 text-white-50">DEWorld에서 당신의 취향을 공유하고, 친구들에게 자신의 근황을 알리세요 !</p>
				</div>
			</div>
		</div>
	</header>
	<!-- Page Content -->
	<div>
		<!-- 버튼 공간 -->
		<div class="container">
			<nav class="nav nav-pills nav-justified" id="mainButton">
				<a class="nav-link active" href="javascript:void(0)" id="btnTopic" onclick="mainAreaClick()">TOPIC</a> 
				<a class="nav-link" href="javascript:void(0)" id="btnShop" onclick="mainAreaClick()">SHOP</a>
				<a class="nav-link" href="javascript:void(0)" id="btnMypage" onclick="mainAreaClick()">MY PAGE</a>
			</nav>
			<br>
			<nav class="nav nav-pills nav-justified" id="shopDetail">
				<a class="nav-link active" href="javascript:void(0)" id="btnMusic" onclick="subAreaClick()">MUSIC</a>
				<a class="nav-link" href="javascript:void(0)" id="btnTheme" onclick="subAreaClick()">THEME</a>
				<a class="nav-link" href="javascript:void(0)" id="btnMinimi" onclick="subAreaClick()">MINIMI</a>
			</nav>
			<hr>
		</div>
	</div>
	<!-- 버튼 공간 End-->

	<!-- sections -->
	<div class="container" id="mainContents">
		<div id="sections">
			<!-- 토픽 섹션 -->
			<div id="sectionTopic">
				<div class="container">
					<h1>오늘의 투멤남, 투멤녀</h1>
					<br>
					<div class="nav nav-pills" id="toMem">
						<div class="col-md-6 mb-5">
							<div class="card h-100">
								<img class="card-img-top"
									src="/DEworld/image/DEWorld-350x350.png" alt="" id="topImage">
								<div class="card-body">
									<h4 class="card-title">투멤남</h4>
									<p class="card-text"><%=memberService.getMember(mem1).getMemNickname()%></p>	
								</div>
								<div class="card-footer">
									<a class="btn btn-primary" onclick="goHompi('<%=mem1%>')">미니홈피로 가기</a>
								</div>
							</div>
						</div>
					</div>
					<!-- 토픽 끝 -->

					<hr>
					<br>

					<!-- 공지사항 시작 -->
					<h1>유저 서비스</h1>
					<br>
					<div class="nav nav-pills">
						<div class="col-md-6 mb-5">
							<div class="card h-100">
								<div class="card-body">
									<h4 class="card-title">공지사항</h4>
									<a id="showNoticeAll"
										href="http://localhost/DEworld/html/notice/noticeList.html">+</a>
									<hr>
									<form id="fm">
										<table id="NoticeList">
											<thead>
												<tr>
													<th>글번호</th>
													<th>제목</th>
													<th>작성자</th>
													<th>작성일</th>
												</tr>
											</thead>
											<tbody id="noticeTb">

											</tbody>
										</table>
										<input type="hidden" name="flag" id="flag">
									</form>
								</div>
							</div>
						</div>
						<div class="col-md-6 mb-5">
							<div class="card h-100">
								<div class="card-body">
									<h4 class="card-title">FAQ 게시판</h4>
									<a id="showNoticeAll"
										href="http://localhost/DEworld/faq/faqList.do">+</a>
									<hr>
									<form id="fm">
										<table id="FaqList">
											<thead>
												<tr>
													<th style='width: 30%;display: inline-block;'>분류</th>
													<th style='width: 70%;display: inline-block; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;'>제목</th>

												</tr>
											</thead>
											<tbody id="FaqTb">

											</tbody>
										</table>

									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 샵 섹션 -->
			<div id="sectionShop">
			<h4>내가 보유중인 땅콩 : <span id="ownPeanut"></span> 땅콩 &nbsp;&nbsp;&nbsp;<a href="javascript:void(0)" onclick="goChargePage()" class="btn btn-primary col-md-2 mb-1">충전하기</a></h4>
			
				<!-- 샵 섹션 안의 구분 -->
				<div id="innerShop">
				
					<!-- 뮤직 섹션 -->
					<div id="innerMusic">
						<h1>MUSIC</h1>
						<br>
						<div class="nav nav-pills">
							<table id="musicListTable" class="table" >
								<thead>
								<tr>
									<td>앨범</td>
									<td>제목</td>
									<td>가수</td>
									<td>재생시간</td>
									<td>장르</td>
									<td>가격</td>
									<td>위시리스트</td>
									<td>구매하기</td>
									<td>선물하기</td>
								</tr>
								</thead>
								<tbody>
									
								</tbody>
							</table>
						
						</div>
						<div class="modal fade" id="giftModal" role="dialog">
							<div class="modal-dialog">
								<!-- Modal content-->
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal">&times;</button>
										<h5 class="modal-title">선물하기</h5>
									</div>
									<div class="modal-body">
										<div id="giftInfo">
											<span id="giftItemName"></span><br>
					 						<img src="" id="giftItemImg">
										</div>
										<div>
											선물 받는 사람: <select id="friendList" onchange="setFriendList()"></select>
										</div><br>
										<textarea rows="5" cols="20" placeholder="선물메시지를 작성해주세요." id="giftMessage"></textarea><br>
										<div>총 결제 땅콩 : <span id="musicCostV"></span>개</div>
										<hr>
									</div>
									<div class="modal-footer">
										
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<!-- 테마 섹션 -->
					<div id="innerTheme">
						<h1>THEME</h1>
						<br>
						<div class="nav nav-pills">
							
						</div>
					</div>
					
					<!-- 미니미 섹션 -->
					<div id="innerMinimi">
						<h1>MINIMI</h1>
						<br>
						<div class="nav nav-pills">
							
						</div>
					</div>
				</div>
			</div>

			<!-- 마이페이지 섹션 -->
			<div id="sectionMypage">
				<h1>MY PAGE</h1>
				<br>
				<div class="nav nav-pills">
					<div class="col-md-12 mb-5">
						<div class="card h-100">
							<div style="border: 1px solid gray">
								<img class="card-img-top"
									src="https://ac.namu.la/88/88593eda02e32c3d11ce7e10e708f3b5cc548f87973de298d314e11fc3483886.jpg"
									alt=""
									style="width: 150px; border: 10px solid black; border-radius: 50%; margin: 10px; float: left;">
								<div>
									<br>
									<h1 id="memName"></h1>
									<h5 id="memMail">
										<h5>
											<a
												href="http://localhost/DEworld/html/mainPage/changeInfo.html"
												class="btn btn-primary col-md-10 ">내 정보 수정</a>
								</div>
							</div>
							<div class="card-body" style="">
								<div>
									<span class="btn btn-primary col-md-5" style="" onclick="goMyMessage()">쪽지</span>
										<a href="javascript:void(0)" onclick="goChargePage()" class="btn btn-primary col-md-5" style="float: right">충전하기</a>
								</div>
								<br>
								<div>
									<a href="/DEworld/friend/list.do" class="btn btn-primary col-md-5">내 일촌</a> 
									<a href="/DEworld/giftbox/giftboxList.do" class="btn btn-primary col-md-5" style="float: right">선물함</a>
								</div>
								<br>
								<div>
									<a href="javascript:linkTo()" class="btn btn-primary col-md-5">위시리스트</a> 
									<a href="/DEworld/buy/buyList.do" class="btn btn-primary col-md-5" style="float: right">구매내역	조회</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<form name="wishForm">
		
	</form>

	<!-- 토픽 끝 -->


	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your Website 2020</p>
		</div>
	</footer>

	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script>
		function linkTo(){
			const frm = document.wishForm;
			frm.action = "/DEworld/whishlist/whishlistList.do";
			frm.method = "post";
			frm.submit();
		}
	</script>

</body>
</html>
