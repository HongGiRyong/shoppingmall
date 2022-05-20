package com.shoppingmall.web.main.itemBuyService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoppingmall.web.main.basket.BasketDaoImpl;
import com.shoppingmall.web.main.basket.StartAjax;
import com.shoppingmall.web.main.item.ItemVo;
import com.shoppingmall.web.main.itemBuy.ItemBuyVo;

@Service
public class ItemBuyService {
	private BasketDaoImpl basketDao;
	
	@Autowired
	public ItemBuyService(BasketDaoImpl basketDaoImpl) {
		this.basketDao = basketDaoImpl;
	}
	public int itemBuyService(ItemBuyVo itembuyVo, Long uservo, StartAjax starAjax, String username) {
		ItemVo item = basketDao.iteminfo(starAjax.getItemcode());
		ItemBuyVo vo = new ItemBuyVo();
		vo.setOrderid(System.currentTimeMillis());
		vo.setItemcode(starAjax.getItemcode());
		vo.setAmount(item.getItemprice() *starAjax.getItemqty());
		vo.setUserid(uservo);
		vo.setOrderrec(username);
		vo.setOrderinfo(itembuyVo.getOrderinfo());
		vo.setOrderphon(itembuyVo.getOrderphon());
		vo.setUseraddr1(itembuyVo.getUseraddr1());
		vo.setUseraddr2(itembuyVo.getUseraddr2());
		vo.setItemsize(starAjax.getItemsize());
		vo.setItemqty(starAjax.getItemqty());
		basketDao.itembuyinsert_sub(vo);
		int result = basketDao.itembuyinsert(vo);
		return result;
	}
	public Long itemprice(String itemcode) {
		ItemVo item = basketDao.iteminfo(itemcode);
		return item.getItemprice();
	}
}
