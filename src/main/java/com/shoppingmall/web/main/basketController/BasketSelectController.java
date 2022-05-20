package com.shoppingmall.web.main.basketController;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shoppingmall.web.main.basket.BasketCommand;
import com.shoppingmall.web.main.basketService.BasketSelectService;
import com.shoppingmall.web.memberDto.MemberDto;

@Controller
public class BasketSelectController {
	private BasketSelectService basketSelectService;

	@Autowired
	public BasketSelectController(BasketSelectService basketSelectService) {
		this.basketSelectService = basketSelectService;
	}

	@RequestMapping("/basket")
	public String basketselect(HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession(false);
		MemberDto login = (MemberDto) session.getAttribute("loginuser");
		try {
			List<BasketCommand> result = basketSelectService.basketselect(login.getNum());
			model.addAttribute("basketselect", result);
		} catch (Exception e) {
			return "redirect:/member/login";

		}
		return "main/basket";
	}
}
