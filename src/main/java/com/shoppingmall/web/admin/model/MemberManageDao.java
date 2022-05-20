package com.shoppingmall.web.admin.model;

import java.util.Collection;

public interface MemberManageDao {

	public Collection<MemberManageVo> memberList();
	public Collection<MemberManageVo> memberSearchList(MemberSearchVo memberSearchVo);
	public Collection<MemberDetailVo> memberDetailSub(MemberDetailVo memberDetailVo);
	public Collection<MemberDetailVo> memberDetail(MemberDetailVo memberDetailVo);
	public MemberManageVo withdrawalMemberSearch(MemberDeleteVo memberDeleteVo);
	public void withdrawalMemberReg(MemberManageVo memberManageVo);
	public void memberDelete(MemberDeleteVo memberDeleteVo);
	public Collection<MemberManageVo> withdrawalMemberAllList();
	public void itemRegister(ItemRegisterVo itemRegisterVo);
	public void itemAddOption(ItemAddListVo itemAddListVo);
	public int itemSizeCheck(String itemSize);
	public Collection<ItemAddListVo> itemAddList(ItemAddListVo itemAddListVo);
	public Collection<ItemRegisterVo> itemList();
	public Collection<ItemRegisterVo> itemSearchList(MemberSearchVo memberSearchVo);
	public Collection<ItemRegisterVo> itemDetail(ItemRegisterVo itemRegisterVo);
	public void itemUpdate(ItemRegisterVo itemRegisterVo);
	public int itemNameCheck(String itemName);
	public void itemDelete(ItemDeleteVo itemName);
	public void itemOptionDelete(ItemDeleteVo itemDeleteVo);
	public int itemCount(ItemDeleteVo itemDeleteVo);
	public Collection<OrderListVo> orderList();
	public Collection<OrderListVo> orderCompleteList();
	public Collection<OrderDetailVo> orderDetail(OrderListVo orderListVo);
	public void orderDelivery(OrderDetailVo orderDetailVo);
	public void orderQtyChange(OrderDetailVo orderDetailVo);
	public Collection<OrderDetailVo> orderQtyChangeSub(OrderDetailVo orderDetailVo);
}
