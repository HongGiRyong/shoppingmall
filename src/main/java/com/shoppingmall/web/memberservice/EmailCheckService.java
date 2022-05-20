package com.shoppingmall.web.memberservice;

public interface EmailCheckService {
	 // 아이디 중복확인
    public int emailCheck(String email);
}
