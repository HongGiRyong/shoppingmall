package com.shoppingmall.web.main.error;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.shoppingmall.web.main.itemBuyController.BasketBuyController;

public class RequsetErrors implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
		BasketBuyController err = (BasketBuyController) target;
		
	}

}
