package com.shoppingmall.web.membercontroller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shoppingmall.web.memberservice.IdCheckService;

@Controller

public class UserController {

	
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
    @Autowired
    private IdCheckService userService;

    // 아이디 체크
    @RequestMapping(value = "/member/idCheck", method = RequestMethod.POST)
    @ResponseBody
    public String idCheck(@RequestParam("id") String id) throws Exception{
    
        logger.info("userIdCheck 진입");
        logger.info("전달받은 id:"+ id);
        
        int cnt = userService.idCheck(id);
      
        logger.info("확인 결과:"+cnt);
        
        return Integer.toString(cnt);
    }
}