package com.shoppingmall.web.admin.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.shoppingmall.web.HomeController;
import com.shoppingmall.web.admin.model.ItemAddListVo;
import com.shoppingmall.web.admin.model.ItemDeleteVo;
import com.shoppingmall.web.admin.model.ItemRegisterVo;
import com.shoppingmall.web.admin.model.MemberDeleteVo;
import com.shoppingmall.web.admin.model.MemberDetailVo;
import com.shoppingmall.web.admin.model.MemberManageVo;
import com.shoppingmall.web.admin.model.MemberSearchVo;
import com.shoppingmall.web.admin.model.OrderDetailVo;
import com.shoppingmall.web.admin.model.OrderListVo;
import com.shoppingmall.web.admin.service.MemberManageServiceImpl;
import com.shoppingmall.web.admin.utils.ItemRegValidator;

@Controller
public class AdminController {
 
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);	
	@Autowired
	private MemberManageServiceImpl memberManageServiceImpl;
	@Autowired
	private ItemRegValidator itemRegValidator;
	
	@InitBinder(value = "itemRegisterVo")
	protected void initBinder(WebDataBinder binder) {
		binder.addValidators(itemRegValidator);
	}
	
	@RequestMapping( value = "/admin", method = RequestMethod.GET)
	public String mainPage(Model model) {
		
		logger.info("관리자 페이지입니다.");
		 
		List<MemberManageVo> list = (List<MemberManageVo>)memberManageServiceImpl.memberAllList();
		model.addAttribute("list",list);
		
		List<ItemRegisterVo> itemList = (List<ItemRegisterVo>)memberManageServiceImpl.itemList();
		model.addAttribute("itemList", itemList);
		
		List<OrderListVo> orderList = (List<OrderListVo>)memberManageServiceImpl.orderList();
		model.addAttribute("orderList", orderList);
		
		return "admin/main";
	}
	 
	@RequestMapping( value = "/admin/memberManage", method = RequestMethod.GET)
	public String memberManage(Model model) {
		
		logger.info("회원 관리 페이지입니다.");
			
		List<MemberManageVo> list = (List<MemberManageVo>)memberManageServiceImpl.memberAllList();
		model.addAttribute("list",list);
		
		return "admin/memberManage";
	}
	
	@RequestMapping( value = "/admin/memberDetail/{num}", method = RequestMethod.GET)
	public String memberDetail(Model model, MemberDetailVo memberDetailVo) {
		
		logger.info("회원 상세 정보 페이지입니다.");
		
		List<MemberDetailVo> list = (List<MemberDetailVo>)memberManageServiceImpl.memberDetailSub(memberDetailVo);
		List<MemberDetailVo> detailList = (List<MemberDetailVo>)memberManageServiceImpl.memberDetail(memberDetailVo);
		
		model.addAttribute("list",list);
		model.addAttribute("detailList",detailList);
		
		return "admin/memberDetail";
	}
	
	@RequestMapping( value = "/admin/memberSearch", method = RequestMethod.POST)
	public String memberSerarch(MemberSearchVo memberSearchVo, Model model) {
		
		logger.info("회원 검색 페이지입니다. :" + memberSearchVo.getSearch());
			
		System.out.println("search :" + memberSearchVo.getSearch());
		System.out.println("select :" + memberSearchVo.getSelect());
		List<MemberManageVo> list = (List<MemberManageVo>)memberManageServiceImpl.memberSearchList(memberSearchVo);
		model.addAttribute("list",list);
		
		return "admin/memberManage";
	}
	
	@RequestMapping( value = "/admin/itemReg", method = RequestMethod.GET)
	public String itemRegOption(ItemRegisterVo itemRegisterVo) {
		
		logger.info("상품 등록 옵션 선택 페이지입니다.");
		
		return "admin/itemRegOption";
	}
	
	@RequestMapping( value = "/admin/itemNewReg", method = RequestMethod.GET)
	public String itemRegForm(ItemRegisterVo itemRegisterVo, Model model) {
		
		logger.info("상품 등록 양식 페이지입니다.");
		
		return "admin/itemReg";
	}

	@RequestMapping( value = "/admin/itemNewReg", method = RequestMethod.POST)
	public String itemRegService(@Valid @ModelAttribute ItemRegisterVo itemRegisterVo, MultipartFile file, BindingResult result) throws Exception{
		 
		logger.info("상품 등록 실행 페이지입니다.");    
		System.out.println(result.hasErrors());
		
		if(result.hasErrors()) {

			return "admin/itemReg";
		}
		memberManageServiceImpl.itemRegister(itemRegisterVo, file);
		
		return "redirect:/admin/itemList";
	}
	
	@RequestMapping( value = "/admin/itemAddList", method = RequestMethod.GET)
	public String itemAddList(ItemRegisterVo itemRegisterVo, MultipartFile file, Model model) throws Exception{
		 
		logger.info("옵션 추가할 상품 선택 페이지입니다.");    

		List<ItemRegisterVo> itemList = (List<ItemRegisterVo>)memberManageServiceImpl.itemList();
		
		model.addAttribute("itemList", itemList);
		
		return "admin/itemAddList";
	}
	
	@RequestMapping( value = "/admin/itemAddForm/{itemCode}", method = RequestMethod.GET)
	public String itemAddForm(@PathVariable("itemCode") String itemCode, Model model) throws Exception{
		 
		logger.info("기존 상품 옵션 추가 양식 페이지입니다.");    
		
		ItemAddListVo itemAddListVo = new ItemAddListVo();
		itemAddListVo.setItemCode(itemCode);
		
		List<ItemAddListVo> addList = (List<ItemAddListVo>)memberManageServiceImpl.itemAddList(itemAddListVo);
	
		model.addAttribute("addList", addList);
		
		return "admin/itemAddForm";
	}
	
	@RequestMapping( value = "/admin/itemAddForm", method = RequestMethod.POST)
	public String itemAddOptionService(@Valid ItemAddListVo itemAddListVo, BindingResult result) {
		 
		logger.info("기존 상품 옵션 추가 실행 페이지입니다.");   

		System.out.println(itemAddListVo.getItemQty());
		System.out.println(itemAddListVo.getItemSize());
		System.out.println(itemAddListVo.getItemCode());
		memberManageServiceImpl.itemAddOption(itemAddListVo);
		
		return "redirect:/admin/itemList";
	}
	
	@ResponseBody
	@RequestMapping( value = "/admin/itemSizeCheck" ,method=RequestMethod.GET)
	public String itemSizeCheck(String itemSize) {
		
		logger.info("사이즈 추가 중복 확인 페이지입니다. :" + itemSize);
		
		int result = memberManageServiceImpl.itemSizeCheck(itemSize);
		
		return Integer.toString(result);
	}
	
	@RequestMapping( value = "/admin/itemList", method = RequestMethod.GET)
	public String itemList(Model model) {
		
		logger.info("상품 목록 페이지입니다.");
		
		List<ItemRegisterVo> itemList = (List<ItemRegisterVo>)memberManageServiceImpl.itemList();
		
		model.addAttribute("itemList", itemList);

		return "admin/itemList";
	}
	
	@RequestMapping( value = "/admin/itemSearch", method = RequestMethod.POST)
	public String itemSerarch(MemberSearchVo memberSearchVo, Model model) {
		
		
		logger.info("상품 검색 페이지입니다. :" + memberSearchVo.getSelect());
			
		
		List<ItemRegisterVo> itemList = (List<ItemRegisterVo>)memberManageServiceImpl.itemSearchList(memberSearchVo);
		System.out.println(itemList);
		model.addAttribute("itemList",itemList);
		
		return "admin/itemList";
	}
	
	@RequestMapping( value = "/admin/itemDetail/{itemCode}&{itemSize}", method = RequestMethod.GET)
	public String itemDetail(@PathVariable("itemCode") String itemCode, @PathVariable("itemSize") String itemSize, ItemRegisterVo itemRegisterVo,Model model) {
		
		logger.info("상품 상세 페이지입니다.");
		System.out.println("itemCode : " + itemCode);
		System.out.println("itemSize : " + itemSize);
		System.out.println("Vo itemSize : " + itemRegisterVo.getItemSize());
		List<ItemRegisterVo> itemDetail = (List<ItemRegisterVo>)memberManageServiceImpl.itemDetail(itemRegisterVo);
		
		model.addAttribute("itemDetail", itemDetail);

		return "admin/itemDetail";
	}
	
	@RequestMapping( value = "/admin/itemUpdateForm/{itemCode}&{itemSize}", method = RequestMethod.GET)
	public String itemUpdateForm(@PathVariable("itemCode") String itemCode, ItemRegisterVo itemRegisterVo, Model model) {
		
		logger.info("상품 수정 페이지입니다.");
		System.out.println("Vo itemSize : " + itemRegisterVo.getItemSize());
		List<ItemRegisterVo> itemDetail = (List<ItemRegisterVo>)memberManageServiceImpl.itemDetail(itemRegisterVo);
		
		model.addAttribute("itemDetail",itemDetail);
		
		return "admin/itemUpdateForm";
	}
	
	@RequestMapping( value = "/admin/itemUpdate", method = RequestMethod.POST)
	public String itemUpdate(ItemRegisterVo itemRegisterVo, MultipartFile file, Model model) throws Exception{
		
		logger.info("상품 수정 내용 전송 페이지입니다.");
		
		System.out.println("file : " + file.getOriginalFilename());
		System.out.println("vo: 이름" + itemRegisterVo.getItemName());
		System.out.println("vo: 기존 사이즈" + itemRegisterVo.getItemOldSize());
		System.out.println("vo: 새로운 입력 사이즈" + itemRegisterVo.getItemSize());
		memberManageServiceImpl.itemUpdate(itemRegisterVo, file);
		
		return "redirect:/admin/itemList";
	}
	
	@RequestMapping( value = "/admin/orderList", method = RequestMethod.GET)
	public String orderList(Model model) {
		
		logger.info("주문 준비 목록 페이지입니다.");
 
		List<OrderListVo> orderList = (List<OrderListVo>)memberManageServiceImpl.orderList();
		
		model.addAttribute("orderList", orderList);
		
		return "admin/orderList";
	}
	
	@RequestMapping( value = "/admin/orderCompleteList", method = RequestMethod.GET)
	public String orderCompleteList(Model model) {
		
		logger.info("주문 완료 목록 페이지입니다.");
 
		List<OrderListVo> orderCompleteList = (List<OrderListVo>)memberManageServiceImpl.orderCompleteList();
		
		model.addAttribute("orderCompleteList", orderCompleteList);
		
		return "admin/orderCompleteList";
	}
	
	@RequestMapping( value = "/admin/orderDetail/{orderId}", method = RequestMethod.GET)
	public String orderDetail(@PathVariable("orderId") String orderId ,Model model) {
		
		logger.info("주문 상세 페이지입니다.");
		
		List<OrderDetailVo> orderDetail = (List<OrderDetailVo>)memberManageServiceImpl.orderDetail(orderId);
		
		model.addAttribute("orderDetail", orderDetail);
		
		return "admin/orderDetail";
	}
	
	@RequestMapping( value = "/admin/orderDelivery", method = RequestMethod.POST)
	public String orderDelivery(@RequestParam("delivery") String delivery, OrderDetailVo vo, Model model) {
		 
		logger.info("배송 상태 페이지입니다." + vo.getItemSize());
		System.out.println("기존 배송 상태 확인 : " + vo.getOriginDelivery());
		System.out.println("변경 배송 상태 확인 : " + vo.getDelivery());
		if(vo.getDelivery().equals("배송 중") && vo.getOriginDelivery().equals("배송준비")) {
			memberManageServiceImpl.orderDelivery(vo);
		}
		else if(vo.getDelivery().equals("배송 중")) {
			memberManageServiceImpl.orderDelivery(vo);
			memberManageServiceImpl.orderQtyChange(vo);
		}
		else if (vo.getDelivery().equals("배송 완료")) {
			memberManageServiceImpl.orderDelivery(vo);
			memberManageServiceImpl.orderQtyChange(vo);	
		}
		
		return "redirect:/admin/orderDetail/"+vo.getOrderId();
	}
	
	@RequestMapping( value = "/admin/memberDelete", method = RequestMethod.GET)
	@ResponseBody
	public String memberDelete(MemberDeleteVo memberDeleteVo, Model model) {
		
		logger.info("회원 삭제 페이지입니다.");

		if(memberDeleteVo.getAdmin().equals("1")) {
			return "2";
		}
		try {
			memberManageServiceImpl.memberDelete(memberDeleteVo);
			return "1";
		}catch(DataIntegrityViolationException e) {
			e.printStackTrace();
			return "0";
		}
	}
	
	@RequestMapping( value = "/admin/withdrawalMemberManage", method = RequestMethod.GET)
	public String withdrawalMemberManage(Model model) {
		
		logger.info("탈퇴 회원 목록 페이지입니다.");
			
		List<MemberManageVo> withdrawalList = (List<MemberManageVo>)memberManageServiceImpl.withdrawalMemberAllList();
		model.addAttribute("withdrawalList",withdrawalList);
		
		return "admin/withdrawalMemberManage";
	}
	
	@ResponseBody
	@RequestMapping( value = "/admin/itemNameCheck")
	public String itemNameCheck(String itemName) {
		
		logger.info("상품명 중복 확인 페이지입니다.");
		
		int result = memberManageServiceImpl.itemNameCheck(itemName);
		
		return Integer.toString(result);
	}
	
	@RequestMapping( value = "/admin/itemDelete", method = RequestMethod.POST)
	public String itemDelete(ItemDeleteVo itemDeleteVo, Model model) {
		
		logger.info("상품 삭제 페이지입니다." + itemDeleteVo.getItemCode());

		memberManageServiceImpl.itemDelete(itemDeleteVo);
		
		return "redirect:/admin/itemList";
	}
	
	@RequestMapping( value = "/admin/imageUpload", method = RequestMethod.POST)
//	@ResponseBody
	public void imageUpload(HttpServletRequest request, HttpServletResponse response, 
			MultipartFile upload) throws Exception{
		
		logger.info("textarea 이미지 업로드 페이지입니다.");
		//랜던 문자 생성
		UUID uid = UUID.randomUUID();
		
		OutputStream out = null;
		PrintWriter printWriter = null;
		
		//인코딩
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
	
		try {
			//파일 이름 가져오기
			String fileName = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes();
			
			//이미지 경로 생성
			String path = "D:/imgUpload";
			System.out.println("path : " + path);
			String ckUploadPath = path+ File.separator + uid + "_" + fileName;
			File folder = new File(path);
			
			//해당 디렉토리 확인
			if(!folder.exists()) {
				try {
					//폴더 생성
					folder.mkdirs();
				}catch(Exception e) {
					e.getStackTrace();
				}
			}
			
			out = new FileOutputStream(new File(ckUploadPath));
			out.write(bytes);
//			outputStream에 저장된 데이터를 전송하고 초기화
			out.flush(); 
			
//			String callback = request.getParameter("CKEditorFuncNum");
			printWriter = response.getWriter();
			String fileUrl =  "/imgUpload/" + uid + "_" + fileName;
	
			printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
			printWriter.flush();
			
//			JsonObject json = new JsonObject();
//			json.addProperty("uploaded", 1);
//			json.addProperty("fileName", fileName);
//			json.addProperty("url", fileUrl);
//			printWriter.println(json);
//			printWriter.flush();
			
		}catch(IOException e) {
			e.printStackTrace();
		}finally {
			try {
				if(out != null) {out.close();}
				if(printWriter != null) {printWriter.close();}
			}catch(IOException e) {e.printStackTrace();}
		}
		return ;
		
	}	
}








