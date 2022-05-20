package com.shoppingmall.web.main.itemService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoppingmall.web.main.basket.BasketDaoImpl;
import com.shoppingmall.web.main.item.ItemVo;

@Service
public class ItemService {
private BasketDaoImpl basketDao;
	
	@Autowired
	public ItemService(BasketDaoImpl basketDaoImpl) {
		this.basketDao = basketDaoImpl;
	}
	public ItemVo iteminfo(String itemcode){
		ItemVo result = basketDao.iteminfo(itemcode);
		return result;
	}
	public List<ItemVo> iteminfo_sub(String itemcode){
		return basketDao.iteminfo_sub(itemcode);
	}
}
