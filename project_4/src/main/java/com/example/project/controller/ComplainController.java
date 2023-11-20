package com.example.project.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.project.dao.ComplainService;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ComplainController {
	
	@Autowired
	HttpSession session;
	
	@Autowired
	ComplainService complainService;
	 
	@RequestMapping("/complain/list.do") 
    public String complain(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		String a = (String) session.getAttribute("sessionId");
	    if (a != null && a.equals("admin")) {
	    	return "/Inquiry/complain-list";
	    } else {
	        return "redirect:../home.do";
	    }
    }
	
	@RequestMapping(value = "/complain/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String complainList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int startNum = Integer.parseInt(String.valueOf(map.get("startNum")));
		int lastNum = Integer.parseInt(String.valueOf(map.get("lastNum")));
		map.put("startNum", startNum);
		map.put("lastNum", lastNum);
		resultMap = complainService.selectComplainList(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/complain/update.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String complainUpdate(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		complainService.complainYn(map);
		resultMap.put("message", "success");
		return new Gson().toJson(resultMap);
	}
	
}
