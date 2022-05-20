package com.shoppingmall.web.main.basket;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.shoppingmall.web.main.item.ItemQtyVo;
import com.shoppingmall.web.main.item.ItemVo;
import com.shoppingmall.web.main.itemBuy.BasketBuyVo;
import com.shoppingmall.web.main.itemBuy.ItemBuyVo;

@Repository
public interface BasketDao {
	public int basketinsert(BasketVo basketvo); //장바구니에 담는거
	public List<BasketVo> basketSelect(Long usernum); //회원번호를 가지고 장바구니 목록을 가져온다.
	public Long count(); //회원 번호를 가지고 그 회원이 가지고 있는 장바구니에 전체 수량체크
	public int update(Long usernum, Long itemcode); //
	public List<ItemVo> basketList(String itemcode, String itemsize);
	public int basketbuyinsert (BasketBuyVo basketBuyVo);
	public int basketbuyinsert_sub (BasketBuyVo basketBuyVo);
	public int itembuyinsert (ItemBuyVo itemBuyVo);
	public int itembuyinsert_sub (ItemBuyVo itemBuyVo);
	public int basketdelete(Long kartnum);
	public int itemdelete(Long ordernum);
	public List<ItemVo> search(String itemname, String kategori);
	public List<ItemVo> searchAll(String itemname);
	public int plusupdate(Long kartnum);
	public int miusupdate(Long kartnum);
	public List<BasketVo> basSelect(Long kartnum);
	public int addressinsert(BasketBuyVo basketBuyVo);
	public List<ItemVo> catelist(String catecode);
	public List<ItemVo> allList();
	public ItemVo iteminfo(String itemcode);
	public List<ItemVo> iteminfo_sub(String itemcode);
	public int allcount();
	public int keycount(String itemname);
	public int catecount(String catecode);
	public int keycatecount(String itemname,String catecode);
	public int itemqtyupdate(String itemcode);
	public List<ItemQtyVo> itemqtyselect(String itemcode);
	public int qtyupdate(String itemcode);
}
