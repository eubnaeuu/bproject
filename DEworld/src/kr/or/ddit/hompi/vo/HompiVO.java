package kr.or.ddit.hompi.vo;

import kr.or.ddit.comm.vo.BaseVO;

/**
 * DB 테이블에 있는 컬럼을 기준으로 데이터를 객체화한 클래스이다.
 *         <p>
 *         DB테이블의 '컬럼'이 이 클래스의 '멤버변수'가 된다 <br>
 *         DB테이블의 컬럼과 클래스의 멤버변수를 매핑하는 역할을 수행한다.<br>
 *         </p>
 */

public class HompiVO extends BaseVO {
	
	private String hompiId;
	private String memId;
	private String hompiInfo;
	private String hompiProfileImg;
	private String hompiMiniroom;
	private String hompiBackground;
	private String hompiTextcolor;
	private long visitCountToday;
	private long visitCountTotal;
	private long scrapCount;
	private String memNickname;	
	private String hompiMinimi;
	
	public String getHompiMinimi() {
		return hompiMinimi;
	}
	public void setHompiMinimi(String hompiMinimi) {
		this.hompiMinimi = hompiMinimi;
	}
	public String getHompiId() {
		return hompiId;
	}
	public void setHompiId(String hompiId) {
		this.hompiId = hompiId;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getHompiInfo() {
		return hompiInfo;
	}
	public void setHompiInfo(String hompiInfo) {
		this.hompiInfo = hompiInfo;
	}
	public String getHompiProfileImg() {
		return hompiProfileImg;
	}
	public void setHompiProfileImg(String hompiProfileImg) {
		this.hompiProfileImg = hompiProfileImg;
	}
	public String getHompiMiniroom() {
		return hompiMiniroom;
	}
	public void setHompiMiniroom(String hompiMiniroom) {
		this.hompiMiniroom = hompiMiniroom;
	}
	public String getHompiBackground() {
		return hompiBackground;
	}
	public void setHompiBackground(String hompiBackground) {
		this.hompiBackground = hompiBackground;
	}
	public String getHompiTextcolor() {
		return hompiTextcolor;
	}
	public void setHompiTextcolor(String hompiTextcolor) {
		this.hompiTextcolor = hompiTextcolor;
	}
	public long getVisitCountToday() {
		return visitCountToday;
	}
	public void setVisitCountToday(long visitCountToday) {
		this.visitCountToday = visitCountToday;
	}
	public long getVisitCountTotal() {
		return visitCountTotal;
	}
	public void setVisitCountTotal(long visitCountTotal) {
		this.visitCountTotal = visitCountTotal;
	}
	public long getScrapCount() {
		return scrapCount;
	}
	public void setScrapCount(long scrapCount) {
		this.scrapCount = scrapCount;
	}
	public String getMemNickname() {
		return memNickname;
	}
	public void setMemNickname(String memNickname) {
		this.memNickname = memNickname;
	}	
	
}