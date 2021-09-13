package kr.or.ddit.item.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.item.vo.ItemVO;
import kr.or.ddit.member.vo.MemberVO;

public interface IItemDao {
	
	 
	public List<ItemVO> getAllItemList(SqlMapClient smc)
	 					throws SQLException;
	
	
	public List<ItemVO> getSearchItem(SqlMapClient smc, String searchItemName) throws SQLException;
 

	public ItemVO getItem(SqlMapClient smc, String itemId) throws SQLException;
	
	public int insertWishlist(SqlMapClient smc, ItemVO iv) throws SQLException;

	public List<ItemVO> getFriendList(SqlMapClient smc, String memId) throws SQLException;

	public int buyItem(SqlMapClient smc, ItemVO iv) throws SQLException;

	public int giftItem(SqlMapClient smc, ItemVO iv) throws SQLException;
}
