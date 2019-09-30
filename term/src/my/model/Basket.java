package my.model;

import java.util.Date;

public class Basket {


	private int basketId;
	private String userId;
	private int clothesId;
	private int amount;
	private int allprice;
	private Date basketDate;
	
	public Basket() {}

	public Basket(String userId, int clothesId, int amount, int allprice, Date basketDate) {
		super();
		this.userId = userId;
		this.clothesId = clothesId;
		this.amount = amount;
		this.allprice = allprice;
		this.basketDate = basketDate;
	}

	public int getBasketId() {
		return basketId;
	}

	public void setBasketId(int basketId) {
		this.basketId = basketId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getClotheId() {
		return clothesId;
	}

	public void setClotheId(int clotheId) {
		this.clothesId = clotheId;
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

	public Date getBasketDate() {
		return basketDate;
	}

	public void setBasketDate(Date basketDate) {
		this.basketDate = basketDate;
	}
	
	

}
