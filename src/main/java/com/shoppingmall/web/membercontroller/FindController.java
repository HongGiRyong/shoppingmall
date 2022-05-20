package com.shoppingmall.web.membercontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.shoppingmall.web.memberDto.MemberDto;
import com.shoppingmall.web.memberservice.FindService;

@Controller
@SessionAttributes("loginuser")
public class FindController {
	@Autowired
	private FindService findService;
	@Autowired
	BCryptPasswordEncoder passEncoder;
	
	//아이디 찾기 페이지 이동
		@RequestMapping("/member/find_id_form")
		public String findid() {
			return "Find/findId";
		}
		
	//아이디 찾기 실행
		@RequestMapping(value = "/member/find_id", method = RequestMethod.POST)
		public String findidAction(MemberDto memberDto, Model model) {
			MemberDto user = findService.findId(memberDto);
			
			if(user == null) {
				model.addAttribute("check" ,  1);
			}else {
				model.addAttribute("check", 0);
				model.addAttribute("id" ,  user.getId());
			}
			return "Find/findId";
				
		}
		
	//비밀번호 찾기 페이지 이동
	@RequestMapping("/member/find_pw_form")
	public String gindpw() {
		return "Find/findPw";
	}
	
	//비밀번호 찾기 실행
	@RequestMapping(value = "/member/find_pw", method = RequestMethod.POST)
	public String findpwAction(MemberDto memberDto, Model model) {
		MemberDto user = findService.findPw(memberDto);
		
		if(user == null) {
			model.addAttribute("check", 1);
		}else {
			model.addAttribute("check" , 0);
			model.addAttribute("updateid",  user.getId());
		}
		return "Find/findPwProc";
	}
	
	//비밀번호 바꾸기 실행
	@RequestMapping(value="/member/update_pw", method =RequestMethod.POST)
	public String updatepwAction(@RequestParam(value="updateid", defaultValue = "", required = false) String id, MemberDto memberDto, @RequestParam(value="pwd") String pwd) {
		memberDto.setId(id);
		memberDto.setPw(pwd);
		String inputPass = memberDto.getPw();
		String pass = passEncoder.encode(inputPass);
		memberDto.setPw(pass);
		findService.updatePw(memberDto);
		return "main/jmain";
	}
	
	
	
}
