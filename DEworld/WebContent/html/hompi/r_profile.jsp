<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="kr.or.ddit.member.service.MemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    String userId = (String)request.getSession().getAttribute("userId");
    String hompiId = request.getParameter("hompiId");
    
    IMemberService memberService = MemberServiceImpl.getInstance();
    MemberVO logininfo = memberService.getMember(userId);
    MemberVO hompiinfo = memberService.getMember(hompiId);
    %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<htmL>
 <head>
  <title> 프로필 페이지 </title>
  <meta http-equiv="content-type" content="text/html; charset=utf-8">
 </head>

 <body>
  
	<table border="0" width="420" cellpadding="0" cellspacing="0">
		<tr>
			<td>&nbsp;&nbsp;<font face="굴림" style="font-size:9pt;"><b>프로필</b></font></td>
		</tr>
		<tr>
			<td align="center">  
				<img src="./images/bar.jpg" width="420" height="6" border="0" alt="">
				<font face="굴림" style="font-size:9pt;">
					<br/>
					저의 프로필입니다.<br/><br/>
					나의 이름은 <%=hompiinfo.getMemNickname() %><br/><br/>
					나이는 23<br/><br/>
					<br/>
					끝!!<br/><br/>
				</font>

				<img src="./images/bar.jpg" width="420" height="6" border="0" alt="">
			</td>
		</tr>

	</table>
 </body>
</html>
