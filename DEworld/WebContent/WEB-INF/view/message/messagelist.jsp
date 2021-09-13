<%@page import="kr.or.ddit.member.service.MemberServiceImpl"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="kr.or.ddit.comments.vo.CommentsVO"%>
<%@page import="kr.or.ddit.paging.PagingVO"%>
<%@page import="kr.or.ddit.message.vo.MessageVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
// String strJson = (String)request.getAttribute("strJson");
	List<MessageVO> messagelist = (List<MessageVO>)request.getAttribute("messagelist");
	PagingVO pagingVO = (PagingVO)request.getAttribute("pagingVO");
	String msg = request.getParameter("msg") == null ? ""
			: request.getParameter("msg");
	
	String userId = (String)request.getSession().getAttribute("userId");
	IMemberService memberService = MemberServiceImpl.getInstance();
	MemberVO logininfo = memberService.getMember(userId);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>쪽지 목록</title>

<script src="/DEworld/js/jquery-3.6.0.js"></script>
<script src="/DEworld/js/giftbox/giftboxList.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="/DEworld/js/jquery-3.6.0.js"></script>
<script src="/DEworld/js/mainPage/mainPage.js"></script>
<script src="/DEworld/js/common/commonMainpage.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
#header {
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
</style>
<script>
	function channelChatBot() {
		(function() {
			var w = window;
			if (w.ChannelIO) {
				return (window.console.error || window.console.log || function() {
				})('ChannelIO script included twice.');
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
			"pluginKey" : "ad03c7e1-7548-42e4-9984-8a98037031f4"
		});
	}
</script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
	<div class="container">
		<img src="/DEworld/image/DEWorld-350x350.png" style="width: 32px">
		<!-- 링크 안맞을수도 확인할 것 ★ ☆  -->
		<a class="navbar-brand" href="/DEworld/html/mainPage/topic.jsp">&nbsp;DEWorld</a>
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
					"<span id='idArea'></span>" 님 어서오세요
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
<h1>쪽지</h1><hr>
	<table id="messagelisttable" class="table">
			<thead>
				<tr>
					<th><input class="MessageChk" id="MessageCheckboxAll"
						style="display: none;" type="checkbox" name="MessageCheckboxAll"
						onclick="checkAll();"></th>
					<th>구 분</th>
					<th>FROM</th>
					<th>TO</th>
					<th>내 용</th>
					<th>일 자</th>
					<th>상 태</th>
				</tr>
			</thead>
			<tbody>
				<%
					int size = messagelist.size();
					if(size > 0){
						int cnt = 1;
						String MessageChkId = "MessageCheckbox"+cnt;
						for (int i=0; i < size;  i++){
							%>
				<tr>
					<td><input class="MessageChk MessageChkArr"
						id="<%=messagelist.get(i).getMessageNo() %>chkbox"
						style="display: none;" type="checkbox" name="MessageCheckbox"></td>
					<td><%= cnt%></td>
					<td><%= messagelist.get(i).getMemId()%></td>
					<td><%= messagelist.get(i).getReceiveMem()%></td>
					<td><a
						href="select.do?messageNo=<%=messagelist.get(i).getMessageNo()%>"><%= messagelist.get(i).getMessageContent()%></a></td>
					<td><%= messagelist.get(i).getMessageDate()%></td>
					<td>
						<%
							String messageStatus = messagelist.get(i).getMessageStatus().trim();
								if(messageStatus.equals("N")){
									%> 읽지않음 <%
								}else if(messageStatus.equals("Y")){
									%> 읽음 <%
								}
							%>
					</td>
				</tr>
				<%
							cnt++;
							}
							%>
			
	</div>
	<!-- 여백 -->
	<div class="col-sm-2 sidenav"></div>
	</div>
	</div>


	<!-- 페이징 처리 시작 -->
	<%if(pagingVO.getTotalCount() > 0) {%>
	<tr>
		<td colspan="7" align="center">
			<%if(pagingVO.getFirstPageNo() > pagingVO.getPageSize()) { %> <a
			href="list.do?pageNo=<%=pagingVO.getFirstPageNo() - pagingVO.getPageSize() %>">[이전]</a>
			<%} %> <%for(int pNo = pagingVO.getFirstPageNo(); pNo <= pagingVO.getLastPageNo(); pNo++) { %>
			<a <%if(pNo == pagingVO.getCurrentPageNo()){ %>
			style="color: orange;" <%} %> href="list.do?pageNo=<%=pNo %>">[<%=pNo %>]
		</a> <%} %> <%if(pagingVO.getLastPageNo() < pagingVO.getTotalPageCount()) {%>
			<a
			href="list.do?pageNo=<%=pagingVO.getFirstPageNo() + pagingVO.getPageSize() %>">[다음]</a>
			<%} %>
		</td>
	</tr>
	<%} %>
	<!-- 페이징 처리 끝 -->

	<%
					}else{
					%>
	<tr>
		<td colspan="5">쪽지가 존재하지 않습니다.</td>
	</tr>
	<%
						}
					%>
	</tbody>
	</table>
	<a href="insert.do"><button type="button">보내기</button></a>
	<select id="selectstr">
		<option value="1">사람검색</option>
		<option value="2">내용검색</option>
	</select>
	<input type="text" id="inputstr">
	<button type="button" onclick="search()">검색</button>
	<!-- 		<a href="list.do"><button type="button" onclick="select()">조회</button></a> -->
	<button type="button" onclick="toggleChk()">선택</button>
	<a href="list.do"><button type="button" onclick="remove()">삭제</button></a>
</div>
<footer class="py-5 bg-dark">
	<div class="container">
		<p class="m-0 text-center text-white">Copyright &copy; Your Website 2020</p>
	</div>
</footer>
</body>

<script type="text/javascript">

function checkAll(){
	if($("[name=MessageCheckboxAll]").prop("checked")){
		$("[name=MessageCheckbox]").prop("checked",true);
	}else{
		$("[name=MessageCheckbox]").prop("checked",false);
	}
}

function toggleChk(){
$(".MessageChk").toggle();
}

function send(){
	$.ajax({
		url : "/DEworld/message/insert.do"
		,success : function(data){
			
		}
		,error : function(xhr){
		}
		
	});
}

function update(){
	inputparam = $("#inputstr").val();
	updateparam = $("#updatestr").val();
	var param = {
			'messageNo' : inputparam         
			,'messageTitle' : updateparam    
			};
	$.ajax({
		url : "/DEworld/message/update.do"
		,type : "post"
		,data : param
// 		,dataType : "json"
		,success : function(data){
			
		}
		,error : function(xhr){
			
		}
		
	});
}

function chkdel(){
	var cnt=0;
	var messageChkId="";
	var chkboxes = $(".MessageChkArr");
	var length = $(".MessageChkArr").length;
	var flag = "f";
	$.each(chkboxes,function(idx, item){
		if($(item).prop("checked")==true){
			flag ="t";			
		}
	});
	if(flag!="t"){
		return false;
	}else
		return true;
	
}

function reload(){
	$.ajax({
		url : "/DEworld/message/list.do"
// 		,dataType : "json"
		,success : function(data){
			console.log(data)
		}
		,error : function(xhr){
			console.error(xhr);
		}
	});
}

function remove(){
	
	if(!chkdel()){
		alert("삭제하실 글을 선택해주세요")
		return;
	}
	
	if(!chkmsg()){
		return;
	}
	var chkboxes = $(".MessageChkArr");
		$.each(chkboxes, function(index, item){
		if($(item).prop("checked")==true){
			var idx  = $(item).attr("id").indexOf("chkbox");
			var id = ($(item).attr("id").substring(0,idx));
			console.log(id);
			remove2(id);
		}
	});
}
	
		
function remove2(str){
	
	inputparam = $("#inputstr").val();
	var param = {
			'messageNo' : str
			};
	$.ajax({
		url : "/DEworld/message/delete.do"
		,type : "post"
		,data : param
		,success : function(data){
			console.log(data);
		}
		,error : function(xhr){
			console.error(xhr);
		}
	});
}

function search(){

		var flag = $("#selectstr").val();
		var inputparam = $("#inputstr").val();

		if ("1" == flag) {
			var URI="http://localhost/DEworld/message/search.do?memId="+inputparam;
			window.location.href = URI;
		} else if ("2" == flag) {
			var URI="http://localhost/DEworld/message/search.do?messageContent="
					+ inputparam;
			window.location.href = URI;
		}
	}
	
	function search1() {
		flag = $("#selectstr").val();
		inputparam = $("#inputstr").val();
		alert(inputparam);

		var param = {
			"inputstr" : inputparam,
			"flag" : flag
		};
		$.ajax({
			url : "/DEworld/message/search.do",
// 			type : "POST",
			data : param
			//  		,dataType : "json"
			,
			success : function(data) {
				console.log(data)
			},
			error : function(xhr) {
				
			}

		});
	}

	function chkmsg() {
		return confirm("정말 삭제하시겠습니까?");
	}

	function select() {
		$.ajax({
			url : "/DEworld/message/list.do",
			type : "POST"
			,
			success : function(data) {
				console.log(data)
				// 			makeTable(data);
			},
			error : function(xhr) {
				
			}
		});
	}
</script>
</html>