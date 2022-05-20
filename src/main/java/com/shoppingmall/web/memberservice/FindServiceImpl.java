package com.shoppingmall.web.memberservice;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.shoppingmall.web.memberDao.MemberDao;
import com.shoppingmall.web.memberDto.MemberDto;

@Service
public class FindServiceImpl implements FindService {
	@Inject
	private MemberDao memberDao;
	
	public MemberDto loginUser(MemberDto memberDto) {
		return memberDao.loginUser(memberDto);									
	}
	public MemberDto findId(MemberDto memberDto) {
		return memberDao.findId(memberDto);
	}
	public MemberDto findPw(MemberDto memberDto) {
		return memberDao.findPw(memberDto);
	}
	public void updatePw(MemberDto memberDto) {
		memberDao.updatePw(memberDto);
	}
}
