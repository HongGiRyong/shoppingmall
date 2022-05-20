package com.shoppingmall.web.main.shopService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoppingmall.web.main.basket.BasketDaoImpl;
import com.shoppingmall.web.main.item.ItemVo;

@Service
public class ShopService {
private BasketDaoImpl basketDao;
	
	@Autowired
	public ShopService(BasketDaoImpl basketDaoImpl) {
		this.basketDao = basketDaoImpl;
	}
	public List<ItemVo> search(String itemname, String kategori){
		List<ItemVo> result = basketDao.search(itemname, kategori);
		return result;
	}
	public List<ItemVo> searchAll(String itemname){
		List<ItemVo> result = basketDao.searchAll(itemname);
		return result;
	}
	public List<ItemVo> catelist(String catecode){
		List<ItemVo> result = basketDao.catelist(catecode);
		return result;
	}
	public List<ItemVo> allList(){
		List<ItemVo> result = basketDao.allList();
		return result;
	}
	public int allcount(){
		int result = basketDao.allcount();
		return result;
}
	public int keycount(String itemname){
		int result = basketDao.keycount(itemname);
		return result;
}
	public int keycatecount(String itemname,String catecode){
		int result = basketDao.keycount(itemname);
		return result;
}public int catecount(String catecode){
	int result = basketDao.catecount(catecode);
	return result;
}
	
}
