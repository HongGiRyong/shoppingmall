package com.shoppingmall.web.membercontroller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shoppingmall.web.admin.model.OrderDetailVo;
import com.shoppingmall.web.admin.model.OrderListVo;
import com.shoppingmall.web.memberDao.MemberDao;
import com.shoppingmall.web.memberDto.MemberDto;
import com.shoppingmall.web.memberservice.LoginService;
import com.shoppingmall.web.memberservice.MemberService;
//import com.shoppingmall.web.order.basket.BasketCommand;

@Controller
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	@Autowired
	MemberService memberService;
	@Autowired
	LoginService loginService;
	@Autowired
	BCryptPasswordEncoder passEncoder;
	@Autowired
	MemberDao memberDao;
	//내정보 조회
	@RequestMapping(value = "/member/readmypage", method = RequestMethod.GET)
	public String readMypageGet(HttpSession session , HttpServletRequest request, Model model) {
		session = request.getSession(false);
		MemberDto uservo = (MemberDto) session.getAttribute("loginuser");
//		OrderListVo ordervo = (OrderListVo) session.getAttribute("loginuser");
		
		if(uservo == null) {
			return "login";
		}else {
			//메서드 호출
			MemberDto memberDto = memberService.readMypage(uservo.getId());
			model.addAttribute("readmypage", memberDto);
			System.out.println(memberDto.getNum());
			Long num = memberDto.getNum();
			List<OrderListVo> orderList = (List<OrderListVo>)memberDao.myorderList(num);
			System.out.println(orderList);
			model.addAttribute("myorderDetail", orderList);
			//정보 저장후 페이지이동
			return "member/readmypage";
		}
		
		
		
		
	
	}
	
	//내정보 수정
	@RequestMapping(value = "/member/updatemypage/{id}", method = RequestMethod.GET)
	public String updateMypageGet(HttpSession session, Model model, @PathVariable String id) {
		MemberDto memberDto = memberService.readMypage(id);
		model.addAttribute("readmypage", memberDto);
		return "member/updatemypage";
	}
	@RequestMapping(value = "/member/updatemypage", method = RequestMethod.POST)
	public String updateMypagePost(MemberDto memberDto) {
		String inputPass = memberDto.getPw();
		String pass = passEncoder.encode(inputPass);
		memberDto.setPw(pass);
		memberService.updateMypage(memberDto);
		return "redirect:/jmain";
	}
	

	//내정보 삭제
	@RequestMapping(value = "/member/deletemypage/{id}", method = RequestMethod.GET)
	public String deleteMypageGet(HttpSession session, Model model, @PathVariable String id) {
		session.setAttribute("id", id);
		return "member/deletemypage";
	}
	
	@RequestMapping(value = "/member/deletemypage", method = RequestMethod.POST)
	public String deleteMypage(String id, RedirectAttributes rttr, HttpSession session) {	
		memberService.deleteMypage(id);
		session.invalidate();
		rttr.addFlashAttribute("msg", "이용해주셔서 감사합니다.");
		return "member/deletemypageProc";
		
	}	

		
	@RequestMapping(value ="/member/pwCheck", method = RequestMethod.POST)
	@ResponseBody
	public String pwCheck(MemberDto memberDto, @RequestParam("id") String id) {
		logger.info("id =" + id);
		logger.info("pw =" + memberDto.getPw());
		String pw = memberService.pwCheck(id);
		logger.info("pw =" + pw);
		if(memberDto.getPw() == null || !BCrypt.checkpw(memberDto.getPw(), pw)){
			logger.info("return 0");

			return "0";
	}
		return  "1";
		
	}
	
	
	
	
	
		
//		String dtoPass = memberDto.getPw();
//			if(!(pass.equals(dtoPass))) {
//				mav.addObject("msg", "false");
//				mav.setViewName("member/deletemypage");
//			}else {
//				memberService.deleteMypage(memberDto);
//				session.invalidate();
//				mav.addObject("msg" , "success");
//				mav.setViewName("member/deletemypage");
//			}
//		return mav;	
		
		
	
}
	

