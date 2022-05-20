package com.shoppingmall.web.membercontroller;





import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shoppingmall.web.memberDto.MemberDto;
import com.shoppingmall.web.memberservice.RegisterService;


@Controller

public class RegisterController {
	private static final Logger logger = LoggerFactory.getLogger(RegisterController.class);
	
	@Autowired
	private RegisterService registerService;
	@Autowired
	BCryptPasswordEncoder passEncoder;
	
	//회원가입(get)
	@RequestMapping(value="/member/register", method = RequestMethod.GET)
	public String getRegister() throws Exception {
		logger.info("회원가입 페이지 진행");
		return "register";
	}
	
	
	//회원가입(post)
	@RequestMapping(value="/member/register", method = RequestMethod.POST)
	public String postRegister(MemberDto memberDto) throws Exception {
		logger.info("회원가입 페이지 진입");
		
		String inputPass = memberDto.getPw();
		String pass = passEncoder.encode(inputPass);
		memberDto.setPw(pass);
		//회원가입 서비스 실행
		registerService.register(memberDto);
		logger.info("회원가입 서비스 성공");
		
		 return "registerProc";
	}

}
