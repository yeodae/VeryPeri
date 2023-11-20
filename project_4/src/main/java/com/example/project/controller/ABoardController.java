package com.example.project.controller;

import java.io.File;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.project.dao.ABoardService;
import com.example.project.model.ABoard;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class ABoardController {
	
	@Autowired
	HttpSession session;
	
	@Autowired
	ABoardService aboardService;
	
	@RequestMapping("/aboard/list.do") 
	public String list(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		String a = (String) session.getAttribute("sessionId");
	    if (a != null && a.equals("admin")) {
	    	return "/ABoard/aboard-list";
	    } else {
	        return "redirect:../home.do";
	    }
	}
	@RequestMapping("/aboard/add.do") 
	public String add(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		String a = (String) session.getAttribute("sessionId");
	    if (a != null && a.equals("admin")) {
	    	return "/ABoard/aboard-add";
	    } else {
	        return "redirect:../home.do";
	    }
	}
	@RequestMapping("/aboard/view.do") 
	public String view(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		String a = (String) session.getAttribute("sessionId");
	    if (a != null && a.equals("admin")) {
	    	return "/ABoard/aboard-view";
	    } else {
	        return "redirect:../home.do";
	    }
	}
	@RequestMapping("/aboard/edit.do") 
	public String edit(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		String a = (String) session.getAttribute("sessionId");
	    if (a != null && a.equals("admin")) {
	    	return "/ABoard/aboard-edit";
	    } else {
	        return "redirect:../home.do";
	    }
	}

	@RequestMapping("event/eventpage.do") 
	public String eventpage(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		return "/page/eventpage";
	}

	@RequestMapping("event/eventpageView.do") 
	public String eventpageview(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		return "/page/eventpage-view";
	}
	
	@RequestMapping("event/eventpageApply.do") 
	public String eventpageapply(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		return "/page/eventpage-apply";
	}
	
	
	
	@RequestMapping(value = "/aboard/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int startNum = Integer.parseInt(String.valueOf(map.get("startNum")));
		int lastNum = Integer.parseInt(String.valueOf(map.get("lastNum")));
		map.put("startNum", startNum);
		map.put("lastNum", lastNum);
		resultMap = aboardService.selectABoardList(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/aboard/list2.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardList2(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = aboardService.selectABoardList2(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/aboard/list3.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardList3(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int startNum = Integer.parseInt(String.valueOf(map.get("startNum")));
		int lastNum = Integer.parseInt(String.valueOf(map.get("lastNum")));
		map.put("startNum", startNum);
		map.put("lastNum", lastNum);
		resultMap = aboardService.selectABoardList3(map);
		return new Gson().toJson(resultMap);
	}
	@RequestMapping(value = "/event/list4.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String eventList4(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<ABoard> list = aboardService.selectABoardList4(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/aboard/artistInfo.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String selectEventAtistInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<ABoard> list = aboardService.selectEventAtistInfo(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/aboard/add.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String add(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = aboardService.insertABoard(map);
		resultMap.put("message", "success");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping("/fileUpload.dox")
	public String result(@RequestParam("file1") MultipartFile multi, @RequestParam("idx") int idx, HttpServletRequest request, HttpServletResponse response, Model model) {
	    String url = null;
	    String path = "c:\\img";
	    try {
	        String uploadpath = path;
	        String originFilename = multi.getOriginalFilename();
	        String extName = originFilename.substring(originFilename.lastIndexOf("."),originFilename.length());
	        long size = multi.getSize();
	        String saveFileName = genSaveFileName(extName);

	        System.out.println("uploadpath : " + uploadpath);
	        System.out.println("originFilename : " + originFilename);
	        System.out.println("extensionName : " + extName);
	        System.out.println("size : " + size);
	        System.out.println("saveFileName : " + saveFileName);

	        if(!multi.isEmpty()) {
	            String path2 = System.getProperty("user.dir");
	            System.out.println("Working Directory = " + path2 + "\\src\\webapp\\img\\logo");
	            File file = new File(path2 + "\\src\\main\\webapp\\img\\logo", saveFileName);
	            multi.transferTo(file);

	            HashMap<String, Object> map = new HashMap<String, Object>();
	            map.put("filename", saveFileName);
	            map.put("path", "../img/logo/" + saveFileName);
	            map.put("idx", idx);

	            // insert 쿼리 실행
	            aboardService.insertAboardImg(map);

	            model.addAttribute("filename", multi.getOriginalFilename());
	            model.addAttribute("uploadPath", file.getAbsolutePath());
	            
	            // JavaScript를 사용하여 팝업 창 닫기
	            return "<script type='text/javascript'>window.opener.location.reload(); window.close();</script>";
	        }
	    } catch(Exception e) {
	        System.out.println(e);
	    }
	    return "redirect:list.do";
	}

    
    // 현재 시간을 기준으로 파일 이름 생성
    private String genSaveFileName(String extName) {
        String fileName = "";
        
        Calendar calendar = Calendar.getInstance();
        fileName += calendar.get(Calendar.YEAR);
        fileName += calendar.get(Calendar.MONTH);
        fileName += calendar.get(Calendar.DATE);
        fileName += calendar.get(Calendar.HOUR);
        fileName += calendar.get(Calendar.MINUTE);
        fileName += calendar.get(Calendar.SECOND);
        fileName += calendar.get(Calendar.MILLISECOND);
        fileName += extName;
        
        return fileName;
    }

	
	@RequestMapping(value = "/aboard/info.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardinfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		ABoard info = aboardService.selectABoardInfo(map);
		resultMap.put("info", info);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/aboard/edit.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String edit(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		aboardService.updateABoard(map);
		resultMap.put("message", "success");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/aboard/delete.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String delete(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		aboardService.deleteABoard(map);
		resultMap.put("message", "success");
		return new Gson().toJson(resultMap);
	}
}
