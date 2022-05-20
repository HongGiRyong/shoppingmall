package com.shoppingmall.web.main.itemBuy;

public class ItemBuyVo {
	private Long orderid; //
	private Long userid;//
	private String itemcode;//
	private String useraddr1;
	private String useraddr2;
	private Long itemqty;//
	private String orderinfo;
	private String orderphon;
	private Long amount;
	private String itemsize;
	private String orderrec;
	
	public String getOrderphon() {
		return orderphon;
	}
	public void setOrderphon(String orderphon) {
		this.orderphon = orderphon;
	}
	public Long getAmount() {
		return amount;
	}
	public void setAmount(Long amount) {
		this.amount = amount;
	}
	public String getUseraddr2() {
		return useraddr2;
	}
	public void setUseraddr2(String useraddr2) {
		this.useraddr2 = useraddr2;
	}
	public Long getOrderid() {
		return orderid;
	}
	public void setOrderid(Long orderid) {
		this.orderid = orderid;
	}
	public Long getUserid() {
		return userid;
	}
	public void setUserid(Long userid) {
		this.userid = userid;
	}
	public String getUseraddr1() {
		return useraddr1;
	}
	public void setUseraddr1(String useraddr1) {
		this.useraddr1 = useraddr1;
	}
	public Long getItemqty() {
		return itemqty;
	}
	public void setItemqty(Long itemqty) {
		this.itemqty = itemqty;
	}
	public String getItemcode() {
		return itemcode;
	}
	public void setItemcode(String itemcode) {
		this.itemcode = itemcode;
	}
	public String getOrderinfo() {
		return orderinfo;
	}
	public void setOrderinfo(String orderinfo) {
		this.orderinfo = orderinfo;
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
	@Override
	public String toString() {
		return "ItemBuyVo [orderid=" + orderid + ", userid=" + userid + ", itemcode=" + itemcode + ", useraddr1="
				+ useraddr1 + ", useraddr2=" + useraddr2 + ", itemqty=" + itemqty + ", orderinfo=" + orderinfo
				+ ", orderphon=" + orderphon + ", amount=" + amount + "]";
	}
	

	
}
