package loginPage.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import kr.or.ddit.hompi.vo.HompiVO;
import kr.or.ddit.item.vo.ItemVO;
import kr.or.ddit.member.vo.MemberVO;
import loginPage.service.MemberService;
import loginPage.vo.AdminVO;

@WebServlet("/MemberServlet")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 브라우저로 부터 받은 값을 사용하기 위해 request에서 parameter를 get.
		
		String flag = req.getParameter("flag");
		System.out.println(flag);
		int path = 0;
		try {
			if(flag.equals("login")) {
				
				List<MemberVO> list = matchinIdPw(req);
				req.setAttribute("list", list);
				HttpSession session = req.getSession();
				session.setAttribute("userId", list.get(0).getMemId());
			} else if(flag.equals("findId")) {
				
				List<MemberVO> list = findId(req);
				req.setAttribute("list", list);
				
			} else if(flag.equals("findPw")) {
				
				List<MemberVO> list = findPw(req);
				req.setAttribute("list", list);
				
			} else if(flag.equals("setMyPage")) {
				
				List<MemberVO> list = setMyPage(req);
				req.setAttribute("list", list);
				
			} else if(flag.equals("updateInfo")) {
				
				int cnt = updateInfo(req);
				req.setAttribute("cnt", cnt);
				System.out.println(req.getAttribute("cnt"));
				path = 1;
				
			} else if(flag.equals("adminLogin")) {
				
				List<AdminVO> adminConfirm = adminConfirm(req);
				req.setAttribute("adminConfirm", adminConfirm);
				System.out.println(req.getAttribute("adminConfirm"));
				path = 2;
			} else if(flag.equals("updateCoin")) {
				
				int cnt = updateCoin(req);
				req.setAttribute("cnt", cnt);
				path = 1;
			} else if(flag.equals("highVisitCnt")) {
				System.out.println("req : " + req);
				List<HompiVO> list = highVisitCnt(req);
				req.setAttribute("list2", list);
				
				System.out.println(req.getAttribute("list2"));
				path = 3;
			} else if(flag.equals("setHompi")) {

				List<HompiVO> list = setHompi(req);
				req.setAttribute("setHompi", list);
				
				System.out.println(req.getAttribute("setHompi"));
				path = 4;
			} else if(flag.equals("searchMyMinimi")) {

				List<ItemVO> list = searchMyMinimi(req);
				req.setAttribute("setItem", list);
				
				System.out.println(req.getAttribute("setItem"));
				path = 5;
			}/* else if(flag.equals("setHompi")) {

				List<HompiVO> list = setHompi(req);
				req.setAttribute("setHompi", list);
				
				System.out.println(req.getAttribute("setHompi"));
				path = 4;
			} else if(flag.equals("setHompi")) {

				List<HompiVO> list = setHompi(req);
				req.setAttribute("setHompi", list);
				
				System.out.println(req.getAttribute("setHompi"));
				path = 4;
			} else if(flag.equals("setHompi")) {

				List<HompiVO> list = setHompi(req);
				req.setAttribute("setHompi", list);
				
				System.out.println(req.getAttribute("setHompi"));
				path = 5;
			}*/
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(path == 1) {
			RequestDispatcher disp = req.getRequestDispatcher("/html/mainPage/changeInfo.jsp");
			disp.forward(req, resp);
		} else if(path == 2){
			RequestDispatcher disp = req.getRequestDispatcher("/html/loginpage/loginResultAdmin.jsp");
			disp.forward(req, resp);
		} else if(path == 3){
			RequestDispatcher disp = req.getRequestDispatcher("/html/loginpage/loginResult2.jsp");
			disp.forward(req, resp);
		} else if(path == 4){
			RequestDispatcher disp = req.getRequestDispatcher("/html/hompi/setHompi.jsp");
			disp.forward(req, resp);
		} else if(path == 5){
			RequestDispatcher disp = req.getRequestDispatcher("/html/hompi/setItem.jsp");
			disp.forward(req, resp);
		} else {
			RequestDispatcher disp = req.getRequestDispatcher("/html/loginpage/loginResult.jsp");
			disp.forward(req, resp);
		}

	}

	private List<ItemVO> searchMyMinimi(HttpServletRequest req) throws SQLException {
		
		String memId = req.getParameter("memId");
		
		System.out.println("memId : " + memId);
		
		ItemVO itemVO = new ItemVO();
		itemVO.setMemId(memId);
		
		MemberService service = new MemberService();
		List<ItemVO> list = service.searchMyMinimi(itemVO);
		return list;
	}

	private List<HompiVO> setHompi(HttpServletRequest req) throws SQLException {
		
		String memId = req.getParameter("memId");
		
		System.out.println("memId : " + memId);
		
		HompiVO hompiVO = new HompiVO();
		hompiVO.setMemId(memId);
		
		MemberService service = new MemberService();
		List<HompiVO> list = service.setHompi(hompiVO);
		
		for(HompiVO vo : list) {
			System.out.println("visitCountToday : " + vo.getVisitCountToday());
			System.out.println("memId : " + vo.getMemId());
			System.out.println("memNickname : " + vo.getMemNickname());
			System.out.println("hompiProfileImg : " + vo.getHompiProfileImg());
		}
		
		return list;
	}

	private List<HompiVO> highVisitCnt(HttpServletRequest req) throws SQLException {
		
		String memGender = req.getParameter("memGender");
		
		System.out.println("memGender : " + memGender);
		
		MemberVO memberVO = new MemberVO();
		memberVO.setMemGender(memGender);
		
		MemberService service = new MemberService();
		List<HompiVO> list = service.highVisitCnt(memberVO);
		
		for(HompiVO vo : list) {
			System.out.println("visitCountToday : " + vo.getVisitCountToday());
			System.out.println("memId : " + vo.getMemId());
			System.out.println("memNickname : " + vo.getMemNickname());
			System.out.println("hompiProfileImg : " + vo.getHompiProfileImg());
		}
		
		return list;
	}

	private int updateCoin(HttpServletRequest req) throws SQLException {

		String memId = req.getParameter("memId");
		int memCybermoney = Integer.valueOf(req.getParameter("coin"));
		
		System.out.println(memId);
		System.out.println(memCybermoney);
		
		MemberVO memberVO = new MemberVO();
		memberVO.setMemId(memId);
		memberVO.setMemCyberMoney(memCybermoney);
		
		MemberService service = new MemberService();
		int cnt = service.updateCoin(memberVO);
		
		return cnt;
	}

	private List<AdminVO> adminConfirm(HttpServletRequest req) throws SQLException {
		
		
		String adminId = req.getParameter("adminId");
		
		AdminVO adminVO = new AdminVO();
		adminVO.setAdminId(adminId);
		
		MemberService service = new MemberService();
		
		System.out.println(req.getParameter("adminId"));
		
		List<AdminVO> adminConfirm = service.adminConfirm(adminVO);
		
		return adminConfirm;
	}

	private int updateInfo(HttpServletRequest req) throws IllegalAccessException, InvocationTargetException, SQLException {
		
		MemberVO memberVo = new MemberVO();
		BeanUtils.populate(memberVo, req.getParameterMap());
		
		MemberService service = new MemberService();
		int cnt = service.updateInfo(memberVo);
	
		
		return cnt;
	}

	private List<MemberVO> setMyPage(HttpServletRequest req) throws SQLException {
		String memId = req.getParameter("memId");
		
		MemberVO memberVO = new MemberVO();
		memberVO.setMemId(memId);
		
		MemberService service = new MemberService();
		List<MemberVO> list = service.setMyPage(memberVO);
		
		return list;
	}

	private List<MemberVO> findPw(HttpServletRequest req) throws SQLException {
		
		String memId = req.getParameter("memId");
		String memMail = req.getParameter("memMail");
		
		MemberVO memberVO = new MemberVO();
		memberVO.setMemMail(memMail);
		memberVO.setMemId(memId);
		
		MemberService service = new MemberService();
		List<MemberVO> list = service.findPw(memberVO);
		
		return list;
	}

	private List<MemberVO> findId(HttpServletRequest req) throws SQLException {
		
		String memMail = req.getParameter("memMail");
		System.out.println(memMail);
		
		MemberVO memberVO = new MemberVO();
		memberVO.setMemMail(memMail);
		
		MemberService service = new MemberService();
		List<MemberVO> list = service.findId(memberVO);
		return list;
	}

	private List<MemberVO> matchinIdPw(HttpServletRequest req) throws SQLException {

		String memId = req.getParameter("memId");
		String memPass = req.getParameter("memPass");
		System.out.println("memId : " + memId + "memNAme : " + memPass);
		// form serialize를 사용해서 파라미터를 전달한 경우, request에 요소의 name으로 parameter가 매핑됨.
		// 예) <input type="text" name="userId"> ==> req.getParameter("userId")

		MemberVO memberVo = new MemberVO();
		memberVo.setMemId(memId);
		memberVo.setMemPass(memPass);

		// 회원 목록 조회
		MemberService service = new MemberService();
		List<MemberVO> list = service.matchinIdPw(memberVo);
		return list;
	}

	
}
