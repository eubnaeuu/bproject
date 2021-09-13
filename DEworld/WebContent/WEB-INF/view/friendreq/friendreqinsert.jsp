<%@page import="kr.or.ddit.member.service.MemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String userId = (String) request.getSession().getAttribute("userId");
	IMemberService memberService = MemberServiceImpl.getInstance();
	MemberVO logininfo = memberService.getMember(userId);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>일촌신청</title>
<style>
	
	#header{
		background-image: url("/DEworld/image/banner.jpg");
	}
	
	#topImage {
		height: 300px;
	}
	#friendListWrapper{
		margin : 0 auto;
		width:65%;
		min-height:410px;
	}
	#friendListWrapper h1{
	    font-size: 2.5rem;
	}
	button{
		padding:10px;
		color: #fff;
    	background-color: #007bff;

    	border:1px solid #007bff;
	}
	.table td{
		border-bottom: 1px solid #dee2e6;
	}
</style>
<title>일촌목록</title>
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
	<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript" src="/DEworld/js/common/commonMainpage.js"></script>
	<script>
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
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
	<div class="container">
		<img src="/DEworld/image/DEWorld-350x350.png" style="width: 32px">
		<!-- 링크 안맞을수도 확인할 것 ★ ☆  -->
		<a class="navbar-brand" href="http://localhost/DEworld/html/mainPage/topic.jsp">&nbsp;DEWorld</a>
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
	<div id="friendListWrapper">
		<form action="insert.do" method="post" enctype="multipart/form-data">
			<table>
			<input type="hidden" value="<%=userId %>" name="memId">
				<tr>
					<td>memId:</td>
					<td><input type="text" id="inputMemId"
						value="<%=logininfo.getMemNickname()%>" readonly="readonly"></td>
				</tr>
				<tr>
					<td>friendId(아이디를 적어주세요.)</td>
					<td><input type="text" name="friendId" id="inputFriendId"
						value=""></td>
				</tr>
				<tr>
					<td>보내실메시지</td>
					<td><textarea rows="10" cols="15"></textarea>
				</tr>
			</table>
			<input type="submit" value="신청" onclick="submit()"> 
			<a href="javascript:WinClose();"><input type="button" value="취소" onclick="close()"></a>
		</form>
	</div>
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your Website 2020</p>
		</div>
	</footer>
</body>
<script type="text/javascript">
$(document).ready(function(){
	var friendId = location.search.replace("?friendId=", "");	
	$("#inputFriendId").val(friendId);
});

	function close(){
		window.close();
	}
	
	function submit(){
		alert("일촌신청을 완료하였습니다.");
	}
</script>
</html>