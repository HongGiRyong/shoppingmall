package com.shoppingmall.web.admin.model;

import org.springframework.stereotype.Repository;

public class MemberManageVo {

	private String num;
	private String name;
	private String id;
	private String pw;
	private String phone;
	private String birth;
	private String email;
	private String address1;
	private String address2;
	private String nickName;
	private String admin;
	private String regDate;
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "MemberManageVo [num=" + num + ", name=" + name + ", id=" + id + ", pw=" + pw + ", phone=" + phone
				+ ", birth=" + birth + ", email=" + email + ", address1=" + address1 + ", address2=" + address2
				+ ", nickName=" + nickName + ", admin=" + admin + ", regDate=" + regDate + "]";
	}

	
}
