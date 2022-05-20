package com.shoppingmall.web.main.itemBuyService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoppingmall.web.main.basket.BasketDaoImpl;
import com.shoppingmall.web.main.basket.BasketVo;
import com.shoppingmall.web.main.item.ItemQtyVo;
import com.shoppingmall.web.main.item.ItemVo;
import com.shoppingmall.web.main.itemBuy.BasketBuyVo;

@Service
public class BasketBuyService {
	private BasketDaoImpl basketDao;

	@Autowired
	public BasketBuyService(BasketDaoImpl basketDaoImpl) {
		this.basketDao = basketDaoImpl;
	}

	public Long itemallprice(String itemcode) {
		List<ItemVo> result = basketDao.basketList(itemcode,"");
		return result.get(0).getItemprice();

	}

	public List<BasketVo> basketbuymius(Long kartnum) {
		basketDao.miusupdate(kartnum);
		List<BasketVo> result = basketDao.basSelect(kartnum);
		return result;
	}

	public List<BasketVo> basketbuyplus(Long kartnum) {
		basketDao.plusupdate(kartnum);
		List<BasketVo> result = basketDao.basSelect(kartnum);
		return result;
	}

	public List<BasketVo> basSelect(Long kartnum) {
		List<BasketVo> result = basketDao.basSelect(kartnum);
		return result;
	}

	public int basketdelete(Long kartnum) {
		int result = basketDao.basketdelete(kartnum);
		return result;

	}

//	public int addressinsert(BasketBuyVo basketBuyVo, UserVo uservo) {
	public int addressinsert(BasketBuyVo basketBuyVo, String test) {
		if (basketBuyVo.getUseraddr1().equals("0")) {// 기존주소 사용
			basketBuyVo.setUseraddr1(test);
//			basketBuyVo.setAddress(uservo.getUseraddress());
			int result = basketDao.addressinsert(basketBuyVo);
			return result;
		} else {
			int result = basketDao.addressinsert(basketBuyVo);
			return result;
		}
	}

	public int basketBuyService(BasketBuyVo itembuyVo, List<BasketVo> result, Long userid, String username) {
		// UserVo uservo
//				List<BasketVo> basketselect = basketDao.basketSelect(uservo.getUsernum());
		for (int i = 0; i < result.size(); i++) {
			ItemVo item = basketDao.iteminfo(result.get(i).getItemcode());
			BasketBuyVo vo = new BasketBuyVo();
			vo.setOrderid(System.currentTimeMillis());
			vo.setItemcode(result.get(i).getItemcode());
			vo.setAmount(item.getItemprice() * result.get(i).getItemqty());
			vo.setOrderrec(username);
			vo.setUserid(userid);
			vo.setOrderinfo(itembuyVo.getOrderinfo());
			vo.setOrderphon(itembuyVo.getOrderphon());
			vo.setUseraddr1(itembuyVo.getUseraddr1());
			vo.setUseraddr2(itembuyVo.getUseraddr2());
			vo.setItemqty(result.get(i).getItemqty());
			vo.setItemsize(result.get(i).getItemsize());
			String asf = vo.toString();
			System.out.println(asf);
			basketDao.basketbuyinsert(vo);
			basketDao.basketbuyinsert_sub(vo);
			basketDao.basketdelete(result.get(i).getKartnum());
		}

		return 1;

	}
	public int itemqtyupdate(String itemcode) {
		int result = basketDao.itemqtyupdate(itemcode);
		return result;
	}
	public List<ItemQtyVo> itemqtyselect(String itemcode){
		List<ItemQtyVo> result = basketDao.itemqtyselect(itemcode);
		return result;
	}
	public int qtyupdate(String itemcode) {
		int result = basketDao.qtyupdate(itemcode);
		return result;
	}

}
