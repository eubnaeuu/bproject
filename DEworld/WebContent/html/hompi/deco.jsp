<%@page import="kr.or.ddit.hompi.service.HompiServiceImpl"%>
<%@page import="kr.or.ddit.hompi.service.HompiService"%>
<%@page import="kr.or.ddit.hompi.vo.HompiVO"%>
<%@page import="kr.or.ddit.member.service.MemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="kr.or.ddit.comments.vo.CommentsVO"%>
<%@page import="kr.or.ddit.paging.PagingVO"%>
<%@page import="kr.or.ddit.post.vo.PostVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	HompiVO hv = new HompiVO();

	String hompiId = request.getParameter("hompiId");
	String userId = (String) request.getSession().getAttribute("userId");
	hv.setHompiId(hompiId);

	HompiService hompiService = HompiServiceImpl.getInstance();
	List<HompiVO> list = hompiService.getSearchHompi(hv);

	String hompiNick = list.get(0).getHompiId();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1; text/html; charset=UTF-8">
<title>게시글 목록</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
	// $(document).ready(function(){
	// 	var userId = sessionStorage.getItem("nowLogin");
	// });
</script>
</head>
<body>
	<div class="container">
		<table id="postlisttable" class="table table-hover">
			<thead>
				<tr>보유중인 미니미 목록</tr>
				<tr id="minimiList">
				</tr>
			</thead>
			<tbody>

			</tbody>
		</table>
	</div>
</body>
</html>