package my.model;

import java.util.Date;

public class Opinion {
	private int opinionId;
	private String title1;
	private String userName1;
	private String userId1;
	private String cate1;
	private String story1;
	private Date registerTime;
	private int accesscount;
	
	
	
	public Opinion () {}


	public Opinion(String title1, String userName1, String userId1, String cate1, String story1, Date registerTime) {
		super();
		this.title1 = title1;
		this.userName1 = userName1;
		this.userId1 = userId1;
		this.cate1 = cate1;
		this.story1 = story1;
		this.registerTime = registerTime;
		
	}


	

	public int getAccesscount() {
		return accesscount;
	}


	public void setAccesscount(int accesscount) {
		this.accesscount = accesscount;
	}


	public int getOpinionId() {
		return opinionId;
	}


	public void setOpinionId(int opinionId) {
		this.opinionId = opinionId;
	}


	public String getTitle1() {
		return title1;
	}


	public void setTitle1(String title1) {
		this.title1 = title1;
	}


	public String getUserName1() {
		return userName1;
	}


	public void setUserName1(String userName1) {
		this.userName1 = userName1;
	}


	public String getUserId1() {
		return userId1;
	}


	public void setUserId1(String userId1) {
		this.userId1 = userId1;
	}


	public String getCate1() {
		return cate1;
	}


	public void setCate1(String cate1) {
		this.cate1 = cate1;
	}


	public String getStory1() {
		return story1;
	}


	public void setStory1(String story1) {
		this.story1 = story1;
	}


	public Date getRegisterTime() {
		return registerTime;
	}


	public void setRegisterTime(Date registerTime) {
		this.registerTime = registerTime;
	}




	

	
}