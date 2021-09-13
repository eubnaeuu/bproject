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
	List<AtchFileVO> atchFileList = (List<AtchFileVO>) request.getAttribute("atchFileList");
	PostVO pv = (PostVO) request.getAttribute("pv");
	List<CommentsVO> commentslist = (List<CommentsVO>) request.getAttribute("commentslist");

	String msg = request.getParameter("msg") == null ? "" : request.getParameter("msg");

	String userId = (String) request.getSession().getAttribute("userId");
	IMemberService memberService = MemberServiceImpl.getInstance();
	MemberVO logininfo = memberService.getMember(userId);

	String hompiId = request.getParameter("hompiId");
	String postNo = pv.getPostNo();
	String flag = "pos";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글상세</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>

a {
	text-decoration: none;
}
</style>
</head>
<body>
	<table border="0" bgcolor="#EBEBEB" width="450" cellpadding="1"
		cellspacing="1" align="center">
		<tr>
			<td>
				<font face="굴림" style="font-size: 9pt;"><b><%=pv.getPostTitle()%></b></font>
			</td>
		</tr>
	</table>
	<table border="0" align="center" width="450" cellpadding="1" cellspacing="1">
		<tr style="border-bottom: 1px solid silver;">
			<td style="border-bottom: 1px solid silver;" width="100" colspan="2">
				<font face="굴림" style="font-size: 9pt;"><%=pv.getMemNickname()%></font>
			<td style="border-bottom: 1px solid silver;" width="100"><font face="굴림" style="font-size: 9pt;"><%=pv.getPostDate().substring(2, 16)%></font></td>
		</tr>
	</table>
	<br>
	<table border="0" align="center" width="450" cellpadding="1" cellspacing="1">
		<tr>
			<td colspan="3">
				<font face="굴림" style="font-size: 9pt;"><%=pv.getPostContent()%></font>
			</td>
		</tr>
	</table>
	<br>
	<%
		int cnt = 0;
		if (atchFileList != null) {
	%>
	<font face="굴림" style="font-size: 9pt;">첨부파일 : </font>
	<%
		for (AtchFileVO atchFileVO : atchFileList) {
				cnt++;
	%>
	<font face="굴림" style="font-size: 9pt;"> <a
		href="<%=request.getContextPath()%>/filedownLoad.do?fileId=<%=atchFileVO.getAtchFileId()%>
																			&fileSn=<%=atchFileVO.getFileSn()%>">
			<%=atchFileVO.getOrignlFileNm()%>
	</a>
	</font>
<!-- 	<img width="50px" height="50px" -->
<%-- 		src="/DEworld/atchFile/<%=atchFileVO.getStreFileNm()%>.<%=atchFileVO.getFileExtsn()%>"> --%>
	<%
		}
	%>
	<%
		} else {
	%>
	<%
		}
	%>
	<div style="text-align: right;">
		<font face="굴림" style="font-size: 9pt; color: #FDA500"> <span
			onclick="list()">[목록]</span>
		</font> <font face="굴림" style="font-size: 9pt; color: #FDA500"> <span
			onclick="update()">[수정]</span></font> <font face="굴림"
			style="font-size: 9pt; color: #FDA500"> <span
			onclick="remove()">[삭제]</span></font>
	</div>



	<!-- 댓글시작 -->
	<%
		if (commentslist != null) {
			for (CommentsVO cv : commentslist) {
				String cowriter = cv.getMemId();
	%>
	<table bgcolor="#F6F6F6" width="450">
		<tr>
			<td width="30"><a href=""><font face="굴림"
					style="font-size: 9pt;"><span onclick="goUrl('<%=cowriter%>')"><%=cv.getMemNickname()%></span></font></a></td>
			<td width="200"><font face="굴림" style="font-size: 9pt;"><%=cv.getCommentsContent()%>(<%=cv.getCommentsDate()%>)</font></td>
			<%
				if (userId.equals(cv.getMemId())) {
			%>
			<td width="8"><a href=""><button>수정</button></a></td>
			<td width="8"><a href=""><button>삭제</button></a></td>
			<%
				}
			%>
		</tr>
	</table>
	<%
		}
		} else {
		}
	%>
	<input id="memId" type="hidden" class="memIdVal" name="memId"
		value="<%=logininfo.getMemId()%>">
	<table bgcolor="#F6F6F6" width="450">
		<tr>
			<td width="30" class="memNicknameText"><font face="굴림"
				style="font-size: 9pt;">댓글</font></td>
			<td width="100">
				<font face="굴림" style="font-size: 9pt;">
				<input id="commentsContent" size="30" type="text" name="commentsContent">
				</font>
			</td>
			<td>
			<button type="button" onclick="coinsert()">등록</button>
			</td>
		</tr>
	</table>
	<!-- 댓글종료 -->
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
	var flag = 'pos';
	gobeforelist(hompiId,flag);
}

function coinsert(){
	var memId = $("#memId").val(); 
	var commentsContent = $("#commentsContent").val();
	var hompiId = '<%=hompiId%>';
	var postNo = '<%=postNo%>';
	var flag = '<%=flag%>';
	var param = { 
			'postNo' : postNo
			,'hompiId' : hompiId 
			,'memId' : memId 
			,'flag' : flag 
			,'commentsContent' : commentsContent 
	};
	$.ajax({
		url : "/DEworld/comments/insert.do"
		,type : "post"
		,data : param
		,success : function(data){
			gobeforeview(hompiId,flag,postNo);	
		}
		,error : function(xhr){
			alert("이이");
			console.error(xhr);
		}
	});
}


function remove() {
	var hompiId = '<%=hompiId%>';
	var postNo = '<%=postNo%>';
	var flag = 'pos';
	
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


function update(){
	
	var hompiId = '<%=hompiId%>';
	var postNo = '<%=postNo%>';
		var flag = 'pos';

		var URI = "http://localhost/DEworld/post/update.do?hompiId=" + hompiId
				+ "&flag=" + flag + "&postNo=" + postNo;
		window.location.href = URI;
	}

	function gobeforelist(hompiId, flag) {
		var URI = "http://localhost/DEworld/post/list.do?hompiId=" + hompiId
				+ "&flag=" + flag;
		window.location.href = URI;
	}

	function gobeforeview(hompiId, flag, postNo) {
		var URI = "http://localhost/DEworld/post/select.do?hompiId=" + hompiId
				+ "&flag=" + flag + "&postNo=" + postNo;
		window.location.href = URI;
	}
	
	function goUrl(vara){
		 var options = 'top=10, left=10, width=1085, height=551, status=no, menubar=no, toolbar=no, resizable=no';
		var url = "http://localhost/DEworld/hompi/main.do?hompiId="+vara;
		    window.open(url, name, options);
	}
</script>
</html>