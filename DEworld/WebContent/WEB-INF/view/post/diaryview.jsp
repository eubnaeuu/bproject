<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="kr.or.ddit.member.service.MemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="kr.or.ddit.comments.vo.CommentsVO"%>
<%@page import="kr.or.ddit.post.vo.PostVO"%>
<%@page import="kr.or.ddit.comm.vo.AtchFileVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// String userId = (String)request.getSession().getAttribute("nowLogin"); // 세션의 로그인아이디값 가져오기
// if(request.getAttribute("atchFileList") != null){
// }
	
	List<AtchFileVO> atchFileList = (List<AtchFileVO>) request.getAttribute("atchFileList");
	PostVO pv = (PostVO)request.getAttribute("pv");
	List<CommentsVO> commentslist = (List<CommentsVO>) request.getAttribute("commentslist");

	String msg = request.getParameter("msg") == null ? "" : request.getParameter("msg");

	String userId = (String) request.getSession().getAttribute("userId");
	IMemberService memberService = MemberServiceImpl.getInstance();
	MemberVO logininfo = memberService.getMember(userId);
	
	String hompiId = request.getParameter("hompiId");
	String postNo = pv.getPostNo();
	String flag = "dia";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사진글상세</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
body
	{
	font-family : 굴림;
	font-size : 9pt;
	scrollbar-face-color: #FFFFFF;
	 scrollbar-highlight-color: #DBDBDB;
	 scrollbar-3dlight-color: #FFFFFF;
	 scrollbar-shadow-color: #9C92FF;
	 scrollbar-darkshadow-color: #FFFFFF;
	 scrollbar-track-color: #FFFFFF;
	 scrollbar-arrow-color: #9C92FF;
	 }
a {
	text-decoration: none;
}	 
	 
</style>
</head>
<body>
	<input type="hidden" value="" id="memNickname" class="memNickname">
	<center><img src="images/bar.jpg" width="450" height="6" border="0" alt=""></center>
	<table border="0" bgcolor="#EBEBEB" width="450" cellpadding="1" cellspacing="1" align="center">
		<tr>
			<td>
			<font face="굴림" style="font-size:9pt;"><b><%=pv.getPostContent()%></b></font>
			</td>
		</tr>
	</table>
	<!-- 따옴 시작 -->
	<table border="0" align="center" width="450" cellpadding="1" cellspacing="1">
		<tr>
			<td width="100">  
				<font face="굴림" style="font-size:9pt;"><%=pv.getMemNickname()%></font>
			</td>
			<td align="right">  
				<font face="굴림" style="font-size:9pt;"><%=pv.getPostDate().substring(2,16)%> 스크랩:0</font>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<%
					if (atchFileList != null) {
						for (AtchFileVO atchFileVO : atchFileList) {
				%>
				<div>
					<img width="200px"
						src="/DEworld/atchFile/<%=atchFileVO.getStreFileNm()%>.<%=atchFileVO.getFileExtsn()%>">
				</div> <%
 	}
 	} else {
%><% 
 	}
 %>
			</td>
		</tr>
	</table>
	<div style="text-align: right;">
		<font face="굴림" style="font-size: 9pt; color: #FDA500"> <span
			onclick="list()">[목록]</span>
		</font> <font face="굴림" style="font-size: 9pt; color: #FDA500"> <span
			onclick="update()">[수정]</span></font> <font face="굴림"
			style="font-size: 9pt; color: #FDA500"> <span
			onclick="remove()">[삭제]</span></font>
	</div>
	
	<%
		if (commentslist != null) {
			for (CommentsVO cv : commentslist) {
	%>
	<table bgcolor="#F6F6F6" width="450" >
		<tr>
			<td><a href=""><%=cv.getMemNickname()%></a></td>
			<td><%=cv.getCommentsContent()%>(<%=cv.getCommentsDate()%>)</td>
			<%
				if (userId.equals(cv.getMemId())) {
			%>
			<td><a href=""><button>수정</button></a></td>
			<td><a href=""><button>삭제</button></a></td>
			<%
				}
			%>
		</tr>
	</table>
	<%
		}
		} else {
	%>
	<table bgcolor="#F6F6F6" width="450" >
		<tr>
			<td>댓글이 존재하지 않습니다</td>
		</tr>
	</table>
	<%
		}
	%>
	<form action="<%=request.getContextPath()%>/comments/insert.do"
		method="post">
		<input type="hidden" class="memIdVal" name="memId"
			value="<%=logininfo.getMemId()%>">
		<table bgcolor="#F6F6F6" width="450" >
			<tr>
				<td class="memNicknameText">댓글</td>
				<td><input type="text" name="commentsContent"></td>
				<td><input type="hidden" name="postNo"
					value="<%=pv.getPostNo()%>"> <a
					href="<%=request.getContextPath()%>/post/select.do?postNo=<%=pv.getPostNo()%>"><button
							type="submit">등록</button></a> </a></td>
			</tr>
		</table>
	</form>

</body>
<script type="text/javascript">

function chkmsg() {
	return confirm("정말 삭제하시겠습니까?");
}
function chkmsg1() {
	return confirm("수정을 완료 하시겠습니까?");
}

function list(){
	var hompiId = '<%=hompiId%>';
	var flag = 'dia';
	
	gobeforelist(hompiId,flag);
}
function remove() {
	var hompiId = '<%=hompiId%>';
	var postNo = '<%=postNo%>';
	var flag = 'dia';
	
	if (!chkmsg()) {
		return;
	}
	var param = {
			'postNo' : postNo
			,'hompiId' : hompiId 
			,'flag' : flag 
	};
		$.ajax({
			url : "/DEworld/post/delete.do"
			,type : "post"
			,data : param
			,success : function(data){
				gobeforelist(hompiId,flag);
			}
			,error : function(xhr){
				console.error(xhr);
			}
		});
}

function gobeforelist(hompiId,flag){
	var URI="http://localhost/DEworld/post/list.do?hompiId="
			+hompiId+"&flag="+flag
	window.location.href = URI;
}

function gobeforeview(hompiId,flag,postNo){
	var URI="http://localhost/DEworld/post/select.do?hompiId="
			+hompiId+"&flag="+flag+"&postNo="+postNo
	window.location.href = URI;

}

</script>
</html>