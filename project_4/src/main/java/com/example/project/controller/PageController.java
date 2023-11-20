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

import com.example.project.dao.PageService;
import com.example.project.model.Product;
import com.example.project.model.Test;
import com.example.project.model.User;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class PageController {
	
	@Autowired
	PageService pageService;
	
	@Autowired
	HttpSession session;
	

	@RequestMapping("/header.do") 
	public String header(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		return "/page/header";
	}
	@RequestMapping("/home.do") 
	public String home(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		return "/page/home";
	}
	
	@RequestMapping("/mypage.do") 
	public String mypage(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		return "/page/mypage";
	}

	@RequestMapping("/productpage.do") 
	public String productpage(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		return "/page/productpage";
	}
	
	@RequestMapping("/eventpage.do") 
	public String eventpage(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		return "/page/eventpage";
	}
	
	
	
	//포인트
	@RequestMapping(value = "/pointList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String pointList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<User> list = pageService.userPoint(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}

	
}
	
