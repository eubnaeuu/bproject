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
List<PostVO> postlist = (List<PostVO>)request.getAttribute("postlist");
PagingVO pagingVO = (PagingVO)request.getAttribute("pagingVO");
String msg = request.getParameter("msg") == null ? ""
		: request.getParameter("msg");

String userId = (String)request.getSession().getAttribute("userId");
IMemberService memberService = MemberServiceImpl.getInstance();
MemberVO logininfo = memberService.getMember(userId);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<htmL>
 <head>
  <title>게시판 </title>
  <meta http-equiv="content-type" content="text/html; charset=utf-8">

 	<style type="text/css">
	body
	{scrollbar-face-color: #FFFFFF;
	 scrollbar-highlight-color: #DBDBDB;
	 scrollbar-3dlight-color: #FFFFFF;
	 scrollbar-shadow-color: #9C92FF;
	 scrollbar-darkshadow-color: #FFFFFF;
	 scrollbar-track-color: #FFFFFF;
	 scrollbar-arrow-color: #9C92FF}
	</style>

 </head>

<script language="javascript">
<!--
	function comment_ok()
	{
		var text = document.poto.commenti.value;
		if (text != "")
		{
			text = text + '\n\n\n' + '댓글이 추가되었습니다. ^_^';
			alert(text);

		}
		else
		{
			alert('댓글을 입력해 주세요 ^^');
		}
	}
//-->
</script>


 <body>
<table border='2px solid' id="postlisttable">
			<thead>
				<tr>
					<th><input class="PostChk" id="PostCheckboxAll" style="display: none;" type="checkbox" name="PostCheckboxAll" onclick="checkAll();"></th>
					<th>구   분</th>
					<th>제   목</th>
					<th>내   용</th>
					<th>작성일</th>
					<th>조   회</th>
				</tr>
			</thead>
			<tbody>
					<%
					int size = postlist.size();
					if(size > 0){
						int cnt = 1;
						String PostChkId = "PostCheckbox"+cnt;
						for (int i=0; i < size;  i++){
							%>
							<tr>
							<th><input class="PostChk PostChkArr" id="<%=postlist.get(i).getPostNo() %>chkbox" style="display: none;" type="checkbox" name="PostCheckbox"></th>
							<td><%= cnt%></td>
							<td><a href="select.do?postNo=<%=postlist.get(i).getPostNo()%>"><%= postlist.get(i).getPostTitle() %></a></td>
							<td><%= postlist.get(i).getPostContent()%></td>
							<td><%= postlist.get(i).getPostDate()%></td>
							<td><%= postlist.get(i).getPostView()%></td>
							</tr>
							<%
							cnt++;
							}
							%>
<!-- 페이징 처리 시작 -->
	      <%if(pagingVO.getTotalCount() > 0) {%>
	         <tr>
	            <td colspan="4" align="center">
	               <%if(pagingVO.getFirstPageNo() > pagingVO.getPageSize()) { %>
	               <a href="list.do?pageNo=<%=pagingVO.getFirstPageNo() - pagingVO.getPageSize() %>">[이전]</a>
	               <%} %>
	               <%for(int pNo = pagingVO.getFirstPageNo(); pNo <= pagingVO.getLastPageNo(); pNo++) { %>
	                  <a <%if(pNo == pagingVO.getCurrentPageNo()){ %> style="color:orange;"<%} %> href="list.do?pageNo=<%=pNo %>">[<%=pNo %>]</a>
	               <%} %>
	               <%if(pagingVO.getLastPageNo() < pagingVO.getTotalPageCount()) {%>
	               <a href="list.do?pageNo=<%=pagingVO.getFirstPageNo() + pagingVO.getPageSize() %>">[다음]</a>
	               <%} %>
	            </td>
	         </tr>
	      <%} %>
<!-- 페이징 처리 끝 --> 
						
					<%}else{
					%>
					<tr>
						<td colspan="5">게시글이  존재하지 않습니다.</td>
					</tr>
					<%
						}
					%>
			</tbody>
			</table>
			<%if((userId.trim()).equals(postlist.get(0).getHompiId().trim())){
				%>
			<a href="insert.do"><button type="button">등록</button></a>
			<%
			}
			%>
			<select id="selectstr">
				<option value="1">제목</option>
				<option value="2">내용</option>
				<option value="3">작성자</option>
			</select>
		<input type="text" id="inputstr">
		<button type="button" onclick="search()">검색</button>
<!-- 		<a href="list.do"><button type="button" onclick="select()">조회</button></a> -->
			<%if((userId.trim()).equals(postlist.get(0).getHompiId().trim())){
				%>
		<button type="button" onclick="toggleChk()">선택</button>
		<a href="list.do"><button type="button" onclick="remove()">삭제</button></a>
			<%
			}
			%>
</body>

<script type="text/javascript">

function checkAll(){
	if($("[name=PostCheckboxAll]").prop("checked")){
		$("[name=PostCheckbox]").prop("checked",true);
	}else{
		$("[name=PostCheckbox]").prop("checked",false);
	}
}

function toggleChk(){
$(".PostChk").toggle();
}

function update(){
	inputparam = $("#inputstr").val();
	updateparam = $("#updatestr").val();
	var param = {
			'postNo' : inputparam         
			,'postTitle' : updateparam    
			};
	$.ajax({
		url : "/DEworld/post/update.do"
		,type : "post"
		,data : param
// 		,dataType : "json"
		,success : function(data){
			console.log(data)
			
		}
		,error : function(xhr){
			console.error(xhr);
		}
		
	});
}

function chkdel(){
	var cnt=0;
	var postChkId="";
	var chkboxes = $(".PostChkArr");
	var length = $(".PostChkArr").length;
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
		url : "/DEworld/post/list.do"
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
	var chkboxes = $(".PostChkArr");
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
			'postNo' : str
			};
	$.ajax({
		url : "/DEworld/post/delete.do"
		,type : "post"
		,data : param
// 		,dataType : "json"
		,success : function(data){
			console.log(data);
		}
		,error : function(xhr){
			console.error(xhr);
		}
	});
}

 
function create(){
	inputparam = $("#inputstr").val();
	var param = {
			'postNo' : inputparam         
			,'postTitle' : inputparam2         
			};
	$.ajax({
		url : "/DEworld/post/insert.do"
		,type : "post"
		,data : param
// 		,dataType : "json"
		,success : function(data){
			console.log(data)
			alert("성공");
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
			var URI="http://localhost/DEworld/post/search.do?postTitle="+inputparam;
			window.location.href = URI;
		} else if ("2" == flag) {
			var URI="http://localhost/DEworld/post/search.do?postContent="
					+ inputparam;
			window.location.href = URI;
		} else if ("3" == flag) {
			var URI="http://localhost/DEworld/post/search.do?memId="
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
			url : "/DEworld/post/search.do",
// 			type : "POST",
			data : param
			//  		,dataType : "json"
			,
			success : function(data) {
				console.log(data)
			},
			error : function(xhr) {
				console.error(xhr);
			}

		});
	}

	function chkmsg() {
		return confirm("정말 삭제하시겠습니까?");
	}

	function select() {
		$.ajax({
			url : "/DEworld/post/list.do",
			type : "POST"
			// 		,dataType : "json"
			// 		,data : param
			,
			success : function(data) {
				console.log(data)
				// 			makeTable(data);
			},
			error : function(xhr) {
				console.error(xhr);
			}
		});
	}
</script>
</html>
