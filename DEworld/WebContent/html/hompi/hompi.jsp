<%@page import="kr.or.ddit.collection.service.CollectionService"%>
<%@page import="kr.or.ddit.collection.service.CollectionServiceImpl"%>
<%@page import="kr.or.ddit.collection.vo.CollectionVO"%>
<%@page import="kr.or.ddit.hompi.service.HompiServiceImpl"%>
<%@page import="kr.or.ddit.hompi.service.HompiService"%>
<%@page import="kr.or.ddit.hompi.vo.HompiVO"%>
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
	HompiVO hv = (HompiVO) request.getAttribute("hompiVO");
	System.out.println("이거 뭔데 : " + hv);
	String hompiId = hv.getHompiId();
	long hompiCountTod = hv.getVisitCountToday();
	long hompiCountTot = hv.getVisitCountTotal();
	String userId = (String) request.getSession().getAttribute("userId");

	IMemberService memberService = MemberServiceImpl.getInstance();

	MemberVO logininfo = memberService.getMember(userId);

	MemberVO hompiinfo = memberService.getMember(hompiId);

	HompiService hompiService = HompiServiceImpl.getInstance();
	hv.setHompiId(hompiId);
	List<HompiVO> list = hompiService.getSearchHompi(hv);

	String miniRoom = list.get(0).getHompiMiniroom();
	
	CollectionVO cv = new CollectionVO();
	CollectionService collectionService = CollectionServiceImpl.getInstance();
	
	cv.setMemId(hompiId);
	cv.setLitemGu("01");
	List<CollectionVO> minimiCollist = collectionService.getSearchItemCollection(cv); // minimi
	
	cv.setLitemGu("02");
	List<CollectionVO> bgCollist = collectionService.getSearchItemCollection(cv); // bg
	List<CollectionVO> musicCollist = collectionService.getSearchMusicCollection(hompiId); // 음원
	
	
	
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<htmL>
<head>
<meta charset="UTF-8">
<title>홈</title>
<script src="/DEworld/js/jquery-3.6.0.js"></script>
<script src="/DEworld/js/hompi/hompi.js"></script>
<style type="text/css">
body {
	scrollbar-face-color: #FFFFFF;
	scrollbar-highlight-color: #DBDBDB;
	scrollbar-3dlight-color: #FFFFFF;
	scrollbar-shadow-color: #9C92FF;
	scrollbar-darkshadow-color: #FFFFFF;
	scrollbar-track-color: #FFFFFF;
	scrollbar-arrow-color: #9C92FF
}

.btm_image {
	cursor: pointer;
	background-color: pink;
	width: 82;
	height: 30;
	transition: all 0.9s;
}

.btm_image:hover {
	box-shadow: 0 80px 0 0 rgba(0, 0, 0, 0.25) inset, 0 -80px 0 0
		rgba(0, 0, 0, 0.25) inset;
}
</style>

</head>



<body bgcolor="#F3F3F3" topmargin="0" leftmargin="0">
	<form name="main">
		<!-- 미니 홈페이지 외각 테이블 -->
		<table border="0" align="left" width="950" height="550"
			cellspacing="0" cellpadding="0"
			background="/DEworld/image/hompiBackground/" id="backgroundTable">
			<tr>
				<td><script language="javascript">
					var now = new Date()
					document
							.write('<span style="font-size:9pt;font-weight:bold">&nbsp;&nbsp;&nbsp; 지금은.. ')
					document.write(now.getFullYear() + '년 '
							+ (now.getMonth() + 1) + '월 ' + now.getDate() + '일'
							+ ' ' + now.getHours() + ':' + now.getMinutes())
					document
							.write('</span>')
				</script>

					<table border="0" align="left" width="800" height="510"
						background="/DEworld/html/hompi/theme/bg_big.gif">
						<tr>
							<td colspan="2" align="center"><br> <font face="굴림"><span
									style="font-size: 8pt;">today &nbsp;<span id="todayCnt"></span> total &nbsp;<span id="totalCnt"></span></span></font></td>
							<td height="40"><br> <font face="굴림"><span
									style="font-size: 13pt; font-weight: bold">
										<center>
											<font color="#4B9687"><%=hompiinfo.getMemNickname()%>님의
												미니 홈페이지
											</font>
										</center>
								</span></font></td>
							<td></td>
						</tr>
						<tr>
							<td width="10"></td>
							<td width="178" height="450"
								background="./images/bg_left_rect.jpg">
								<!-- 왼쪽 내용 부분 ----------------------------------------------------------- -->
								<center>
									<iframe frameborder="0" width="160" height="440" id="leftframe"
										src="/DEworld/html/hompi/left_intro.jsp?hompiId=<%=hompiId%>"></iframe>
								</center>
							</td>
							<td width="480" height="450"
								background="./images/bg_center_rect.jpg">
								<center>
									<!-- 오른쪽 내용 부분 ----------------------------------------------------------- -->
									<iframe frameborder="0" width="470" height="430"
										src="/DEworld/html/hompi/r_home.jsp?hompiId=<%=hompiId%>"
										id="rightIframe"></iframe>
									<!-- ---------------------------------------------------------------------------- -->
								</center>
							</td>
							<!-- 오른쪽 메뉴 부분 ----------------------------------------------------------- -->
							<td>
								<button type="button" class="btm_image" id="img_btn"
									onclick="iframeChange('/DEworld/html/hompi/r_home.jsp?hompiId=<%=hompiId%>')">홈</button>
								<br /> <br />
								<button type="button" class="btm_image" id="img_btn"
									onclick="iframeChangelink('/post/list.do?hompiId=<%=hompiId%>')">게시판</button>
								<br /> <br />
								<button type="button" class="btm_image" id="img_btn"
									onclick="iframeChangelink('/post/list.do?flag=pho&hompiId=<%=hompiId%>')">사진첩</button>
								<br /> <br />
								<button type="button" class="btm_image" id="img_btn"
									onclick="iframeChangelink('/guestbook/list.do?hompiId=<%=hompiId%>')">방명록</button>
								<br /> <br />
								<button type="button" class="btm_image" id="img_btn"
									onclick="iframeChangelink('/post/list.do?flag=dia&hompiId=<%=hompiId%>')">다이어리</button>
								<br /> <br />
								<button type="button" class="btm_image" id="img_btn"
									onclick="iframeChangelink('/html/hompi/deco.jsp?hompiId=<%=hompiId%>')">꾸미기</button>
								<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
								<br /> <br />
							</td>
							<!-- 오른쪽 메뉴 부분 --->
						</tr>
					</table>
				<td style="position: relative; top: 0px; left: 0px;"><iframe
						frameborder="0" width="250" height="480"
						src="/DEworld/html/hompi/music/musicOn.html"
						style="padding-top: 10px; padding-right: 35px;" scrolling="no""></iframe>
				</td>
			</tr>
		</table>
		<!-- ------------------------ -->
	</form>
</body>


</html>
