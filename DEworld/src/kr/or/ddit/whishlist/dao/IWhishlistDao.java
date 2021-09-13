package kr.or.ddit.whishlist.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.whishlist.vo.WhishlistVO;

public interface IWhishlistDao {
	
	 
	public List<WhishlistVO> getAllWhishlistList(SqlMapClient smc, WhishlistVO wv)	throws SQLException;
	public List<WhishlistVO> getAllMusicWhishlistList(SqlMapClient smc, WhishlistVO wv)	throws SQLException;
	

}
