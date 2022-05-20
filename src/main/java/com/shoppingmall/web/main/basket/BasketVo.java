package com.shoppingmall.web.main.basket;

//@Alias("basket")
public class BasketVo {
	private Long kartnum;
	private String itemcode;
	private Long itemqty;
	private Long usernum;
	private String itemsize;
	private String orderrec;
	
	public Long getKartnum() {
		return kartnum;
	}
	public void setKartnum(Long kartnum) {
		this.kartnum = kartnum;
	}
	public String getItemcode() {
		return itemcode;
	}
	public void setItemcode(String itemcode) {
		this.itemcode = itemcode;
	}
	public Long getItemqty() {
		return itemqty;
	}
	public void setItemqty(Long itemqty) {
		this.itemqty = itemqty;
	}
	public Long getUsernum() {
		return usernum;
	}
	public void setUsernum(Long usernum) {
		this.usernum = usernum;
	}
	public String getItemsize() {
		return itemsize;
	}
	public void setItemsize(String itemsize) {
		this.itemsize = itemsize;
	}
	public String getOrderrec() {
		return orderrec;
	}
	public void setOrderrec(String orderrec) {
		this.orderrec = orderrec;
	}
	
}
