package com.shoppingmall.web.admin.model;

import java.util.Collection;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberManageDaoImpl implements MemberManageDao{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate; 	
	
	@Override
	public Collection<MemberManageVo> memberList() {
		
		return sqlSessionTemplate.selectList("memberInfoAll");
	}
	
	@Override
	public Collection<MemberManageVo> memberSearchList(MemberSearchVo memberSearchVo){
		System.out.println("sql 값 : " + sqlSessionTemplate.selectList("memberSearch",memberSearchVo));
		return sqlSessionTemplate.selectList("memberSearch",memberSearchVo);
	}
	
	@Override
	public Collection<MemberDetailVo> memberDetailSub(MemberDetailVo memberDetailVo){
		return sqlSessionTemplate.selectList("memberDetail_sub", memberDetailVo);
	}

	@Override
	public Collection<MemberDetailVo> memberDetail(MemberDetailVo memberDetailVo) {
		return sqlSessionTemplate.selectList("memberDetail",memberDetailVo);
	}
	
	@Override
	public MemberManageVo withdrawalMemberSearch(MemberDeleteVo memberDeleteVo) {
		return sqlSessionTemplate.selectOne("withdrawalMemberSearch", memberDeleteVo);
	}
	
	@Override
	public void withdrawalMemberReg(MemberManageVo memberManageVo) {
		sqlSessionTemplate.insert("withdrawalMemberReg", memberManageVo);
	}
	
	@Override
	public void memberDelete(MemberDeleteVo memberDeleteVo) {	
		sqlSessionTemplate.delete("memberDelete", memberDeleteVo);
	}
	
	@Override
	public Collection<MemberManageVo> withdrawalMemberAllList(){
		return sqlSessionTemplate.selectList("withdrawalMemberAllList");
	}
	
	@Override
	public void itemRegister(ItemRegisterVo itemRegisterVo) {
		sqlSessionTemplate.insert("itemRegister", itemRegisterVo);
	}
	
	@Override
	public void itemAddOption(ItemAddListVo itemAddListVo) {
		sqlSessionTemplate.insert("itemRegister_option",itemAddListVo);
	}
	
	@Override
	public int itemSizeCheck(String itemSize) {
		
		ItemCheckVo size = new ItemCheckVo();
		size.setItemSize(itemSize);
		
		return sqlSessionTemplate.selectOne("itemSize", size);
	}
	
	@Override
	public Collection<ItemAddListVo> itemAddList(ItemAddListVo itemAddListVo){
		return sqlSessionTemplate.selectList("itemAddList", itemAddListVo);
	}
	
	@Override
	public Collection<ItemRegisterVo> itemList(){
		return sqlSessionTemplate.selectList("itemList");
	}
	
	@Override
	public Collection<ItemRegisterVo> itemSearchList(MemberSearchVo memberSearchVo){
		return sqlSessionTemplate.selectList("itemSearch", memberSearchVo);
	}
	
	@Override
	public Collection<ItemRegisterVo> itemDetail(ItemRegisterVo itemRegisterVo){
		
		return sqlSessionTemplate.selectList("itemDetail", itemRegisterVo);
	}
	
	@Override
	public void itemUpdate(ItemRegisterVo itemRegisterVo) {
		sqlSessionTemplate.update("itemUpdate_1",itemRegisterVo);
		sqlSessionTemplate.update("itemUpdate_2",itemRegisterVo);
	}
	
	@Override
	public int itemNameCheck(String itemName) {
		
		ItemCheckVo name = new ItemCheckVo();
		name.setItemName(itemName);
		
		return sqlSessionTemplate.selectOne("itemName", name);
	}
	
	@Override
	public void itemOptionDelete(ItemDeleteVo itemDeleteVo) { 
		sqlSessionTemplate.delete("itemDelete_option", itemDeleteVo);
	}
	
	@Override
	public void itemDelete(ItemDeleteVo itemDeleteVo) {
		sqlSessionTemplate.delete("itemDelete", itemDeleteVo);
	}
	
	@Override
	public int itemCount(ItemDeleteVo itemDeleteVo) {
		return sqlSessionTemplate.selectOne("itemCount", itemDeleteVo);
	}
	
	@Override
	public Collection<OrderListVo> orderList(){
		return sqlSessionTemplate.selectList("orderList");
	}
	
	@Override
	public Collection<OrderListVo> orderCompleteList(){
		return sqlSessionTemplate.selectList("orderCompleteList");
	}
	
	@Override
	public Collection<OrderDetailVo> orderDetail(OrderListVo orderListVo) {
		return sqlSessionTemplate.selectList("orderDetail", orderListVo);
	}
	
	@Override
	public void orderDelivery(OrderDetailVo orderDetailVo) {
		sqlSessionTemplate.update("orderDelivery", orderDetailVo);
	}
	
	@Override
	public void orderQtyChange(OrderDetailVo orderDetailVo) {
		if(orderDetailVo.getDelivery().equals("배송 완료")) {
			orderDetailVo.setDelivery("-");
			sqlSessionTemplate.update("orderQtyChange", orderDetailVo);
		}else if(orderDetailVo.getDelivery().equals("배송 중")) {
			orderDetailVo.setDelivery("+");
			sqlSessionTemplate.update("orderQtyChange", orderDetailVo);
		}
		
	}
	
	@Override
	public Collection<OrderDetailVo> orderQtyChangeSub(OrderDetailVo orderDetailVo){
		return sqlSessionTemplate.selectList("orderQtyChange_sub", orderDetailVo);
	}
}




