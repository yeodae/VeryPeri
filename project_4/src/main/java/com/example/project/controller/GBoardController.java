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

import com.example.project.dao.GBoardService;
import com.example.project.model.DeliveryUser;
import com.example.project.model.GBoard;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class GBoardController {

	@Autowired
	GBoardService gboardService;

	@Autowired
	HttpSession session;

	// 메인 페이지
	// 멤버쉽 구독한 아티스트의 버튼만 보이도록 수정 예정
	@RequestMapping("/gboard/main.do")
	public String mainGBoard(Model model) throws Exception {
		
		return "/GBoard/01main/gboard_Main_01";
	}
	

	// 마이페이지
	@RequestMapping("/gboard/myPage.do")
	public String mypage(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map)
			throws Exception {

		return "/GBoard/01main/gboard_Mypage_01";
	}

	// BTS 아티스트 페이지
	@RequestMapping("/gboard/bts.do")
	public String memberBoard1(Model model) throws Exception {

		return "/GBoard/02artistMain/Main_01_BTS";
	}

	// 투모로우바이투게더 아티스트 페이지
	@RequestMapping("/gboard/txt.do")
	public String memberBoard2(Model model) throws Exception {

		return "/GBoard/02artistMain/Main_02_TXT";
	}

	// 엔하이픈 아티스트 페이지
	@RequestMapping("/gboard/ehp.do")
	public String memberBoard3(Model model) throws Exception {

		return "/GBoard/02artistMain/Main_03_EHP";
	}

	// 세븐틴 아티스트 페이지
	@RequestMapping("/gboard/svt.do")
	public String memberBoard4(Model model) throws Exception {

		return "/GBoard/02artistMain/Main_04_SVT";
	}

	// 프로미스나인 아티스트 페이지
	@RequestMapping("/gboard/fmn.do")
	public String memberBoard5(Model model) throws Exception {

		return "/GBoard/02artistMain/Main_05_FMN";
	}

	// 르세라핌 아티스트 페이지
	@RequestMapping("/gboard/lsf.do")
	public String memberBoard6(Model model) throws Exception {

		return "/GBoard/02artistMain/Main_06_LSF";
	}

	// 뉴진스 아티스트 페이지
	@RequestMapping("/gboard/njs.do")
	public String memberBoard7(Model model) throws Exception {

		return "/GBoard/02artistMain/Main_07_NJS";
	}

	// 보이넥스트도어 아티스트 페이지
	@RequestMapping("/gboard/bnd.do")
	public String memberBoard8(Model model) throws Exception {

		return "/GBoard/02artistMain/Main_08_BND";
	}

	// 지코 아티스트 페이지
	@RequestMapping("/gboard/zic.do")
	public String memberBoard9(Model model) throws Exception {

		return "/GBoard/02artistMain/Main_09_ZIC";
	}

	// 게시글에 댓글 다는 페이지
	@RequestMapping("/gboard/view.do")
	public String view(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map)
			throws Exception {
		request.setAttribute("map", map);
		String artist = (String) map.get("artist");
		String addr = "";
		if(artist.equals("BTS")) {
			addr = "/GBoard/02artistMain/Main_01_view_BTS";
			
		}else if(artist.equals("TXT")) {
			addr = "/GBoard/02artistMain/Main_02_view_TXT";
			
		}else if(artist.equals("EHP")) {
			addr = "/GBoard/02artistMain/Main_03_view_EHP";
			
		}else if (artist.equals("SVT")){
			addr = "/GBoard/02artistMain/Main_04_view_SVT";
			
		}else if(artist.equals("FMN")) {
			addr = "/GBoard/02artistMain/Main_05_view_FMN";
			
		}else if(artist.equals("LSF")) {
			addr = "/GBoard/02artistMain/Main_06_view_LSF";
			
		}else if(artist.equals("NJS")) {
			addr = "/GBoard/02artistMain/Main_07_view_NJS";
			
		}else if(artist.equals("BND")) {
			addr = "/GBoard/02artistMain/Main_08_view_BND";
			
		}else if(artist.equals("ZIC")) {
			addr = "/GBoard/02artistMain/Main_09_view_ZIC";
		}
			
		return addr;
	}

	// 신고 팝업 페이지
	@RequestMapping("/gboard/report.do")
	public String report(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map)
			throws Exception {
		request.setAttribute("map", map);
		return "/GBoard/Report_pop";
	}

	// 댓글 대댓글 신고 팝업 페이지
	@RequestMapping("/gboard/report2.do")
	public String report2(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map)
			throws Exception {
		request.setAttribute("map", map);
		return "/GBoard/Report_pop2";
	}
	
	//알람 팝업창
	@RequestMapping("/gboard/alarm.do")
	public String alarm(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map)
			throws Exception {
		request.setAttribute("map", map);
		return "/GBoard/Alarm_pop";
	}

	// 게시글 전체 조회 기능
	@RequestMapping(value = "/gboard/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String select(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<GBoard> list = gboardService.searchGBoardList(map);
		List<GBoard> list2 = gboardService.searchArtistGBoard(map);
		resultMap.put("list", list);
		resultMap.put("list2", list2);
		return new Gson().toJson(resultMap);
	}

	// 게시글 작성 기능
	@RequestMapping(value = "/gboard/add.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String add(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = gboardService.addGBoard(map);
		return new Gson().toJson(resultMap);
	}

	// 이미지 추가 기능
	@RequestMapping("/gboard/fileUpload.dox")
	public String result(@RequestParam("file1") MultipartFile multi, @RequestParam("gNo") int gNo,
			HttpServletRequest request, HttpServletResponse response, Model model) {
		String url = null;
		String path = "c:\\img";
		try {

			// String uploadpath = request.getServletContext().getRealPath(path);
			String uploadpath = path;
			String originFilename = multi.getOriginalFilename();
			String extName = originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
			long size = multi.getSize();
			String saveFileName = genSaveFileName(extName);

			System.out.println("uploadpath : " + uploadpath);
			System.out.println("originFilename : " + originFilename);
			System.out.println("extensionName : " + extName);
			System.out.println("size : " + size);
			System.out.println("saveFileName : " + saveFileName);
			String path2 = System.getProperty("user.dir");
			System.out.println("Working Directory = " + path2 + "\\src\\webapp\\img\\GBoardIMG");
			if (!multi.isEmpty()) {
				File file = new File(path2 + "\\src\\main\\webapp\\img\\GBoardIMG", saveFileName);
				multi.transferTo(file);

				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("filename", saveFileName);
				map.put("path", "../img/GBoardIMG/" + saveFileName);
				map.put("gNo", gNo);

				// insert 쿼리 실행
				gboardService.addGBoardImg(map);

				model.addAttribute("filename", multi.getOriginalFilename());
				model.addAttribute("uploadPath", file.getAbsolutePath());

				return "redirect:main.do";
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return "redirect:main.do";
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

	// 게시글 삭제 기능
	@RequestMapping(value = "/gboard/remove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String remove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		gboardService.removeGBoard(map);
		return new Gson().toJson(resultMap);
	}

	// 게시글 검색 기능
	@RequestMapping(value = "/gboard/search.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String selectInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<GBoard> info = gboardService.searchGBoardInfo(map);
		resultMap.put("info", info);
		return new Gson().toJson(resultMap);
	}

	// 게시글 좋아요 기능
	@RequestMapping(value = "/gboard/like.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String like(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int test = gboardService.likeGBoard(map);
		resultMap.put("message", "성공");
		resultMap.put("test", test);
		return new Gson().toJson(resultMap);
	}

	// 댓글 조회 기능
	@RequestMapping(value = "/gboard/commentList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String commentList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<GBoard> list = gboardService.searchComment(map);
		resultMap.put("commentList", list);
		return new Gson().toJson(resultMap);
	}

	// 댓글 작성 기능
	@RequestMapping(value = "/gboard/addComment.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addComment(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		gboardService.addComment(map);
		return new Gson().toJson(resultMap);
	}

	// 댓글 삭제 기능
	@RequestMapping(value = "/gboard/commentRemove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String commentRemove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		gboardService.removeComment(map);
		return new Gson().toJson(resultMap);
	}

	// 댓글 좋아요 기능
	@RequestMapping(value = "/gboard/commentLike.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String commentLike(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int test = gboardService.likeComment(map);
		resultMap.put("message", "성공");
		resultMap.put("test", test);
		return new Gson().toJson(resultMap);
	}

	// 대댓글 작성 기능
	@RequestMapping(value = "/gboard/addCocomment.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addCocomment(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		gboardService.addCocomment(map);
		return new Gson().toJson(resultMap);
	}

	// 대댓글 조회 기능
	@RequestMapping(value = "/gboard/cocommentList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String cocommentList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<GBoard> list = gboardService.searchCocomment(map);
		resultMap.put("cocommentList", list);
		return new Gson().toJson(resultMap);
	}

	// 대댓글 삭제 기능
	@RequestMapping(value = "/gboard/cocommentRemove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String cocommentRemove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		gboardService.removeCocomment(map);
		return new Gson().toJson(resultMap);
	}

	// 게시글 신고 + cnt 증가 기능
	@RequestMapping(value = "/gboard/report.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String report(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		gboardService.addReport(map);
		return new Gson().toJson(resultMap);
	}

	// 댓글 대댓글 신고 + cnt 증가 기능
	@RequestMapping(value = "/gboard/report2.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String report2(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		gboardService.addGCReport(map);
		return new Gson().toJson(resultMap);
	}

	// 마이페이지 내 정보 출력
	@RequestMapping(value = "/gboard/myPageList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String myPageList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<GBoard> list = gboardService.searchsMypageGBoard(map);
		List<GBoard> list2 = gboardService.searchMypageComment(map);
		List<GBoard> list3 = gboardService.searchMypageCoComment(map);
		List<GBoard> plist = gboardService.searchProfile(map);
		List<GBoard> mlist = gboardService.searchsMembership(map);
		resultMap.put("list", list);
		resultMap.put("list2", list2);
		resultMap.put("list3", list3);
		resultMap.put("plist", plist);
		resultMap.put("mlist", mlist);
		return new Gson().toJson(resultMap);
	}

	// 프로필 추가 기능
	@RequestMapping(value = "/gboard/addProfile.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String addProfile(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = gboardService.addProfile(map);
		return new Gson().toJson(resultMap);
	}

	// 프로필 닉네임 수정 기능
	@RequestMapping(value = "/gboard/updateProfileNickName.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String updateProfileNickName(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		gboardService.updateProfile(map);
		resultMap.put("test", map.get("nickName"));
		return new Gson().toJson(resultMap);
	}
	
	// 프로필 이미지 수정 기능
	@RequestMapping(value = "/gboard/updateProfileImg.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String updateProfileImg(Model model,@RequestParam("gpNo") int gpNo, @RequestParam("index") MultipartFile multi) throws Exception {
		System.out.println(model);
		String url = null;
	         String path="c:\\img";
	         try {
	  
	             //String uploadpath = request.getServletContext().getRealPath(path);
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
	             String path2 = System.getProperty("user.dir");
	             System.out.println("Working Directory = " + path2 + "\\src\\webapp\\img\\GBoardIMG");
	             if(!multi.isEmpty())
	            	 
	             {
	                 File file = new File(path2 + "\\src\\main\\webapp\\img\\GBoardIMG", saveFileName);
	                 multi.transferTo(file);
	                 
	                 HashMap<String, Object> map = new HashMap<String, Object>();
	                 map.put("filename", saveFileName);
	                 map.put("path", "../img/GBoardIMG/" + saveFileName);
	                 map.put("gpNo", gpNo);
	                 
	                 gboardService.updateProfileImg(map);
	                 
	                 model.addAttribute("filename", multi.getOriginalFilename());
	                 model.addAttribute("uploadPath", file.getAbsolutePath());
	                 
	                 return "redirect:main.do";
	             }
	         }catch(Exception e) {
	             System.out.println(e);
	         }
	         return "redirect:main.do";
		}
	
	// 프로필 이미지 삭제 기능
	@RequestMapping(value = "/gboard/ImgRemove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String ImgRemove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		gboardService.removeProfileImg(map);
		return new Gson().toJson(resultMap);
	}
	
	// 유저 멤버쉽 정보 출력
		@RequestMapping(value = "/gboard/membershipCheck.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String membershipCheck(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			List<GBoard> list = gboardService.searchsMembership(map);
			resultMap.put("list", list);
			return new Gson().toJson(resultMap);
		}
		//알림 3개출력
		@RequestMapping(value = "/gboard/alramList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String alramList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			resultMap = gboardService.selectAlarm(map);
			return new Gson().toJson(resultMap);
		}

}
