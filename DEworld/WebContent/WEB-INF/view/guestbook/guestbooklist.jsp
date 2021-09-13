<%@page import="kr.or.ddit.hompi.service.HompiServiceImpl"%>
<%@page import="kr.or.ddit.hompi.service.HompiService"%>
<%@page import="kr.or.ddit.hompi.vo.HompiVO"%>
<%@page import="kr.or.ddit.member.service.MemberServiceImpl"%>
<%@page import="kr.or.ddit.member.service.IMemberService"%>
<%@page import="kr.or.ddit.member.vo.MemberVO"%>
<%@page import="kr.or.ddit.comments.vo.CommentsVO"%>
<%@page import="kr.or.ddit.paging.PagingVO"%>
<%@page import="kr.or.ddit.guestbook.vo.GuestBookVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// String strJson = (String)request.getAttribute("strJson");
List<GuestBookVO> guestbooklist = (List<GuestBookVO>)request.getAttribute("guestbooklist");
PagingVO pagingVO = (PagingVO)request.getAttribute("pagingVO");
String msg = request.getParameter("msg") == null ? ""
		: request.getParameter("msg");

String userId = (String)request.getSession().getAttribute("userId");
IMemberService memberService = MemberServiceImpl.getInstance();
MemberVO logininfo = memberService.getMember(userId);

HompiVO hv = new HompiVO();
HompiVO hv2 = new HompiVO();
HompiService hompiService = HompiServiceImpl.getInstance();
String hompiId	= request.getParameter("hompiId");

hv.setHompiId(hompiId);
List<HompiVO> list = hompiService.getSearchHompi(hv);

HompiVO hompiinfo = list.get(0);

hv2.setHompiId(userId);
List<HompiVO> list2 = hompiService.getSearchHompi(hv2);
HompiVO userhompiinfo = list2.get(0);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<htmL>
 <head>
  <title> 방명록 </title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <meta http-equiv="content-type" content="text/html; charset=utf-8">
 </head>

<script language="javascript">
	function write_guest_ok(){
	
		var hompiId = '<%=hompiId%>';
		var userId = '<%=userId%>';
		var gbContent = $("#gbContent").val();
		$.ajax({
			url : "/DEworld/guestbook/insert.do",
			type : "post",
			data : {
				"hompiId" : hompiId
				, "gusetbookWriter" : userId
				, "guestbookContent" : gbContent
				},
			success : function(data) {
				gobeforeguestbook(hompiId);
			},
			error : function(xhr) {
				console.error(xhr);
			}
	});
}
	
	function gobeforeguestbook(hompiId){
		var URI="http://localhost/DEworld/guestbook/list.do?hompiId="
				+hompiId
		window.location.href = URI;

	}

</script>

 <body>

<form name="guest">

	<!-- 탑, 글쓰기 -------------------------------------------------------------------------------- -->
 	<table width="410" border="0" cellpadding="3" cellspacing="1" bgcolor="#DBDBDB" align="center">
		<tr bgcolor="#FFFFFF">
			<td align="center"> 
				<font face="굴림" style="font-size:9pt;">
					오늘도 사이좋은 사람들과 행복한 하루를...
				</font>
			</td>
		</tr>
	</table>
	<br/>
	<table width="430" border="0" align="center">
		<tr>
			<td align="right"> 
			</td>
		</tr>
	</table>

	<center><img src="images/bar.jpg" width="430" height="6" border="0" alt=""></center>
	<table width="410" border="0" cellpadding="0" cellspacing="0" align="center">
		<tr>
			<td>  
				<img src="/DEworld/image/profileImg/<%=userhompiinfo.getHompiProfileImg() %>" width="98" height="98" border="0" alt="">
			</td>
			<td align="center">
				<input type="hidden" value="<%=userId %>" name="guestbookWriter" id="gbWriter">
				<input type="hidden" value="<%=hompiId %>" name="hompiId" id="gbhompiId">  
				<textarea id="gbContent" name="guestbookContent" rows="7" cols="40"></textarea>
			</td>
		</tr>
	</table>
	<table border="0" width="410" cellpadding="0" cellspacing="0" align="center">
		<tr>
			<td width="230">  
				<font face="굴림" style="font-size:9pt;">
				<input type="hidden" name="minami_or_card" value="mimami" checked>
				<input type="hidden" name="minami_or_card" value="card">
				</font>
			</td>
			<td width="200" align="right">  
				<input type="button" name="write_guest" value="확인" onclick="write_guest_ok()">
			</td>
		</tr>
	</table>
	<center><img src="../images/bar.jpg" width="430" height="6" border="0" alt=""></center>
	<!-------- -------------------------------------------------------------------------------- -->



	<br/><br/><br/><br/>



	<!-- 방명록 글 시작 ------------------------------------------------------------ -->
	<center><img src="images/bar.jpg" width="430" height="6" border="0" alt=""></center>
<%
					int size = guestbooklist.size();
					if(size ==0){%>
						 <table border="0" width="430" cellpadding="1" cellspacing="1" align="center">
						 <tr><td style='text-align:center;'>작성된 방명록이 없습니다</td></tr>
						 <% 
					}

					if(size > 0){
						int cnt = 0;
						String GuestBookChkId = "GuestBookCheckbox"+cnt;
						for (int i=0; i < size ;  i++){
							



						cnt++;	
						MemberVO guestbookwriterinfo = memberService.getMember(guestbooklist.get(i).getGusetbookWriter());
						
						HompiVO hv3 = new HompiVO();						
						
						hv3.setHompiId(guestbooklist.get(i).getGusetbookWriter());
						List<HompiVO> list3 = hompiService.getSearchHompi(hv3);
						HompiVO guesthompiinfo = list3.get(0);
						
							%>
	<table border="0" bgcolor="#EBEBEB" width="430" cellpadding="1" cellspacing="1" align="center">
		<tr>
			<td><font face="굴림" style="font-size:8pt;">NO. <%=cnt %></font></td>
			<td><font face="굴림" style="font-size:9pt;"><%=guestbookwriterinfo.getMemNickname() %></font></td>
			<td><font face="굴림" style="font-size:8pt;"><%=guestbooklist.get(i).getGuestbookDate() %></font></td>
			<td align="right"><font face="굴림" style="font-size:9pt;">수정 | 삭제 </font></td>
		</tr>
	</table>
	<table border="0" width="410" align="center">
		<tr>
			<td width="100">  
				<img src="/DEworld/image/profileImg/<%=guesthompiinfo.getHompiProfileImg() %>" width="98" height="98" border="0" alt="">
			</td>
			<td width="330">  
				<font face="굴림" style="font-size:9pt;">
					<%=guestbooklist.get(i).getGuestbookContent() %>
				</font>
			</td>
		</tr>
	<%
						if(hompiId.equals(userId)){
			%>
		<tr>
			<td colspan="2" align="center">
				<textarea name="comment_save" rows="2" cols="47"></textarea>
				<input type="button" name="comment_save" value="확인" onclick="comment_ok()">
			</td>
		</tr>
		</table><br><br>		
		
		<%
						}else{
							%>
		</table><br><br>					
							<%
						}
	
						}	
						%>
<!-- 페이징 처리 시작 -->
	      <%if(pagingVO.getTotalCount() > 0) {%>
	         <tr>
	            <td colspan="6" align="center">
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
						<%
					}else{
						%>
						
						<% 
					}
						%>

	<!-- 방명록 아랫부분 글 검색 부분 ------------------------------------------------------------ -->
<!-- 	<table align="center" border="0" cellpadding="1" cellspacing="1"> -->
<!-- 		<tr height="30"> -->
<!-- 			<td align="center" > -->
<!-- 				<font face="굴림" style="font-size:9pt;"> -->
<!-- 					<img src="../images/left_arr.gif" width="12" height="13" border="0" alt="이전 페이지로"> -->
<!-- 					page 2 1 -->
<!-- 					<img src="../images/right_arr.gif" width="12" height="13" border="0" alt="다음 페이지로"> -->
<!-- 					</font>	 -->
<!-- 			</td> -->
<!-- 		</tr> -->
<!-- 		<tr> -->
<!-- 			<td align="center">   -->
<!-- 				<select name="find"> -->
<!-- 					<option value="find_name">이름으로 검색</option> -->
<!-- 					<option value="find_name">내용으로 검색</option> -->
<!-- 				</select> -->
<!-- 				<input type="text" name="fils_words" size="15"/> -->
<!-- 				<input type="submit" value="확인"/> -->
<!-- 			</td> -->
<!-- 		</tr> -->
<!-- 	</table> -->
		<!-- ---------- ------------------------------------------------------------ -->
	<br/>
	
</form>

 </body>

</html>
