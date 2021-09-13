<%@page import="kr.or.ddit.item.vo.ItemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ItemVO itemVO = (ItemVO) request.getAttribute("itemVO");
	String gu = request.getParameter("gu");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="/DEworld/js/jquery-3.6.0.js"></script>
<link	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"	rel="stylesheet" id="bootstrap-css">
<script	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"	crossorigin="anonymous">
<link rel="stylesheet"	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<!-- 공통사항 -->
<script type="text/javascript"	src="/DEworld/js/common/commonMainpage.js"></script>
<style>
#header {
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

.modal-body {
	margin: 0 auto;
	width: 70%;
}

#giftInfo {
	display: flex;
	flex-direction: column;
	align-items: center;
}

#giftInfo img {
	width: 200px;
	display: block;
	margin-bottom: 20px;
}

textarea {
	display: block;
	width: 100%;
	padding: 10px;
}

.modal-footer {
	display: flex;
	justify-content: center;
}


ul {
	list-style: none;
}

.all {
	padding: 100px;
}

button {
	border: 0;
	outline: 0;
	padding: 8.8px;
}

.navbar {
	margin-bottom: 0px;
}
</style>
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
<script>
var memId = sessionStorage.getItem("Nickname");
var gu = '0<%=gu%>';
var count = 0;
var m = true;

function addWishList(itemId){
	// 위시리스트 추가
	var param = {
		flag : "C",
		memId : memId,
		itemId : itemId,
		litemGu : gu
	};
	$.ajax({
		url : "/DEworld/item/itemDetail.do"
		,type : "post"
		,data : param
		,dataType : "json"
		,success : function(data){
			if(data.resultCnt == 0){
				alert("이미 위시리스트에 존재하는 상품입니다.");
			}else{
				alert("위시리스트에 추가되었습니다.");
			}
		}
		,error : function(xhr){
			alert("실패하였습니다.\n관리자에게 문의하세요.");
			console.log(xhr);
		}
	});
}

function money(){ // 보유 금액 확인
	$.ajax({
		url : "/DEworld/MemberServlet",
		type : "post",
		data : {"memId" : memId, "flag" : "setMyPage"},
		dataType : "json",
		async: false,
		success : function(data) {
			var memCybermoney = data[0].memCybermoney;
			var itemPrice = <%=itemVO.getItemPrice()%>;
			var result = memCybermoney - itemPrice;
			if(result < 0){
				alert("보유한 땅콩이 부족합니다!");
				m = false;
			}else{
				m = true;
			}
		},
		error : function(xhr) {
			
		}
	});
	
}

function buyItem(){
	var result = confirm("구매하시겠습니까? <%=itemVO.getItemPrice()%> 땅콩이 차감됩니다.");
	if(result != true){
		return;
	}
	
	money();
	if(m == false){ // 머니가 부족하면
		return;
	}else{
		var itemId = "<%=itemVO.getItemId()%>";
		
		var param = {
			flag : "BUY",
			memId : memId,
			itemId : itemId
		};
		
		$.ajax({
			url : "/DEworld/item/itemDetail.do"
			,type : "post"
			,data : param
			,dataType : "json"
			,success : function(data){
				console.log(data);
				if(data.resultCnt == 0){
					alert("이미 보유한 상품입니다.");
				}else{
					alert("상품을 구매하셨습니다.");	
				}
			}
			,error : function(xhr){
				alert("실패하였습니다.\n관리자에게 문의하세요.");
				console.log(xhr);
			}
		});
	}
}

function showGiftBox(itemId){
	$("#giftModal").modal();
	
	var param = {
		flag : "GF",
		memId : memId
	};
	
	$.ajax({
		url : "/DEworld/item/itemDetail.do"
		,type : "post"
		,data : param
		,dataType : "json"
		,success : function(data){
			console.log(data);
			setFriendList(data);
		}
		,error : function(xhr){
			alert("실패하였습니다.\n관리자에게 문의하세요.");
			console.log(xhr);
		}
	});
}

function setFriendList(data){
	if(count != 0){
		return;
	}else{
		var strHtml = '<option value="">선택하세요</option>';
		for(var i=0 ; i<data.length; i++){
			strHtml += '<option value="' + data[i].friendId +'">' + data[i].friendNickname + '</option>';
		}
		$("#friendList").html(strHtml);
		count++;
	}
	
}


function sendGift(){
	var result = confirm("선물하시겠습니까? <%=itemVO.getItemPrice()%> 땅콩이 차감됩니다.");
	if(result != true){
		return;
	}
	 
	money(); 
	if(m == false){ // 머니가 부족하면
		return;
	}else{
		var itemId = "<%=itemVO.getItemId()%>";
		var friendList = document.getElementById("friendList");
		var friendId = friendList.options[friendList.selectedIndex].value;
		var giftMessage = document.getElementById("giftMessage").value;
		
		var param = {
			flag : "SENDGF",
			itemId : itemId,
			friendId : friendId,
			giftMessage : giftMessage,
			memId : memId,
			litemGu : gu
		};
		
		$.ajax({
			url : "/DEworld/item/itemDetail.do"
			,type : "post"
			,data : param
			,dataType : "json"
			,success : function(data){
				console.log(data);
				alert("선물을 전송했습니다!");
				friendList.selectedIndex = 0;
				giftMessage = '';
			}
			,error : function(xhr){
				alert("실패하였습니다.\n관리자에게 문의하세요.");
				console.log(xhr);
			}
		});
	}
}
</script>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"
		style="border-radius: 0px; position: relative;">
	<div class="container">
		<img src="/DEworld/image/DEWorld-350x350.png" style="width: 32px">
		<a class="navbar-brand"
			href="http://localhost/DEworld/html/mainPage/topic.jsp">&nbsp;DEWorld</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarResponsive" aria-controls="navbarResponsive"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="d-flex justify-content">
			<div class="searchbar">
				<input class="search_input" type="text" name=""
					placeholder="닉네임을 입력해주세요"> <a href="#" class="search_icon" onclick="searchNick()">
					<i class="fas fa-search"></i>
				</a>
			</div>
		</div>
		<div class="navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item" style="float: right;"><a class="nav-link"
					onclick="logOut()"> <svg xmlns="http://www.w3.org/2000/svg"
							width="16" height="16" fill="currentColor"
							class="bi bi-door-closed" viewBox="0 0 16 16"> <path
							d="M3 2a1 1 0 0 1 1-1h8a1 1 0 0 1 1 1v13h1.5a.5.5 0 0 1 0 1h-13a.5.5 0 0 1 0-1H3V2zm1 13h8V2H4v13z" />
						<path d="M9 9a1 1 0 1 0 2 0 1 1 0 0 0-2 0z" /> </svg> LogOut
				</a></li>
			</ul>
		</div>
	</div>
	</nav>
	<header class="bg-primary py-3 mb-5" id="header">
	<div class="container h-100">
		<div class="row h-100 align-items-center">
			<div class="col-lg-12">
				<h1 class="display-4 text-white mt-5 mb-2" style="font-size: 56px">
					"<span id="idArea"></span>" 님 어서오세요
				</h1>
				<br>
				<button type="button" class="btn btn-primary btn-lg raised"
					id="changeBtn" onclick="goMyHompi()">내 미니홈피</button>
				<!-- 					<button type="button" class="btn btn-primary btn-lg raised" id="changeBtn" onclick="goTest()">☆ 테스트중</button> -->
				<br> <br>
				<p class="lead mb-5 text-white-50">DEWorld에서 당신의 취향을 공유하고, 친구들에게
					자신의 근황을 알리세요 !</p>
			</div>
		</div>
	</div>
	</header>

	<div class="all">
		<div style="text-align: center; ">
			<div>
				<form>
					<table style="border: 1px solid; background-color: white; margin: auto;">
						<tr>
							<td>
								<ul style="margin-right: 40px;">
									<li style="margin-top: 30px;">
										<%
											if (!gu.equals("1")) {
										%> <img
										src="/DEworld/image/hompiBackground/<%=itemVO.getItemImg()%>">
										<br><br>
										<%
											} else {
										%> <img
										src="/DEworld/image/item/<%=itemVO.getItemImg()%>"> <%
 	}
 %>
									</li>
									<li><h2><%=itemVO.getItemName()%></h2></a></li>
									<li><h3><%=itemVO.getItemDesc()%></h3></li>
									<li><h3>
											필요한 땅콩 :
											<%=itemVO.getItemPrice()%></h3></li>
									<br>
								</ul>
							</td>
						</tr>
					</table>
				</form>
			</div>
			<div style="margin-top: 20px;">
				<button type="button" class="itemBtn"
					onclick="addWishList(<%=itemVO.getItemId()%>)"
					style="background-color: pink">위시리스트에 담기</button>
				&nbsp;&nbsp;&nbsp;
				<button type="button" class="itemBtn" onclick="buyItem()"
					style="background-color: yellow">구매하기</button>
				&nbsp;&nbsp;&nbsp;
				<button type="button" class="itemBtn"
					onclick="showGiftBox(<%=itemVO.getItemId()%>)"
					style="background-color: orange">선물하기</button>
			</div>
		</div>
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
						<span>[<%=itemVO.getItemName()%>]
						</span><br>
						<%
							if (!gu.equals("1")) {
						%>
						<img
							src="/DEworld/image/hompiBackground/<%=itemVO.getItemImg()%>">
						<%
							} else {
						%>
						<img src="/DEworld/image/item/<%=itemVO.getItemImg()%>" style="width: auto;">
						<%
							}
						%>
					</div>
					<div>
						선물 받는 사람: <select id="friendList" onchange="setFriendList()"></select>
					</div>
					<br>
					<textarea rows="5" cols="20" placeholder="선물메시지를 작성해주세요."
						id="giftMessage"></textarea>
					<br>
					<div>
						총 결제 땅콩 :
						<%=itemVO.getItemPrice()%>개
					</div>
					<hr>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" onclick="sendGift()">선물하기</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>


	<footer class="py-5 bg-dark">
	<div class="container">
		<p class="m-0 text-center text-white">Copyright &copy; Your
			Website 2020</p>
	</div>
	</footer>



</body>
</html>