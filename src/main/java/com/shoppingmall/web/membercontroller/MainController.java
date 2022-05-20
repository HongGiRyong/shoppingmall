package com.shoppingmall.web.membercontroller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(RegisterController.class);
	//메인 (get)
	@RequestMapping(value="/member/main", method = RequestMethod.GET)
	public String getmain( HttpServletRequest request) throws Exception{
	
		logger.info("과연");
		return "main/jmain";
	}
	
	
}
