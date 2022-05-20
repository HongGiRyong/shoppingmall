package com.shoppingmall.web.memberservice;


import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.shoppingmall.web.memberDao.MemberDao;
import com.shoppingmall.web.memberDto.MemberDto;

@Service
public class RegisterServiceImpl implements RegisterService  {
	@Inject
	private MemberDao dao;
	
	@Override
	public void register(MemberDto memberDto) throws Exception{
		dao.register(memberDto);
	}
	
	

	
	

	
}
