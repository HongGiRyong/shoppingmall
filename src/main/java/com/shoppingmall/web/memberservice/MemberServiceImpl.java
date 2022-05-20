package com.shoppingmall.web.memberservice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoppingmall.web.memberDao.MemberDao;
import com.shoppingmall.web.memberDto.MemberDto;
@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;
	
	//내정보 조회
	public MemberDto readMypage(String id) {
		
		return memberDao.readMypage(id);
	}
	
	//내정보 수정
	public void updateMypage(MemberDto memberDto) {
		memberDao.updateMypage(memberDto);
	}
	//비밀번호 체크
	@Override
	public String pwCheck(String id){
		return memberDao.pwCheck(id);
	}
	//내정보 삭제
	public void deleteMypage(String id) {
		memberDao.deleteMypage(id);
	}
}
