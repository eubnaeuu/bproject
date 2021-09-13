package kr.or.ddit.giftbox.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.giftbox.vo.GiftboxVO;
import kr.or.ddit.item.vo.ItemVO;


public class GiftboxDaoImpl implements IGiftboxDao {

   private static IGiftboxDao giftboxDao;
   
   private GiftboxDaoImpl() {
	   
   }
   
   public static IGiftboxDao getInstance() {
	   if(giftboxDao == null) {
		   giftboxDao = new GiftboxDaoImpl();
	   }
	   
	   return giftboxDao;
   }
   

   @Override
   public List<GiftboxVO> getAllGiftboxList(SqlMapClient smc,GiftboxVO gv) throws SQLException {
      
      List<GiftboxVO> giftboxList = smc.queryForList("giftbox.getGiftboxAll", gv);
     
      return giftboxList;
   }

@Override
public List<GiftboxVO> getMusicAllGiftboxList(SqlMapClient smc, GiftboxVO gv) throws SQLException {
	List<GiftboxVO> giftboxList = smc.queryForList("giftbox.getMusicGiftboxAll", gv);
    
    return giftboxList;
}

  
  


}






