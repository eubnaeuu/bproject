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
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>쪽지 목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
</script>
</head>
<body>
<table border='2px solid' id="messagelisttable">
			<thead>
				<tr>
					<th><input class="MessageChk" id="MessageCheckboxAll" style="display: none;" type="checkbox" name="MessageCheckboxAll" onclick="checkAll();"></th>
					<th>구  분:</th>
					<th>보낸이:</th>
					<th>받는이</th>
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
							<td><input class="MessageChk MessageChkArr" id="<%=messagelist.get(i).getMessageNo() %>chkbox" style="display: none;" type="checkbox" name="MessageCheckbox"></td>
							<td><%= cnt%></td>
							<td><%= messagelist.get(i).getMemId()%></td>
							<td><%= messagelist.get(i).getReceiveMem()%></td>
							<td><a href="select.do?messageNo=<%=messagelist.get(i).getMessageNo()%>"><%= messagelist.get(i).getMessageContent()%></a></td>
							<td><%= messagelist.get(i).getMessageDate()%></td>
							<td><%= messagelist.get(i).getMessageStatus()%></td>
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
						<td colspan="5">쪽지가  존재하지 않습니다.</td>
					</tr>
					<%
						}
					%>
			</tbody>
			</table>
			<a href="insert.do"><button type="button">등록</button></a>
			<select id="selectstr">
				<option value="1">사람검색</option>
				<option value="2">내용검색</option>
			</select>
		입력값<input type="text" id="inputstr"><br>
		<button type="button" onclick="search()">서치</button>
		<a href="list.do"><button type="button" onclick="select()">조회</button></a>
		<button type="button" onclick="toggleChk()">선택</button>
		<a href="list.do"><button type="button" onclick="remove()">삭제</button></a>
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
			alert("실패");
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
			// 		,dataType : "json"
			// 		,data : param
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