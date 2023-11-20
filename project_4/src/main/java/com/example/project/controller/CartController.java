package com.example.project.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.project.dao.CartService;
import com.example.project.model.Cart;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpSession;

@Controller
public class CartController {
	
	@Autowired
	CartService cartService;
	
	@Autowired
	HttpSession session;

	//나의 장바구니 페이지
	@RequestMapping("/cart/cartList.do") 
    public String mainGBoard(Model model) throws Exception{

        return "/PaymentAndCart/cart";
    }
	@RequestMapping("/basket.do") 
    public String basket(Model model) throws Exception{

        return "/PaymentAndCart/basket";
    }
	
	
	//장바구니 목록 출력 dox
	@RequestMapping(value = "/cart/searchCart.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchCart(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Cart> list =  cartService.searchCartListAll(map);
		resultMap.put("list", list);		
		return new Gson().toJson(resultMap);
	}
	
	//장바구니 페이지에서 수량 변경
	@RequestMapping(value = "/cart/cartPageChangeCnt.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String cartPageChangeCnt(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		cartService.cartPageChangeCnt(map);
		return new Gson().toJson(resultMap);
	}
	
	//장바구니에서 삭제 
	@RequestMapping(value = "/cart/removeCart.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String removeCart(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		cartService.removeCart(map);
		return new Gson().toJson(resultMap);
	}
	
	//장바구니 추가 
	@RequestMapping(value = "/cart/addCart.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addCart(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = cartService.searchCartProduct(map);
		return new Gson().toJson(resultMap);
	}
	
}
