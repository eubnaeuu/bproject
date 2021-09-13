package kr.or.ddit.post.handler;

import java.net.URLDecoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.comm.handler.CommandHandler;
import kr.or.ddit.comm.service.AtchFileServiceImpl;
import kr.or.ddit.comm.service.IAtchFileService;
import kr.or.ddit.paging.PagingVO;
import kr.or.ddit.post.service.PostService;
import kr.or.ddit.post.service.PostServiceImpl;
import kr.or.ddit.post.vo.AllPostVO;
import kr.or.ddit.post.vo.PostVO;

public class SearchPostHandler implements CommandHandler {
		
	private static final String VIEW_PAGE = "/WEB-INF/view/post/postlist.jsp";
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		if(req.getMethod().equals("GET")) { // Get방식인 경우.
			return false;
		}else { // POST 방식인 경우... 
			return true;
		}
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception, Exception {
		if(req.getMethod().equals("GET")) { //GET방식인 경우 isRedirect을 하지 않는다
			System.out.println("search post handler 입장 GET");
			PostVO pv = new PostVO();
			AllPostVO apv = new AllPostVO();
			pv.setHompiId(req.getParameter("hompiId"));
			apv.setHompiId(req.getParameter("hompiId"));
			
			String hompiId = req.getParameter("hompiId");
			String flag = req.getParameter("flag");
			String lpgu = "";
			if("pos".equals(flag)){
				lpgu = "LPO03";
			}else if("pho".equals(flag)){
				lpgu = "LPO02";
			}else if("dia".equals(flag)){
				lpgu = "LPO01";
			}
			if(req.getParameter("postTitle")!= null) {
				System.out.println("타이틀:"+req.getParameter("postTitle"));
				String postTitle = req.getParameter("postTitle");
				postTitle = URLDecoder.decode(postTitle,"UTF-8");
				
				pv.setPostTitle(postTitle);
				apv.setPostTitle(postTitle);
				pv.setHompiId(hompiId);
				pv.setLpostGu(lpgu);
				apv.setHompiId(hompiId);
				apv.setLpostGu(lpgu);
			}else if(req.getParameter("postContent")!= null) {
				String postContent = req.getParameter("postContent");
				pv.setPostTitle(postContent);
				apv.setPostTitle(postContent);
				pv.setHompiId(hompiId);
				pv.setLpostGu(lpgu);
				apv.setHompiId(hompiId);
				apv.setLpostGu(lpgu);
				System.out.println("내용:"+req.getParameter("postContent"));
			}else if(req.getParameter("memId")!= null) {
				String memId = req.getParameter("memId");
				pv.setPostTitle(memId);
				apv.setPostTitle(memId);
				pv.setHompiId(hompiId);
				pv.setLpostGu(lpgu);
				apv.setHompiId(hompiId);
				apv.setLpostGu(lpgu);
				System.out.println("아이디:"+req.getParameter("memId"));
			}
			
			 int pageNo = 
				       req.getParameter("pageNo") == null ? 
				       1 : Integer.parseInt(req.getParameter("pageNo"));
				    
				    PagingVO pagingVO = new PagingVO();
			
			PostService postService = PostServiceImpl.getInstance();
			IAtchFileService fileService = AtchFileServiceImpl.getInstance();
			
			  int totalCount = postService.getAllPostListCount(pv);
			    pagingVO.setTotalCount(totalCount);
			    pagingVO.setCurrentPageNo(pageNo);
			    pagingVO.setCountPerPage(5);
			    pagingVO.setPageSize(5);
			    
			    apv.setTotalCount(totalCount);
			    apv.setCurrentPageNo(pageNo);
			    apv.setCountPerPage(5);
			    apv.setPageSize(5);
			    
			  List<PostVO> list = postService.getSearchPost(apv);
			   req.setAttribute("postlist", list);
			   req.setAttribute("pagingVO", pagingVO);
			   req.setAttribute("hompiId", hompiId);
			   System.out.println("search post handler 퇴장 GET");
			return VIEW_PAGE;
		}else { 
			
			
			System.out.println("inputstr :"+req.getParameter("inputstr"));
			
			PostVO pv = new PostVO();
			AllPostVO apv = new AllPostVO();
			pv.setHompiId(req.getParameter("hompiId"));
			apv.setHompiId(req.getParameter("hompiId"));
		 int pageNo = 
			       req.getParameter("pageNo") == null ? 
			       1 : Integer.parseInt(req.getParameter("pageNo"));
			    
			    PagingVO pagingVO = new PagingVO();
		
		PostService postService = PostServiceImpl.getInstance();
		IAtchFileService fileService = AtchFileServiceImpl.getInstance();
		
		  int totalCount = postService.getAllPostListCount(pv);
		    pagingVO.setTotalCount(totalCount);
		    pagingVO.setCurrentPageNo(pageNo);
		    pagingVO.setCountPerPage(5);
		    pagingVO.setPageSize(5);
			
		String flag = req.getParameter("flag");
		
		   if("1".equals(flag)) {
				String postTitle = req.getParameter("postTitle");
				pv.setPostTitle(postTitle);
				apv.setPostTitle(postTitle);
			}else if("2".equals(flag)) {
				String postContent = req.getParameter("postContent");
				pv.setPostContent(postContent);
				apv.setPostContent(postContent);
			}else if("3".equals(flag)) {
				String memId = req.getParameter("memId");
				pv.setMemId(memId);
				apv.setMemId(memId);
			}
		   
		   List<PostVO> list = postService.getSearchPost(apv);
		   
		   req.setAttribute("postlist", list);
		   req.setAttribute("pagingVO", pagingVO);
		   
		   System.out.println("퇴장 Post SEARCH Haldler 퇴장 POST");
		   
		   return VIEW_PAGE;
		}
	}
}
