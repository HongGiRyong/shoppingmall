package com.shoppingmall.web.main.basketController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shoppingmall.web.main.basket.StartAjax;
import com.shoppingmall.web.main.basketService.BasketAddService;
import com.shoppingmall.web.memberDto.MemberDto;

@Controller
public class BasketaddController {
	private BasketAddService basketService;

	@Autowired
	public BasketaddController(BasketAddService basketService) {
		this.basketService = basketService;
	}

	@RequestMapping("/item/iteminfo") // url로 상품 품번과 수량을 요청해줘야 한다.
	@ResponseBody
	public String basketinfo(@RequestBody StartAjax vo, HttpServletRequest request, Model model){
		HttpSession session = request.getSession();
		MemberDto login = (MemberDto) session.getAttribute("loginuser");
		try {
			int result = basketService.basketinsert(login.getNum(), vo.getItemcode(), vo.getItemqty(),
					vo.getItemsize());
			if (result == 1) {
				model.addAttribute("basket", "장바구니에 추가 하셨습니다.");
			}
		}catch (Exception e) {
			return "/web/member/login";
		}
		return "/web/item/"+vo.getItemcode()+"";
	}

}
