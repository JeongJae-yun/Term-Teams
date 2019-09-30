package my.model;

import java.util.Date;

public class Buy {
	private int buyId;
	private String id;
	private int clothesId;
	private int amount;
	private int allprice;
	private Date buyDate;
	
	public Buy() {}

	public Buy(String id, int clothesId, int amount, int allprice, Date buyDate) {
		super();
		this.id = id;
		this.clothesId = clothesId;
		this.amount = amount;
		this.allprice = allprice;
		this.buyDate = buyDate;
	}

	public int getBuyId() {
		return buyId;
	}

	public void setBuyId(int buyId) {
		this.buyId = buyId;
	}

	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getClothesId() {
		return clothesId;
	}

	public void setClothesId(int clothesId) {
		this.clothesId = clothesId;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getAllprice() {
		return allprice;
	}

	public void setAllprice(int allprice) {
		this.allprice = allprice;
	}

	public Date getBuyDate() {
		return buyDate;
	}

	public void setBuyDate(Date buyDate) {
		this.buyDate = buyDate;
	}
	
}
