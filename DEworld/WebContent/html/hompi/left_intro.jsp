<%@page import="kr.or.ddit.hompi.service.HompiServiceImpl"%>
<%@page import="kr.or.ddit.hompi.service.HompiService"%>
<%@page import="kr.or.ddit.hompi.vo.HompiVO"%>
<%@page import="kr.or.ddit.friend.service.FriendServiceImpl"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.friend.service.FriendService"%>
<%@page import="kr.or.ddit.friend.vo.FriendVO"%>
<%@page import="kr.or.ddit.friendreq.handler.SearchFriendReqHandler"%>
<%@page import="kr.or.ddit.member.service.MemberServiceImpl"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String userId = (String)request.getSession().getAttribute("userId");
    IMemberService memberService = MemberServiceImpl.getInstance();
    MemberVO logininfo = memberService.getMember(userId);
    
    String hompiId = request.getParameter("hompiId");
    
    FriendVO fv = new FriendVO();
    
	HompiVO hv = new HompiVO();
	HompiService hompiService = HompiServiceImpl.getInstance();
	hv.setMemId(hompiId);
	List<HompiVO> list = hompiService.getSearchHompi(hv);
	
	HompiVO hompiinfo = list.get(0);
	
	String hompiProfileImg = list.get(0).getHompiProfileImg();
	
	fv.setMemId(hompiId);
	
	
	fv.setFriendId(request.getParameter("friendId"));
	fv.setFriendDate(request.getParameter("friendDate"));
	
	FriendService FriendService = FriendServiceImpl.getInstance();
	
	List<FriendVO> friendlist = FriendService.getSearchFriend(fv);
    %>
    
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<htmL>
<head>
<script src="/DEworld/js/jquery-3.6.0.js"></script>
<script src="/DEworld/js/hompi/hompi.js"></script>
<title>오늘의 나의 기분</title>
<meta charset="utf-8">

<script type="text/javascript">
function fn_goUrl(vara){
	//if(this.value) location.href=(this.value);
	if(vara.value!=""&&vara.value!="파도타기"){
		 var options = 'top=10, left=10, width=1085, height=551, status=no, menubar=no, toolbar=no, resizable=no';
		 var url = "http://localhost/DEworld/hompi/main.do?hompiId="+vara.value;
		 window.open(url, name, options);
	}
}
</script>

</head>

<body>



	<table border="0" width="130">
		<tr>
			<td bgcolor="#DBDBDB" align="center"><font face="굴림"
				style="font-size: 8pt;">today is... 상큼!</font></td>
		</tr>
		<tr>
			<td>
				<table bgcolor="#DBDBDB" width="130" cellpadding="1" cellspacing="1">
					<tr bgcolor="#FFFFFF">
						<td bg><img src="/DEworld/image/profileImg/"" width="128" height="110"
							border="0" alt="오늘의 나의 사진" id="leftProfile"/>
<!-- 						<img src="/DEworld/image/hompiProfile/" width="128" height="110" -->
							</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td id="leftBarInfo"><font face="굴림" style="font-size: 9pt;">
					<%=hompiId %>
			</font></td>
		</tr>
	</table>
	<br />
	<br />
	<br />
	<table bgcolor="#DBDBDB" width="130" cellpadding="1" cellspacing="1">
		<tr align="center">
			<td bgcolor="#FFFFFF"><font face="굴림" style="font-size: 9pt;">
					<b>DEWorld</b><br>
				<a href="http://localhost/DEworld/html/mainPage/topic.jsp"
					target="_blank"><font color="#000099">DEWorld.com</font></a>
					<select id="friendSelect" onchange="fn_goUrl(this)">
						<%if(friendlist!=null){
							int cnt=0;
							%>
								<option>파도타기</option>
							<%
							for(FriendVO friendVO : friendlist){
							cnt++;
								%>
								<option value="<%=friendVO.getFriendId()%>"><%=friendVO.getFriendId()%></option>							
								<%
								
							}
							%>
							</select>
							<%
						}else {
							%>
							<option value=0>파도타기</option>
							<%
						}
							%>
					</select>
			</font></td>
		</tr>
	</table>

</body>

</html>
