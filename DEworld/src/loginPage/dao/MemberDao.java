package loginPage.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import baseDao.BaseDao;
import kr.or.ddit.hompi.vo.HompiVO;
import kr.or.ddit.item.vo.ItemVO;
import kr.or.ddit.member.vo.MemberVO;
import loginPage.vo.AdminVO;

public class MemberDao extends BaseDao {
	private SqlMapClient smc;
	
	private static MemberDao memberDao = null;
	
	public static MemberDao getInstance() {
		if(memberDao == null) {
			memberDao = new MemberDao();
		}
		return memberDao;
	}
	
	public MemberDao() {
		smc = super.getSqlMapClient();
	}
	
	public List<MemberVO> matchinIdPw (MemberVO memberVo) throws SQLException {
		return smc.queryForList("member.matchinIdPw", memberVo);
	}
	
	public List<MemberVO> findId (MemberVO memberVo) throws SQLException {
		return smc.queryForList("member.matchinIdEmail", memberVo);
	}

	public List<MemberVO> findIdEmail(MemberVO memberVO) throws SQLException {
		return smc.queryForList("member.findIdEmail", memberVO);
	}

	public List<MemberVO> findPw(MemberVO memberVO) throws SQLException {
		return smc.queryForList("member.findPw", memberVO);
	}

	public List<MemberVO> setMyPage(MemberVO memberVO) throws SQLException {
		return smc.queryForList("member.setMyPage", memberVO);
	}

	public int updateInfo(MemberVO memberVo) throws SQLException {
		return smc.update("member.updateInfo", memberVo);
	}

	public List<AdminVO> adminConfirm(AdminVO adminVO) throws SQLException {
		return smc.queryForList("member.adminConfirm", adminVO);
	}

	public int updateCoin(MemberVO memberVO) throws SQLException {
		
		return smc.update("member.updateCoin", memberVO);
	}

	public List<HompiVO> highVisitCnt(MemberVO memberVO) throws SQLException {
		return smc.queryForList("member.highVisitCnt", memberVO);
	}

	public List<HompiVO> setHompi(HompiVO hompiVO) throws SQLException {
		return smc.queryForList("member.setHompi", hompiVO);
	}

	public List<ItemVO> searchMyMinimi(ItemVO itemVO) throws SQLException {
		return smc.queryForList("hompi.searchMyMinimi", itemVO);
	}

	
}	
