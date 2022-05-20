package com.shoppingmall.web.main.shopController;

public class SearchCommand {
	private String keyword;
	private String itemcatecode;
	
	
	public String getItemcatecode() {
		return itemcatecode;
	}
	public void setItemcatecode(String itemcatecode) {
		this.itemcatecode = itemcatecode;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
}
