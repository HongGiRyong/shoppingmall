package com.shoppingmall.web.main.itemdeleteService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoppingmall.web.main.basket.BasketDaoImpl;

@Service
public class ItemDeleteService {
	private BasketDaoImpl basketDao;
	
	@Autowired
	public ItemDeleteService(BasketDaoImpl basketDaoImpl) {
		this.basketDao = basketDaoImpl;
	}
	public int itemdelete(Long ordernum) {
		int result = basketDao.itemdelete(ordernum);
		
		
		
		return result;
		
	}
}
