package com.shoppingmall.web.main.itemBuyController;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shoppingmall.web.main.basket.BasketVo;
import com.shoppingmall.web.main.item.ItemQtyVo;
import com.shoppingmall.web.main.itemBuy.AjaxCommand;
import com.shoppingmall.web.main.itemBuy.BasketBuyVo;
import com.shoppingmall.web.main.itemBuy.ItemBuyQtyVo;
import com.shoppingmall.web.main.itemBuyService.BasketBuyService;
import com.shoppingmall.web.memberDto.MemberDto;

@Controller
public class BasketBuyController {

	private BasketBuyService basketBuyService;
	private List<Long> kartnums;

	@Autowired
	public BasketBuyController(BasketBuyService basketBuyService) {
		this.basketBuyService = basketBuyService;
	}

	public void setKartnums(List<Long> kartnums) {
		this.kartnums = kartnums;
	}

	@RequestMapping("/buyX")
	public String buyX(RedirectAttributes redirect) {
		System.out.println("1111111111");
		redirect.addFlashAttribute("error", "취소 완료");
		return "redirect:/basket";
	}

	@RequestMapping(value = "/buy", method = RequestMethod.POST)
	public String test(HttpServletRequest request, Model model, RedirectAttributes redirect) {
		String[] check = request.getParameterValues("basketbuy");
		if (check != null) {
			List<Long> checks = new ArrayList<Long>();
			for (int i = 0; i < check.length; i++) {
				Long test = Long.parseLong(check[i]);
				checks.add(test);
				setKartnums(checks);
			}

		} else {
			redirect.addFlashAttribute("error", "주문 체크 부탁드립니다.");

			return "redirect:/basket";
		}

		return "main/userBuy";
	}

	@RequestMapping("/order")
	public String order(@ModelAttribute BasketBuyVo itembuyVo, Model model, HttpServletRequest request,
			RedirectAttributes redirect) {
		System.out.println("수령인 이름 확인 : " + itembuyVo.getOrderrec());
		HttpSession session = request.getSession();
		MemberDto login = (MemberDto) session.getAttribute("loginuser");	
		if(login.getNum() != null) {
		try {
			for (int i = 0; i < kartnums.size(); i++) {
				String address = itembuyVo.getUseraddr1().substring(0, itembuyVo.getUseraddr1().indexOf(",", 0));
				itembuyVo.setUseraddr1(address);
				List<BasketVo> result = basketBuyService.basSelect(kartnums.get(i));
				int success = basketBuyService.basketBuyService(itembuyVo, result, login.getNum(),login.getName());
				if (success != 0) {
					redirect.addFlashAttribute("good", "주문성공");
				} else {
					redirect.addFlashAttribute("good", "주문실패");
				}
			}
		} catch (Exception e) {
			System.out.println("catch : " + itembuyVo.getOrderphon());
			for (int i = 0; i < kartnums.size(); i++) {
				itembuyVo.setUseraddr1(login.getAddress1());
				itembuyVo.setUseraddr2(login.getAddress2());
				List<BasketVo> result = basketBuyService.basSelect(kartnums.get(i));
				int success = basketBuyService.basketBuyService(itembuyVo, result, login.getNum(), login.getName());
				if (success != 0) {
					redirect.addFlashAttribute("good", "주문성공");
				} else {
					redirect.addFlashAttribute("good", "주문실패");
				}
			}
		}
		}else {
			model.addAttribute("basket","로그인 후 이용하십쇼");
			return "redirect:/member/login";
		}

		return "redirect:/basket";

	}

	@RequestMapping("/delete")
	public String basketdelete(HttpServletRequest request, Model model, RedirectAttributes redirect) {
		String[] check = request.getParameterValues("basketbuy");
		List<Long> checks = new ArrayList<Long>();
		for (int i = 0; i < check.length; i++) {
			Long test = Long.parseLong(check[i]);
			checks.add(test);
		}
		for (int i = 0; i < checks.size(); i++) {
			int result = basketBuyService.basketdelete(checks.get(i));
			if (result != 0) {
				redirect.addFlashAttribute("good", "장바구니 삭제");
			} else {
				redirect.addFlashAttribute("good", "장바구니 삭제 실패");
			}
		}

		return "redirect:/basket";
	}

	@RequestMapping("/buy/qty")
	@ResponseBody
	public AjaxCommand basketbuymius(@RequestBody ItemBuyQtyVo vo, Model model) {
		if (vo.getValue().equals("-")) {
			List<BasketVo> result = basketBuyService.basketbuymius(vo.getKartnum());
			AjaxCommand com = new AjaxCommand();
			com.setKartnum(result.get(0).getKartnum());
			com.setItemqty(result.get(0).getItemqty());
			com.setItemprice(vo.getItemprice());
			if(result.get(0).getItemqty() == 0) {
				List<BasketVo> result1 = basketBuyService.basketbuyplus(vo.getKartnum());
				com.setItemqty(result1.get(0).getItemqty());
				com.setInfo("수량이 없습니다.");
			}else if(result.get(0).getItemqty() == 1){
				int plus = basketBuyService.qtyupdate(result.get(0).getItemcode());
				int plus1 = basketBuyService.qtyupdate(result.get(0).getItemcode());
			}else {
				int plus = basketBuyService.qtyupdate(result.get(0).getItemcode());
			}
			return com;
		} else {
			List<BasketVo> basket = basketBuyService.basSelect(vo.getKartnum());
			List<ItemQtyVo> itemqty = basketBuyService.itemqtyselect(basket.get(0).getItemcode());
			AjaxCommand com = new AjaxCommand();
			if(itemqty.get(0).getItemqty() != 0) {
				int mius = basketBuyService.itemqtyupdate(itemqty.get(0).getItemcode());
				List<BasketVo> result = basketBuyService.basketbuyplus(vo.getKartnum());
				
				List<ItemQtyVo> itemqty1 = basketBuyService.itemqtyselect(basket.get(0).getItemcode());
				if(itemqty1.get(0).getItemqty() == 0 ) { 
					List<BasketVo> result1 = basketBuyService.basketbuymius(vo.getKartnum());
					List<BasketVo> basket1 = basketBuyService.basSelect(vo.getKartnum());
					
					com.setKartnum(result.get(0).getKartnum());
					com.setItemqty(basket1.get(0).getItemqty());
					com.setItemprice(vo.getItemprice());
					com.setInfo("재고가 부족합니다.");
					return com;
				}
				
				com.setKartnum(result.get(0).getKartnum());
				com.setItemqty(result.get(0).getItemqty());
				com.setItemprice(vo.getItemprice());
				return com;
				
			}else {
				com.setKartnum(vo.getKartnum());
				com.setItemqty(basket.get(0).getItemqty());
				com.setItemprice(vo.getItemprice());
				com.setInfo("재고가 부족합니다.");
				return com;
			}
		}

	}

	@RequestMapping("buy/check")
	@ResponseBody
	public String checkbox(@RequestBody String kartnum) {
		System.out.println(kartnum);
		return kartnum;
	}

}
