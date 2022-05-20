package com.shoppingmall.web.memberservice;

import javax.servlet.http.HttpSession;

import com.shoppingmall.web.memberDto.MemberDto;

public interface LoginService {
	//로그인
	public MemberDto viewlogin(MemberDto memberDto);
	
	//로그아웃
	public void logout(HttpSession session);
}
