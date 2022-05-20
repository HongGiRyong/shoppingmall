package com.shoppingmall.web.memberservice;

import com.shoppingmall.web.memberDto.MemberDto;


public interface MemberService {
	//회원 정보 조회
	public MemberDto readMypage(String id);
	
	//회원 정보 수정
	public void updateMypage(MemberDto memberDto);
	
	//비밀번호 체크
	public String pwCheck(String id);
	//회원 정보 삭제
	public void deleteMypage(String id);
}
