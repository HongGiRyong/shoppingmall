package com.shoppingmall.web.main.itemController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shoppingmall.web.main.item.ItemVo;
import com.shoppingmall.web.main.itemService.ItemService;

@Controller
public class ItemController {

	private ItemService itemService;
	
	@Autowired
	public ItemController(ItemService itemService) {
		this.itemService = itemService;
	}
	@RequestMapping("/item")
	public String test() {
		return "main/item";
	}
	@RequestMapping (value = "/item/{itemcode}",method = RequestMethod.GET) 
	public String iteminfo(@PathVariable String itemcode, Model model) {
		ItemVo result = itemService.iteminfo(itemcode);
		List<ItemVo> result_sub = itemService.iteminfo_sub(itemcode);
		System.out.println("!!!!!!!!!!!!");
		System.out.println(result.getItemcatecode());
		System.out.println("!!!!!!!!!!!!");
		if(result.getItemcatecode().equals("A")) {
			model.addAttribute("categori","상의");
		}else if(result.getItemcatecode().equals("B")) {
			model.addAttribute("categori","하의");
		}else if(result.getItemcatecode().equals("C")) {
			model.addAttribute("categori","신발");
		}else if(result.getItemcatecode().equals("D")) {
			model.addAttribute("categori","악세서리");
		}else if(result.getItemcatecode().equals("E")) {
			model.addAttribute("categori","모자");
		}
		model.addAttribute("item",result);
		model.addAttribute("item_sub",result_sub);
		return"main/item";
	}
}
