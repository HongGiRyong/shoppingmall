package com.shoppingmall.web.memberDto;


import java.util.Date;

import org.springframework.stereotype.Repository;

@Repository
public class MemberDto {
	private Long num;
	private String name;
	private String id;
	private String pw;
	private String phone;
	private String birth;
	private String email;
	private String address1;
	private String address2;
	private String nickname;
	private Date regdate;
	private int admin;
	private boolean useCokkie;
	
	public Long getNum() {
		return num;
	}
	public void setNum(Long num) {
		this.num = num;
	}
	
	public boolean isUseCokkie() {
		return useCokkie;
	}
	public void setUseCokkie(boolean useCokkie) {
		this.useCokkie = useCokkie;
	}
	public int getAdmin() {
		return admin;
	}
	public void setAdmin(int admin) {
		this.admin = admin;
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
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "MemberDto [num=" + num + ", name=" + name + ", id=" + id + ", pw=" + pw + ", phone=" + phone
				+ ", birth=" + birth + ", email=" + email + ", address1=" + address1 + ", address2=" + address2
				+ ", nickname=" + nickname + ", regdate=" + regdate + ", admin=" + admin + ", useCokkie=" + useCokkie
				+ "]";
	}
	

	
}
