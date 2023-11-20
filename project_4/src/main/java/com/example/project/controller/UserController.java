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

import com.example.project.dao.UserService;
import com.example.project.model.User;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	@Autowired
	HttpSession session;
	
	
	@RequestMapping("user/test.do") 
    public String test(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
        return "/join/test";
    }
	
	
	@RequestMapping("user/join.do") 
    public String join(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
        return "/join/join";
    }
	@RequestMapping("user/login.do") 
    public String login(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
        return "/join/login";
    }
	@RequestMapping("user/main.do") 
    public String main(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
        return "/join/main";
    }
	@RequestMapping("user/findId.do") 
    public String findId(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
        return "/join/findId";
    }
	@RequestMapping("user/findIdView.do") 
    public String findIdView(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
        return "/join/findIdView";
    }
	@RequestMapping("user/findPw.do") 
    public String findPw(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
        return "/join/findPw";
    }
	@RequestMapping("user/findPwView.do") 
    public String findPwView(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
        return "/join/findPwView";
    }
	@RequestMapping("user/nonOrder.do") 
    public String nonOrder(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
        return "/join/nonOrder";
    }
	@RequestMapping("user/nonOrderView.do") 
	public String nonOrderView(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
        return "/join/nonOrderView";
    }
	@RequestMapping("user/joinWelcome.do") 
    public String joinWelcome(HttpServletRequest request,Model model,@RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
        return "/join/joinWelcome";
    }
	
	@RequestMapping(value = "/user.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String viewId(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		User findId = userService.viewUserId(map);
		resultMap.put("findId", findId);
		return new Gson().toJson(resultMap);
	}
	@RequestMapping(value = "/user2.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String viewPw(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		User findPw = userService.viewUserPw(map);
		resultMap.put("findPw", findPw);
		return new Gson().toJson(resultMap);
	}
	@RequestMapping(value = "/user3.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String viewNonOrdernonOrder(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<User> nonOrder = userService.searchNonOrderNo(map);
		resultMap.put("nonOrder", nonOrder);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/userJoin/add.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String join(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		userService.addUser(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/login.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String login(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = userService.userLogin(map);
		if(resultMap.containsKey("user")) {
			User user = (User)resultMap.get("user");
			session.setAttribute("sessionId", user.getuId());
			session.setAttribute("sessionName", user.getuName());
			session.setAttribute("sessionPoint", user.getuPoint());
			//세션유지시간 1시간지정
			session.setMaxInactiveInterval(360*60);
			//session.setAttribute("sessionStatus", user.getStatus());
		}
		return new Gson().toJson(resultMap);
	}
	@RequestMapping(value = "/logout.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String logout(HttpSession session) {
	    HashMap<String, Object> resultMap = new HashMap<String, Object>();

	    // 로그아웃 처리: 세션 속성 제거
	    session.removeAttribute("sessionId");
	    session.removeAttribute("sessionName");
	    session.invalidate();

	    // 클라이언트에 로그아웃 결과 전송
	    resultMap.put("success", true);
	    resultMap.put("success2", "로그아웃 완료");
	    return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/findId.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String findId(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		User user = userService.searchUserId(map);
		resultMap.put("user", user);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/userJoin/check.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String check(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int cnt = userService.searchUserCnt(map);
		resultMap.put("cnt", cnt);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/findPw.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String findPw(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		User user = userService.searchUserPw(map);
		resultMap.put("user", user);
		return new Gson().toJson(resultMap);
	}
	@RequestMapping(value = "/nonOrder.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String nonOrder(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		User list = userService.searchUserId(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	@RequestMapping(value = "/editInfo.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String editInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		userService.editInfo(map);
		return new Gson().toJson(resultMap);
	}
	@RequestMapping(value = "/removeUser.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String removeUser(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		userService.removeUser(map);
		session.invalidate();
		return new Gson().toJson(resultMap);
	}
	
	
	@RequestMapping(value = "/addrAllDelete.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addrAllDelete(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		userService.addrAllDelete(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/meme/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int startNum = Integer.parseInt(String.valueOf(map.get("startNum")));
		int lastNum = Integer.parseInt(String.valueOf(map.get("lastNum")));
		map.put("startNum", startNum);
		map.put("lastNum", lastNum);
		resultMap = userService.selectOrderListPage(map);
		return new Gson().toJson(resultMap);
	}
	
	
}
