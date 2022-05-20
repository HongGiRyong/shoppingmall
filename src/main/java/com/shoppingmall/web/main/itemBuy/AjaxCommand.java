package com.shoppingmall.web.main.itemBuy;

public class AjaxCommand {
	private Long kartnum;
	private Long itemqty;
	private Long itemprice;
	private String info;
	
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public Long getItemprice() {
		return itemprice;
	}
	public void setItemprice(Long itemprice) {
		this.itemprice = itemprice;
	}
	public Long getKartnum() {
		return kartnum;
	}
	public void setKartnum(Long kartnum) {
		this.kartnum = kartnum;
	}
	public Long getItemqty() {
		return itemqty;
	}
	public void setItemqty(Long itemqty) {
		this.itemqty = itemqty;
	}
}
