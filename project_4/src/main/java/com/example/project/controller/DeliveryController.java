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

import com.example.project.dao.DeliveryService;
import com.example.project.model.DeliveryUser;
import com.example.project.model.Order;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class DeliveryController {
	
	@Autowired
	DeliveryService deliveryService;
	
	@Autowired
	HttpSession session;
	
	@RequestMapping("/delivery/list.do") 
    public String deliveryList(Model model) throws Exception{
		String a = (String) session.getAttribute("sessionId");
	    if (a != null && a.equals("admin")) {
	    	return "/Delivery/delivery-list";
	    } else {
	        return "redirect:../home.do";
	    }
    }
	
	@RequestMapping("/delivery/view.do") 
	public String deliveryView(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		String a = (String) session.getAttribute("sessionId");
	    if (a != null && a.equals("admin")) {
	    	return "/Delivery/delivery-view";
	    } else {
	        return "redirect:../home.do";
	    }
	}
	
	
	@RequestMapping(value = "/delivery/listSelect.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String deliveryList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int startNum = Integer.parseInt(String.valueOf(map.get("startNum")));
		int lastNum = Integer.parseInt(String.valueOf(map.get("lastNum")));
		map.put("startNum", startNum);
		map.put("lastNum", lastNum);
		resultMap = deliveryService.deliveryListSelect(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/delivery/listInfo.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Order> list = deliveryService.deliveryInfoSelect(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/delivery/updateState.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String orderUpdate(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		deliveryService.deliveryListSelect(map);
		resultMap.put("message", "success");
		return new Gson().toJson(resultMap);
	}
	@RequestMapping(value = "/delivery/updateOrder2.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String updateOrder2(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		deliveryService.updateOrder2(map);
		resultMap.put("message", "success");
		return new Gson().toJson(resultMap);
	}
	@RequestMapping(value = "/delivery/updateOrderInfo2.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String updateOrderInfo2(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		deliveryService.updateOrderInfo2(map);
		resultMap.put("message", "success");
		return new Gson().toJson(resultMap);
	}
	// 사용자 배송 주소록 
	@RequestMapping(value = "/delivery/searchDeliveryUser.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchDeliveryUser(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<DeliveryUser> list = deliveryService.searchDeliveryUser(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
}
