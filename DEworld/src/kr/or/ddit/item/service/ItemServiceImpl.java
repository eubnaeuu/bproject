package kr.or.ddit.item.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.item.dao.IItemDao;
import kr.or.ddit.item.dao.ItemDaoImpl;
import kr.or.ddit.item.vo.ItemVO;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.util.SqlMapClientUtil;

public class ItemServiceImpl implements IItemService {
	
	private IItemDao itemDao;
	private SqlMapClient smc;
	
	private static IItemService service;
	
	private ItemServiceImpl() {
		itemDao = ItemDaoImpl.getInstance();
		smc = SqlMapClientUtil.getInstance();
	}
	
	public static IItemService getInstance() {
		if(service == null) {
			service = new ItemServiceImpl();
		}
		
		return service;
	}

	
	@Override
	public List<ItemVO> getAllItemList() {
		
		List<ItemVO> itemList = new ArrayList<>();
		
		try {
			itemList = itemDao.getAllItemList(smc);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return itemList;
	}

	@Override
	public List<ItemVO> getSearchItem(String searchItemName) {
		List<ItemVO> itemList = new ArrayList<>();
		
		try {
			itemList = itemDao.getSearchItem(smc, searchItemName);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	      
	    return itemList;
	}

	@Override
	public ItemVO getItem(String itemId) {
		
		ItemVO iv = null;
		
		try {
			iv = itemDao.getItem(smc, itemId);
		}catch(SQLException ex) {
			ex.printStackTrace();
		}
		return iv;
	}

	@Override
	public int insertWishlist(ItemVO iv) {
		int cnt = 0;
		try {
			cnt = itemDao.insertWishlist(smc, iv);
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return cnt;
	}

	@Override
	public List<ItemVO> getFriendList(String memId) {
		List<ItemVO> friendList = new ArrayList<>();
		
		try {
			friendList = itemDao.getFriendList(smc, memId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return friendList;
	}

	@Override
	public int buyItem(ItemVO iv) {
		int cnt = 0;
		try {
			cnt = itemDao.buyItem(smc, iv);
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return cnt;
	}

	@Override
	public int giftItem(ItemVO iv) {
		int cnt = 0;
		try {
			cnt = itemDao.giftItem(smc, iv);
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return cnt;
	}
	

}
