package my.model;

import java.util.Date;

public class Pocket {
	private int pocketId;
	private String id;
	private int allprice2;
	private String cardId;
	private String cardCompany;
	private String halbu;
	private String soldout;
	private Date pocketDate;
	private String name;
	private int phoneNumber;
	private String address;
	private String memo;
	
	public Pocket(){}
	
	
	public Pocket(String id, int allprice2, String cardId, String cardCompany, String halbu, String soldout,
			Date pocketDate, String name, int phoneNumber, String address, String memo) {
		super();
		this.id = id;
		this.allprice2 = allprice2;
		this.cardId = cardId;
		this.cardCompany = cardCompany;
		this.halbu = halbu;
		this.soldout = soldout;
		this.pocketDate = pocketDate;
		this.name = name;
		this.phoneNumber = phoneNumber;
		this.address = address;
		this.memo = memo;
	}


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	

	public int getPhoneNumber() {
		return phoneNumber;
	}


	public void setPhoneNumber(int phoneNumber) {
		this.phoneNumber = phoneNumber;
	}


	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public int getPocketId() {
		return pocketId;
	}

	public void setPocketId(int pocketId) {
		this.pocketId = pocketId;
	}

	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getAllprice2() {
		return allprice2;
	}

	public void setAllprice2(int allprice2) {
		this.allprice2 = allprice2;
	}

	

	public String getCardId() {
		return cardId;
	}

	public void setCardId(String cardId) {
		this.cardId = cardId;
	}

	public String getCardCompany() {
		return cardCompany;
	}

	public void setCardCompany(String cardCompany) {
		this.cardCompany = cardCompany;
	}

	public String getHalbu() {
		return halbu;
	}

	public void setHalbu(String halbu) {
		this.halbu = halbu;
	}

	public String getSoldout() {
		return soldout;
	}

	public void setSoldout(String soldout) {
		this.soldout = soldout;
	}

	public Date getPocketDate() {
		return pocketDate;
	}

	public void setPocketDate(Date pocketDate) {
		this.pocketDate = pocketDate;
	}
	
	
}
