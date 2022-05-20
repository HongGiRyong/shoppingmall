package com.shoppingmall.web.main.basket;

public class BasketCommand {
	private Long kartnum;
	private String itemname;
	private Long price;
	private String itemimage;
	private String itemsize;
	private Long itemqty;
	
	public String getItemimage() {
		return itemimage;
	}
	public void setItemimage(String itemimage) {
		this.itemimage = itemimage;
	}
	public Long getKartnum() {
		return kartnum;
	}
	public void setKartnum(Long kartnum) {
		this.kartnum = kartnum;
	}
	public String getItemname() {
		return itemname;
	}
	public void setItemname(String itemname) {
		this.itemname = itemname;
	}
	public Long getPrice() {
		return price;
	}
	public void setPrice(Long price) {
		this.price = price;
	}
	
	public String getItemsize() {
		return itemsize;
	}
	public void setItemsize(String itemsize) {
		this.itemsize = itemsize;
	}
	public Long getItemqty() {
		return itemqty;
	}
	public void setItemqty(Long itemqty) {
		this.itemqty = itemqty;
	}
}
