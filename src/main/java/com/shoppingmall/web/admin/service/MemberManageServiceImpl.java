package com.shoppingmall.web.admin.service;

import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.Collection;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.shoppingmall.web.admin.model.ItemAddListVo;
import com.shoppingmall.web.admin.model.ItemDeleteVo;
import com.shoppingmall.web.admin.model.ItemRegisterVo;
import com.shoppingmall.web.admin.model.MemberDeleteVo;
import com.shoppingmall.web.admin.model.MemberDetailVo;
import com.shoppingmall.web.admin.model.MemberManageDaoImpl;
import com.shoppingmall.web.admin.model.MemberManageVo;
import com.shoppingmall.web.admin.model.MemberSearchVo;
import com.shoppingmall.web.admin.model.OrderDetailVo;
import com.shoppingmall.web.admin.model.OrderListVo;
import com.shoppingmall.web.admin.utils.UploadFileUtils;

@Repository
public class MemberManageServiceImpl implements MemberManageService{
	
	@Autowired
	private MemberManageDaoImpl memberManageDaoImpl;
//	@Resource(name="uploadPath")
//	private String uploadPath;
	
	@Override
	public Collection<MemberManageVo> memberAllList() {
		return memberManageDaoImpl.memberList();
	}
	
	@Override
	public Collection<MemberManageVo> memberSearchList(MemberSearchVo memberSearchVo){
		return memberManageDaoImpl.memberSearchList(memberSearchVo);
	}

	@Override
	public Collection<MemberDetailVo> memberDetailSub(MemberDetailVo memberDetailVo) {
		return memberManageDaoImpl.memberDetailSub(memberDetailVo);
	}
	
	@Override
	public Collection<MemberDetailVo> memberDetail(MemberDetailVo memberDetailVo) {
		return memberManageDaoImpl.memberDetail(memberDetailVo);
	}
	
	@Override
	public void memberDelete(MemberDeleteVo memberDeleteVo) {
		MemberManageVo withdrawalMember = (MemberManageVo)memberManageDaoImpl.withdrawalMemberSearch(memberDeleteVo);
		System.out.println(withdrawalMember.getBirth());
		System.out.println(withdrawalMember.getName());
		System.out.println(withdrawalMember);
		memberManageDaoImpl.withdrawalMemberReg(withdrawalMember);
		memberManageDaoImpl.memberDelete(memberDeleteVo);
	}
	
	@Override
	public Collection<MemberManageVo> withdrawalMemberAllList(){
		return memberManageDaoImpl.withdrawalMemberAllList();
	}
	
	@Override
	public void itemRegister(ItemRegisterVo itemRegisterVo, MultipartFile file) throws Exception{

		try {
			
		String imgUploadPath = "C:/image" + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;
		 
		if(file != null) {
			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		} else {
			fileName = "C:/image" + File.separator + "images" + File.separator + "none.png";
		}
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String cateCode = itemRegisterVo.getItemCateCode();
		String subNum = "";
		for(int i = 1; i <= 6; i ++) {
			subNum += (int)(Math.random() * 10);
		}
		
		String itemCode = ymd + cateCode + subNum;
		
		itemRegisterVo.setItemCode(itemCode);
		itemRegisterVo.setItemImage("imgUpload" + ymdPath + File.separator + fileName);
		itemRegisterVo.setItemThumbImage("imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		memberManageDaoImpl.itemRegister(itemRegisterVo);
		
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("등록 오류");
		}
		
	}
	
	@Override
	public void itemAddOption(ItemAddListVo itemAddListVo) {
		memberManageDaoImpl.itemAddOption(itemAddListVo);
	}
	
	@Override
	public Collection<ItemAddListVo> itemAddList(ItemAddListVo itemAddListVo){
		return memberManageDaoImpl.itemAddList(itemAddListVo);
	}
	
	@Override
	public int itemSizeCheck(String itemSize){
		return memberManageDaoImpl.itemSizeCheck(itemSize);
	}
	
	@Override
	public Collection<ItemRegisterVo> itemList(){
		return memberManageDaoImpl.itemList();
	}
	
	@Override
	public Collection<ItemRegisterVo> itemSearchList(MemberSearchVo memberSearchVo){
		return memberManageDaoImpl.itemSearchList(memberSearchVo);
	}
	
	@Override
	public Collection<ItemRegisterVo> itemDetail(ItemRegisterVo itemRegisterVo){
		return memberManageDaoImpl.itemDetail(itemRegisterVo);
	}
	
	@Override
	public void itemUpdate(ItemRegisterVo itemRegisterVo, MultipartFile file) throws Exception {
			
		
		if(file.getOriginalFilename() != "") {
			
			File delFile = new File("C:/image/"+itemRegisterVo.getItemImage());
			File delThumbFile = new File("C:/image/"+itemRegisterVo.getItemThumbImage());
			if(delFile.exists() && delThumbFile.exists()) {
				
				delFile.delete();
				delThumbFile.delete();
			}
			
			String imgUploadPath = "C:/image" + File.separator + "imgUpload";
			String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
			String fileName = null;

			fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);	
			itemRegisterVo.setItemImage("imgUpload" + ymdPath + File.separator + fileName);
			itemRegisterVo.setItemThumbImage("imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
			
			memberManageDaoImpl.itemUpdate(itemRegisterVo);
		}else {
			
			memberManageDaoImpl.itemUpdate(itemRegisterVo);
		}
	}
	
	@Override
	public int itemNameCheck(String itemName){
		return memberManageDaoImpl.itemNameCheck(itemName);
	}
	
	@Override
	public void itemDelete(ItemDeleteVo itemDeleteVo) {
		
		int num = memberManageDaoImpl.itemCount(itemDeleteVo);
		System.out.println("num : " + num);
		if(num > 1) {
			memberManageDaoImpl.itemOptionDelete(itemDeleteVo);
		}else if(num <= 1) {
			File delFile = new File("C:/image/"+itemDeleteVo.getItemImage());
			File delThumbFile = new File("C:/image/"+itemDeleteVo.getItemThumbImage());			
			delFile.delete();
			delThumbFile.delete();
			
			memberManageDaoImpl.itemDelete(itemDeleteVo);
			memberManageDaoImpl.itemOptionDelete(itemDeleteVo);
		}
	}
	
	@Override
	public Collection<OrderListVo> orderList(){
		return memberManageDaoImpl.orderList();
	}
	
	@Override
	public Collection<OrderListVo> orderCompleteList(){
		return memberManageDaoImpl.orderCompleteList();
	}
	
	@Override
	public Collection<OrderDetailVo> orderDetail(String userId) {
		
		OrderListVo orderListVo = new OrderListVo();
		orderListVo.setOrderId(userId);
		
		return memberManageDaoImpl.orderDetail(orderListVo);
	}
	
	@Override
	public void orderDelivery(OrderDetailVo orderDetailVo) {
		memberManageDaoImpl.orderDelivery(orderDetailVo);
	}
	
	@Override
	public void orderQtyChange(OrderDetailVo orderDetailVo) {
		
		List<OrderDetailVo> list = (List<OrderDetailVo>)memberManageDaoImpl.orderQtyChangeSub(orderDetailVo);
		OrderDetailVo change = new OrderDetailVo();
		
		for(OrderDetailVo i : list) {
			change.setItemCode(i.getItemCode());
			change.setItemQty(i.getItemQty());
			change.setItemSize(i.getItemSize());
			change.setDelivery(orderDetailVo.getDelivery());
			memberManageDaoImpl.orderQtyChange(change);
		}
//		memberManageDaoImpl.orderQtyChange(orderDetailVo);
	}
}



