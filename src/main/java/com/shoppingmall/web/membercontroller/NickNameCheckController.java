package com.shoppingmall.web.membercontroller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shoppingmall.web.memberservice.NickCheckService;

@Controller
public class NickNameCheckController {
	private static final Logger logger = LoggerFactory.getLogger(NickNameCheckController.class);
    @Autowired
    private NickCheckService nickCheckService;
    

    // 아이디 체크
    @RequestMapping(value = "/member/nickCheck", method = RequestMethod.POST)
    @ResponseBody
    public String nickCheck(@RequestParam("nickname") String nickname) throws Exception{
    
        logger.info("userNickCheck 진입");
        logger.info("전달받은 nick:"+ nickname);
        int cnt = nickCheckService.NickCheck(nickname);
      
        logger.info("확인 결과:"+cnt);
        
        return Integer.toString(cnt);
    }
}
