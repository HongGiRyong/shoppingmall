package com.shoppingmall.web.membercontroller;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shoppingmall.web.memberservice.EmailCheckService;

@Controller
public class EmailCheckController {
	private static final Logger logger = LoggerFactory.getLogger(EmailCheckController.class);
	@Autowired
    private JavaMailSender mailSender;
	@Autowired
    private EmailCheckService emailCheckService;
	
	
	/* 이메일 인증 */
    @RequestMapping(value="/member/mailCheck", method=RequestMethod.GET)
    @ResponseBody
    public String mailCheckGET(String email) throws Exception{
        
        /* 뷰(View)로부터 넘어온 데이터 확인 */
        logger.info("이메일 데이터 전송 확인");
        logger.info("넘어온 메일 : " + email);
                
        /* 인증번호(난수) 생성 */
        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        logger.info("인증번호 : " + checkNum);
        
        /* 이메일 보내기 */
        String setmail = "james523311@gmail.com";//root.context 에 사용한 이메일
        String toMail = email;     //뷰로부터 받은 이메일주소 변수 사용
        String title = "(최원석 쇼핑몰)회원가입 인증 이메일 입니다."; //이메일 제목
        String content =         //내용
                "안녕하세요 (최원석)쇼핑몰입니다. " +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        
        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setmail);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        } 
        String num = Integer.toString(checkNum);
        return num;
    }
    
    // 이메일 체크
    @RequestMapping(value = "/member/emailCheck", method = RequestMethod.POST)
    @ResponseBody
    public String emailCheck(@RequestParam("email") String email) throws Exception{
    
        logger.info("useremailCheck 진입");
        logger.info("전달받은 email:"+ email);
        int cnt = emailCheckService.emailCheck(email);
      
        logger.info("확인 결과:"+cnt);
        
        return Integer.toString(cnt);
    }
    
}
