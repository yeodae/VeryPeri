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

import com.example.project.dao.StaffService;
import com.example.project.model.Staff;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class StaffController {
	
	@Autowired
	HttpSession session;
	
	@Autowired
	StaffService staffService;
	
	@RequestMapping("/staff/login.do") 
    public String login(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		String a = (String) session.getAttribute("sessionId");
	    if (a != null && a.equals("admin")) {
	    	return "/Staff/staff-login";
	    } else {
	        return "redirect:../home.do";
	    }
    }
	@RequestMapping("/staff/left.do") 
	public String left(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		
		return "/Staff/staff-left";
	}
	@RequestMapping("/staff/home.do")
	public String home(HttpServletRequest request, HttpSession session) {
	    String a = (String) session.getAttribute("sessionId");
	    if (a != null && a.equals("admin")) {
	        return "/Staff/staff-home";
	    } else {
	        return "redirect:../home.do";
	    }
	}
	@RequestMapping("/staff/header.do") 
	public String header(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		
		return "/Staff/staff-header";
	}
	@RequestMapping("/staff/Management.do") 
	public String Management(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		
		return "/Staff/staff-Management";
	}
	
	@RequestMapping("/staff/add.do") 
	public String add(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		String a = (String) session.getAttribute("sessionId");
	    if (a != null && a.equals("admin")) {
	    	return "/Staff/staff-add";
	    } else {
	        return "redirect:../home.do";
	    }
	}
	
	@RequestMapping("/staff/edit.do") 
	public String edit(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		String a = (String) session.getAttribute("sessionId");
	    if (a != null && a.equals("admin")) {
	    	return "/Staff/staff-edit";
	    } else {
	        return "redirect:../home.do";
	    }
	}
	@RequestMapping("/staff/sales.do") 
	public String sales(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		return "/Staff/staff-sales";
	}
	
	@RequestMapping(value = "/staff/staffLogin.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String staffLogin(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = staffService.selectStaff(map);
		if(resultMap.containsKey("staff")) {
			Staff staff = (Staff)resultMap.get("staff");
			session.setAttribute("sNo", staff.getsNo());
			session.setAttribute("sName", staff.getsName());
			session.setAttribute("sStatus", staff.getsPosition());
		}else {
			System.out.println("난 엘스얌");
		}
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/staff/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Staff> list = staffService.selectStaffList(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/staff/add.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String add(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		staffService.addStaffInfo(map);
		resultMap.put("message", "success");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/staff/infoView.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String infoView(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Staff info = staffService.selectStaffInfo(map);
		resultMap.put("info", info);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/staff/edit.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String edit(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		staffService.updateStaff(map);
		
		resultMap.put("message", "success");
		return new Gson().toJson(resultMap);
	}
	@RequestMapping(value = "/staff/delete.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String delete(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		staffService.deleteStaff(map);
		resultMap.put("message", "success");
		return new Gson().toJson(resultMap);
	}
}
