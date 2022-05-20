package com.shoppingmall.web.main.itemBuyController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shoppingmall.web.main.basket.StartAjax;
import com.shoppingmall.web.main.itemBuy.ItemBuyVo;
import com.shoppingmall.web.main.itemBuyService.ItemBuyService;
import com.shoppingmall.web.memberDto.MemberDto;

@Controller
public class ItemBuyController {

	private ItemBuyService itemBuyService;
	private StartAjax starAjax;

	@Autowired
	public ItemBuyController(ItemBuyService itemBuyService) {
		this.itemBuyService = itemBuyService;
	}

	public void setItembuy(StartAjax starAjax) {
		this.starAjax = starAjax;
	}

	@RequestMapping("/item/itembuy")
	@ResponseBody
	public String itembuy(@RequestBody StartAjax vo, HttpServletRequest request, Model model){
		HttpSession session = request.getSession();
		MemberDto login = (MemberDto) session.getAttribute("loginuser");

		
			try {
				System.out.println(login.getNum());
				setItembuy(vo);
				return "useritembuy";

			} catch (Exception e) {
				model.addAttribute("basket", "로그인 후 이용하십쇼");
				return "/web/member/login";
			}
		

	}
	@RequestMapping("/item/useritembuy")
	public String userorder() {
		return "main/useritemBuy";
	}

	@RequestMapping("/item/itemorder")
	public String itembuy(@ModelAttribute("itembuyVo") ItemBuyVo itemBuyVo, HttpServletRequest request, Model model,
			RedirectAttributes redirect) {
		HttpSession session = request.getSession();
		MemberDto login = (MemberDto) session.getAttribute("loginuser");
		try {
			if (itemBuyVo.getUseraddr1().equals(null)) {
				System.out.println(starAjax.getItemcode());
				System.out.println(starAjax.getItemqty());
				System.out.println(starAjax.getItemsize());
				String address = itemBuyVo.getUseraddr1().substring(0, itemBuyVo.getUseraddr1().indexOf(",", 0));
				itemBuyVo.setUseraddr1(address);
				int result = itemBuyService.itemBuyService(itemBuyVo, login.getNum(), starAjax, login.getName());
				if (result != 0) {
					redirect.addFlashAttribute("good", "주문완료");
				} else {
					redirect.addFlashAttribute("good", "주문실패");
				}

			} else {

				System.out.println(starAjax.getItemcode());
				System.out.println(starAjax.getItemqty());
				itemBuyVo.setUseraddr1(login.getAddress1());
				itemBuyVo.setUseraddr2(login.getAddress2());
				int result = itemBuyService.itemBuyService(itemBuyVo, login.getNum(), starAjax, login.getName());
				if (result != 0) {
					redirect.addFlashAttribute("good", "주문완료");
				} else {
					redirect.addFlashAttribute("good", "주문실패");
				}
			}

		} catch (Exception e) {
			return "redirect:/member/login";
		}
		return "redirect:/jmain";
	}

	@ResponseBody
	@RequestMapping("/item/itemplus")
	public Long priceup(@RequestBody StartAjax vo) {
		Long result = itemBuyService.itemprice(vo.getItemcode());
		if (vo.getItemqty() == 0) {
			return result;
		}
		Long hap = result * vo.getItemqty();
		return hap;
	}

	@ResponseBody
	@RequestMapping("/item/itemmius")
	public Long pricedu(@RequestBody StartAjax vo) {
		Long result = itemBuyService.itemprice(vo.getItemcode());
		if (vo.getItemqty() == 0) {
			return result;
		}
		Long hap = result * vo.getItemqty();
		return hap;
	}

}
