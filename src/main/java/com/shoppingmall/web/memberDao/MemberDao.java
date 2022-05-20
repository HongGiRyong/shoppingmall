package com.shoppingmall.web.memberDao;



import java.sql.Date;
import java.util.Collection;

import javax.servlet.http.HttpSession;

import com.shoppingmall.web.admin.model.OrderDetailVo;
import com.shoppingmall.web.admin.model.OrderListVo;
import com.shoppingmall.web.memberDto.MemberDto;

public interface MemberDao {
	//회원가입
	public void register(MemberDto memberDto) throws Exception;
	
    // 아이디 중복 체크
    public int idCheck(String id);
    
    // 닉네임 중복 체크
    public int NickCheck(String nickname);
    // 이메일 중복 체크
    public int emailCheck(String email);

	//로그인
	public MemberDto viewlogin(MemberDto memberDto);
	
	//로그아웃
	public void logout(HttpSession session);
	
	//아이디 비밀번호 찾기 
	public MemberDto loginUser(MemberDto memberDto); //확인
	public MemberDto findId(MemberDto memberDto);		//아이디찾을떄
	public MemberDto findPw(MemberDto memberDto);		//비번찾을떄
	public void updatePw(MemberDto memberDto);			//비번찾고 업데이트
	
	//내정보 조회
	public MemberDto readMypage(String id);
	
	//내 정보 수정
	public void updateMypage(MemberDto memberDto);
	
	//비밀번호 체크
	
	public String pwCheck(String Id);
	//회원탈퇴
	public void deleteMypage(String id);
	
	//주문조회
	public Collection<OrderListVo> myorderList(Long num);
	
	

}

