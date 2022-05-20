package com.shoppingmall.web.main.basket;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shoppingmall.web.main.item.ItemQtyVo;
import com.shoppingmall.web.main.item.ItemVo;
import com.shoppingmall.web.main.itemBuy.BasketBuyVo;
import com.shoppingmall.web.main.itemBuy.ItemBuyVo;

@Repository("basketDao")
public class BasketDaoImpl implements BasketDao{
	
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	public BasketDaoImpl(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	@Override
	public int basketinsert(BasketVo basketvo) {
		return sqlSessionTemplate.insert("basketinsert", basketvo);
	}

	@Override
	public List<BasketVo> basketSelect(Long usernum) {
		return sqlSessionTemplate.selectList("basketselect", usernum);
	}

	@Override
	public Long count() {
		return sqlSessionTemplate.selectOne("buycount");
	}

	@Override
	public int update(Long usernum, Long itemcode) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public List<ItemVo> basketList(String itemcode, String itemsize) {
		BasketVo basketVo = new BasketVo();
		basketVo.setItemcode(itemcode);
		basketVo.setItemsize(itemsize);
		return sqlSessionTemplate.selectList("basketList", basketVo);
	}
	@Override
	public int basketbuyinsert(BasketBuyVo basketBuyVo) {
		return sqlSessionTemplate.insert("basketbuyinsert",basketBuyVo);
	}
	@Override
	public int basketbuyinsert_sub(BasketBuyVo basketBuyVo) {
		return sqlSessionTemplate.insert("basketbuyinsert_sub",basketBuyVo);
	}
	@Override
	public int itembuyinsert(ItemBuyVo itemBuyVo) {
		return sqlSessionTemplate.insert("itembuyinsert",itemBuyVo);
	}
	@Override
	public int itembuyinsert_sub(ItemBuyVo itemBuyVo) {
		return sqlSessionTemplate.insert("itembuyinsert_sub",itemBuyVo);
	}
	@Override
	public int basketdelete(Long kartnum) {
		return sqlSessionTemplate.delete("basketdelete",kartnum);
	}
	@Override
	public int itemdelete(Long ordernum) {
		return sqlSessionTemplate.delete("itemdelete",ordernum);
	}
	@Override
	public List<ItemVo> search(String itemname, String itemcatecode) {
		Map<String,Object> map =new HashMap<String, Object>();
		map.put("search", itemname);
		map.put("itemcatecode", itemcatecode);
		return sqlSessionTemplate.selectList("search",map);
	}
	@Override
	public List<ItemVo> searchAll(String itemname) {
		return sqlSessionTemplate.selectList("searchAll",itemname);
	}
	@Override
	public int plusupdate(Long kartnum) {
		return sqlSessionTemplate.update("plus", kartnum);
	}
	@Override
	public int miusupdate(Long kartnum) {
		return sqlSessionTemplate.update("mius", kartnum);
	}
	@Override
	public List<BasketVo> basSelect(Long kartnum) {
		return sqlSessionTemplate.selectList("basSelect", kartnum);
	}
	@Override
	public int addressinsert(BasketBuyVo basketBuyVo) {
		return sqlSessionTemplate.update("address", basketBuyVo);
	}
	@Override
	public List<ItemVo> catelist(String catecode) {
		return sqlSessionTemplate.selectList("catelist",catecode);
	}
	@Override
	public List<ItemVo> allList() {
		return sqlSessionTemplate.selectList("allList");
	}
	@Override
	public ItemVo iteminfo(String itemcode) {
		return sqlSessionTemplate.selectOne("iteminfo",itemcode);
	}
	@Override
	public List<ItemVo> iteminfo_sub(String itemcode) {
		return sqlSessionTemplate.selectList("iteminfo_sub",itemcode);
	}
	@Override
	public int allcount() {
		return sqlSessionTemplate.selectOne("allcount");
	}
	@Override
	public int keycount(String itemname) {
		return sqlSessionTemplate.selectOne("keycount",itemname);
	}
	@Override
	public int keycatecount(String itemname, String catecode) {
		Map<String,String> map =new HashMap<String,String>();
		map.put("itemname", itemname);
		map.put("catecode", catecode);
		return sqlSessionTemplate.selectOne("keycatecount",map);
	}
	@Override
	public int catecount(String catecode) {
		return sqlSessionTemplate.selectOne("catecount",catecode);
	}
	@Override
	public int itemqtyupdate(String itemcode) {
		return sqlSessionTemplate.update("itemqtyupdate",itemcode);
	}
	@Override
	public List<ItemQtyVo> itemqtyselect(String itemcode) {
		return sqlSessionTemplate.selectList("itemqtyselect",itemcode);
	}
	@Override
	public int qtyupdate(String itemcode) {
		return sqlSessionTemplate.update("qtyupdate",itemcode);
	}
	
}
