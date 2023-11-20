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

import com.example.project.dao.OrderService;
import com.example.project.model.Order;
import com.example.project.model.Product;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpSession;

@Controller
public class OrderController {
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	HttpSession session;
	
	@RequestMapping("/order/list.do") 
    public String mainGBoard(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		String a = (String) session.getAttribute("sessionId");
	    if (a != null && a.equals("admin")) {
	    	return "/Delivery/order-list";
	    } else {
	        return "redirect:../home.do";
	    }
    }
	
	@RequestMapping(value = "/order/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String orderList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int startNum = Integer.parseInt(String.valueOf(map.get("startNum")));
		int lastNum = Integer.parseInt(String.valueOf(map.get("lastNum")));
		map.put("startNum", startNum);
		map.put("lastNum", lastNum);
		resultMap = orderService.selectOrderList(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/order/update.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String orderUpdate(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		orderService.updateOrder(map);
		resultMap.put("message", "success");
		return new Gson().toJson(resultMap);
	}
	@RequestMapping(value = "/order/updateOrderInfo.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String updateOrderInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		orderService.updateOrderInfo(map);
		resultMap.put("message", "success");
		return new Gson().toJson(resultMap);
	}
	
	//구매자 리스트
	@RequestMapping(value = "/mypag/Orderp.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Product> list = orderService.searchOrderp(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
		
	
	@RequestMapping(value = "/mypag/selectcartlist.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String selectcartlist(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Product> list = orderService.selectcartlist(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
		
	//구매확정으로 업데이트
	@RequestMapping(value = "/mypag/mypageOrderConfirm.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String mypageOrderConfirm(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		orderService.mypageOrderConfirm(map);
		return new Gson().toJson(resultMap);
	}
	
	//구매 전 취소
	@RequestMapping(value = "/mypag/mypageOrderCancel.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String mypageOrderCancel(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		orderService.mypageOrderCancel(map);
		return new Gson().toJson(resultMap);
	}
	
	//배송 완료 후 교환/반품
	@RequestMapping(value = "/mypag/mypageOrderchange.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String mypageOrderchange(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		orderService.mypageOrderchange(map);
		return new Gson().toJson(resultMap);
	}
	
	//비회원 주문 조회
	@RequestMapping(value = "/mypag/NonOrderList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String NonOrderList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Order> list = orderService.selectNonOrderList(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
		}
	
	@RequestMapping(value = "/mypag/nonPaymentkkk.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String nonPaymentkkk(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Order> list = orderService.nonPaymentkkk(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
		}
	
}
