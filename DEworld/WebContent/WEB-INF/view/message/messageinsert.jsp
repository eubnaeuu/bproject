<%@page import="kr.or.ddit.member.service.MemberServiceImpl"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="kr.or.ddit.message.vo.MessageVO"%>
<%@page import="kr.or.ddit.friend.service.FriendService"%>
<%@page import="kr.or.ddit.friend.vo.FriendVO"%>
<%@page import="kr.or.ddit.friendreq.handler.SearchFriendReqHandler"%>
<%@page import="kr.or.ddit.friend.service.FriendServiceImpl"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<MessageVO> list = (List<MessageVO>) request.getAttribute("messagelist");
	String userId = (String) request.getSession().getAttribute("userId");
	IMemberService memberService = MemberServiceImpl.getInstance();
	MemberVO logininfo = memberService.getMember(userId);
	
	FriendVO fv = new FriendVO();
	fv.setMemId(userId);
	FriendService FriendService = FriendServiceImpl.getInstance();
	List<FriendVO> friendlist = FriendService.getSearchFriend(fv);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>

<body>
	<div class="container" style="width: 300px">
		<h3>쪽지보내기</h3>
		<table class="tabletable-hover">
			<form action="insert.do" method="post" enctype="multipart/form-data">
				<input type="hidden" value="<%=userId%>" name="memId">
			<tr>
				<td width="50px">FROM</td>
				<td><input type="text" name="memNickname"
					value="<%=logininfo.getMemNickname()%>" readonly="readonly"></td>
			</tr>
			<tr>
				<td width="50px">TO</td>
				<td><select id="receiveMemSelect" onchange="fn_selectMessageTo(this)" name="receiveMem">
						<%
							if (friendlist != null) {
								int cnt = 0;
						%>
						<option value=0>--일촌--</option>
						<%
							for (FriendVO friendVO : friendlist) {
									cnt++;
									String friendId = friendVO.getFriendId();
									MemberVO friendinfo = memberService.getMember(friendId);
									
						%>
						<option value="<%=friendVO.getFriendId()%>"><%=friendinfo.getMemNickname()%></option>
						<%
							}
							} else {
							}
						%>
						<option>직접입력</option>
				</select> <input type="hidden" name="receiveMem" id="receiveMemStr"></td>
			</tr>
			<tr>
				<td width="50px">내용</td>
				<td><textarea style="margin: 0px; height: 181px; width: 176px;"
						name="messageContent" id="messageContent">
			</textarea>
			</tr>
		</table>
		<input type="button" value="확인" onclick="messageinsert()"> <input
			type="button" value="취소" onclick="winclose()">
		</form>
		</table>
		<divid="divtmp">
	</div>
	</div>
</body>
<script type="text/javascript">
var flag ="F";
	function fn_selectMessageTo(vara){
		//if(this.value) location.href=(this.value);
		if(vara.value=="직접입력"){
		// window.open("http://localhost/DEworld/hompi/main.do?hompiId="+vara.value,"width=1085,height=551,scrollbars=no,toolbar=no,location=no,resizable=no,status=no,menubar=no,resizable=no");
			$("#receiveMemStr").attr("type","text");
			flag= "T";
		}else{
			$("#receiveMemStr").attr("type","hidden");
			flag="F";
			}
		}
	
		function winclose(){
			window.close();
		}
		
		function chkMsgTo(){
			if(($("#receiveMemSelect").val()==0)){
				alert("누구에게 보내실 건가요?");
				return false;
			} else if(($("#receiveMemSelect").val()=="직접입력") && ($("#receiveMemStr").val()=="")){
				alert("누구에게 보내실 건가요?");
				return false;
			}else{
				return true;
			}
		}
		
		function messageinsert(){
		if(chkMsgTo()){
		var userId = '<%=userId%>';
		var receiveMem ="";
		if(flag=="T"){
			receiveMem = $("#receiveMemStr").val();
		}else{
			receiveMem = $("#receiveMemSelect").val();
		}
		var messageContent = $("#messageContent").val();
		$.ajax({
		url : "/DEworld/message/insert.do",
		type : "post",
		data : {
		 "memId" : userId
		, "receiveMem" : receiveMem
		, "messageContent" : messageContent
		},
		success : function(data) {
		gobeforeguestbook(userId);
		},
		error : function(xhr) {
		console.error(xhr);
		}
		});
		}
		}
		
		function gobeforeguestbook(userId){
			var URI = "http://localhost/DEworld/message/list.do?userId=" + userId;
			window.location.href = URI;
		}
	</script>
</html>