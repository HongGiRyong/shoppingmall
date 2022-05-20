package com.shoppingmall.web.main.basketService;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoppingmall.web.main.basket.BasketCommand;
import com.shoppingmall.web.main.basket.BasketDaoImpl;
import com.shoppingmall.web.main.basket.BasketListCommand;
import com.shoppingmall.web.main.basket.BasketVo;
import com.shoppingmall.web.main.item.ItemVo;

@Service
public class BasketSelectService {
	private BasketDaoImpl basketDao;
	
	@Autowired
	public BasketSelectService(BasketDaoImpl basketDaoImpl) {
		this.basketDao = basketDaoImpl;
	}
	public List<BasketCommand> basketselect(Long usernum){
		List<BasketVo> basketselect = basketDao.basketSelect(usernum);
		if(basketselect != null) {
			List<BasketListCommand> basketlist = new ArrayList<BasketListCommand>();
			for(int i = 0 ; i < basketselect.size() ; i++) {
				BasketListCommand basketListCommand = new BasketListCommand();
					basketListCommand.setItemcode(basketselect.get(i).getItemcode());
					basketListCommand.setItemqty(basketselect.get(i).getItemqty());
				basketlist.add(basketListCommand);
			}
			List<BasketCommand> result = new ArrayList<BasketCommand>();
			for(int i = 0 ; i < basketlist.size() ; i++) {
				List<ItemVo> itemselect = basketDao.basketList(basketlist.get(i).getItemcode(), basketselect.get(i).getItemsize());
				for(int j=0 ; j < itemselect.size() ; j++) {
					BasketCommand basketCommand = new BasketCommand();
					basketCommand.setKartnum(basketselect.get(i).getKartnum());
					basketCommand.setItemname(itemselect.get(j).getItemname());
					basketCommand.setPrice(itemselect.get(j).getItemprice());
					basketCommand.setItemimage(itemselect.get(j).getItemimage());
					basketCommand.setItemsize(itemselect.get(j).getItemsize());
					basketCommand.setItemqty(basketselect.get(i).getItemqty());
					result.add(basketCommand);
				}
			}
			return result;
			
			
		}else {
			return null;
		}
		
		
	}
}
