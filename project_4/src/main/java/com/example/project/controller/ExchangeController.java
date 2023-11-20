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

import com.example.project.dao.ExchangeService;
import com.example.project.model.Exchange;
import com.example.project.model.Order;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ExchangeController {
	
	
	@Autowired ExchangeService exchangeService;
	 
	
	@Autowired
	HttpSession session;
	
	@RequestMapping("/exchange/list.do") 
	public String deliveryView(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		String a = (String) session.getAttribute("sessionId");
	    if (a != null && a.equals("admin")) {
	    	return "/Exchange/exchange-list";
	    } else {
	        return "redirect:../home.do";
	    }
    }
	
	@RequestMapping(value = "/exchange/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String exchangeList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int startNum = Integer.parseInt(String.valueOf(map.get("startNum")));
		int lastNum = Integer.parseInt(String.valueOf(map.get("lastNum")));
		map.put("startNum", startNum);
		map.put("lastNum", lastNum);
		resultMap = exchangeService.selectExchangeList(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/mypag/updateExchangeState.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String updateExchangeState(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		exchangeService.updateExchangeState(map);
		return new Gson().toJson(resultMap);
	}

}
