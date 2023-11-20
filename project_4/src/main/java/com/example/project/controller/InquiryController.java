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

import com.example.project.dao.InquiryService;
import com.example.project.model.Inquiry;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class InquiryController {
	
	@Autowired
	HttpSession session;
	
	@Autowired
	InquiryService inquiryService;
	 
	@RequestMapping("/inquiry/list.do") 
    public String list(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		String a = (String) session.getAttribute("sessionId");
	    if (a != null && a.equals("admin")) {
	    	return "/Inquiry/inquiry-list";
	    } else {
	        return "redirect:../home.do";
	    }

    }
	
	@RequestMapping("/inquiry/view.do") 
	public String view(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		String a = (String) session.getAttribute("sessionId");
	    if (a != null && a.equals("admin")) {
	    	return "/Inquiry/inquiry-view";
	    } else {
	        return "redirect:../home.do";
	    }
	}
	
	@RequestMapping(value = "/inquiry/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String inquiryList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int startNum = Integer.parseInt(String.valueOf(map.get("startNum")));
		int lastNum = Integer.parseInt(String.valueOf(map.get("lastNum")));
		map.put("startNum", startNum);
		map.put("lastNum", lastNum);
		resultMap = inquiryService.selectInquiryList(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/inquiry/info.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String inquiryInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Inquiry info = inquiryService.selectInquiryInfo(map);
		resultMap.put("info", info);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/inquiry/answer.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String answer(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		inquiryService.updateInquiryAnswer(map);
		resultMap.put("message", "success");
		return new Gson().toJson(resultMap);
	}

	@RequestMapping(value = "/inquiry/search.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String inquiryListSearch(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Inquiry> list2 = inquiryService.searchInquiryList(map);
		resultMap.put("list2", list2);
		return new Gson().toJson(resultMap);
	}
}
