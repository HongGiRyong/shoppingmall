package com.shoppingmall.web.admin.service;

import java.util.Collection;

import org.springframework.web.multipart.MultipartFile;

import com.shoppingmall.web.admin.model.ItemAddListVo;
import com.shoppingmall.web.admin.model.ItemDeleteVo;
import com.shoppingmall.web.admin.model.ItemRegisterVo;
import com.shoppingmall.web.admin.model.MemberDeleteVo;
import com.shoppingmall.web.admin.model.MemberDetailVo;
import com.shoppingmall.web.admin.model.MemberManageVo;
import com.shoppingmall.web.admin.model.MemberSearchVo;
import com.shoppingmall.web.admin.model.OrderDetailVo;
import com.shoppingmall.web.admin.model.OrderListVo;

public interface MemberManageService {
	
	public Collection<MemberManageVo> memberAllList();
	public Collection<MemberManageVo> memberSearchList(MemberSearchVo memberSearchVo);
	public Collection<MemberDetailVo> memberDetailSub(MemberDetailVo memberDetailVo);
	public Collection<MemberDetailVo> memberDetail(MemberDetailVo memberDetailVo);
	public void memberDelete(MemberDeleteVo memberDeleteVo);
	public Collection<MemberManageVo> withdrawalMemberAllList();
	public void itemRegister(ItemRegisterVo itemRegisterVo, MultipartFile file) throws Exception;
	public void itemAddOption(ItemAddListVo itemAddListVo);
	public int itemSizeCheck(String itemSize);
	public Collection<ItemAddListVo> itemAddList(ItemAddListVo itemAddListVo);
	public Collection<ItemRegisterVo> itemList();
	public Collection<ItemRegisterVo> itemSearchList(MemberSearchVo memberSearchVo);
	public Collection<ItemRegisterVo> itemDetail(ItemRegisterVo itemRegisterVo);
	public void itemUpdate(ItemRegisterVo itemRegisterVo, MultipartFile file) throws Exception;
	public int itemNameCheck(String itemName);
	public void itemDelete(ItemDeleteVo itemDeleteVo);
	public Collection<OrderListVo> orderList();
	public Collection<OrderListVo> orderCompleteList();
	public Collection<OrderDetailVo> orderDetail(String userId);
	public void orderDelivery(OrderDetailVo orderDetailVo);
	public void orderQtyChange(OrderDetailVo orderDetailVo);
}
