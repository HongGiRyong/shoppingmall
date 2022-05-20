package com.shoppingmall.web.memberservice;

import org.springframework.stereotype.Service;

import com.shoppingmall.web.memberDto.MemberDto;
@Service
public interface RegisterService {
	public void register(MemberDto memberDto) throws Exception;

}
