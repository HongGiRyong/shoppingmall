package com.shoppingmall.web.main.basketService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoppingmall.web.main.basket.BasketDaoImpl;
import com.shoppingmall.web.main.basket.BasketVo;

@Service
public class BasketAddService {
	private BasketDaoImpl basketDao;
	
	@Autowired
	public BasketAddService(BasketDaoImpl basketDaoImpl) {
		this.basketDao = basketDaoImpl;
	}
	
	public int basketinsert(Long usernum, String itemcode, Long itemqty, String itemsize) {
		BasketVo basketvo = new BasketVo();
		Long kartnum = System.currentTimeMillis();
		basketvo.setUsernum(usernum);
		basketvo.setItemcode(itemcode);
		basketvo.setKartnum(kartnum);
		basketvo.setItemqty(itemqty);
		basketvo.setItemsize(itemsize);
		
		int result=basketDao.basketinsert(basketvo);
		
		return result;
	}
	
}
