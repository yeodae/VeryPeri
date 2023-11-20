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

import com.example.project.dao.DeliveryService;
import com.example.project.dao.InquiryService;
import com.example.project.dao.OrderService;
import com.example.project.dao.ProductService;
import com.example.project.model.DeliveryUser;
import com.example.project.model.Inquiry;
import com.example.project.model.Order;
import com.example.project.model.Wish;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class MyPagController {
	
	@Autowired
	HttpSession session;
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	DeliveryService deliveryService;
	
	@Autowired
	InquiryService inquiryService;
	

	@Autowired
	ProductService productService;
	

	//결제 페이지
	@RequestMapping("/mypag/orderExchange.do") 
	public String orderExchange(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		return "/myPag/orderExchange";
	}
	//결제 페이지
	@RequestMapping("/mypag/Order.do") 
    public String mainGBoard(Model model) throws Exception{
		
        return "/myPag/Order";
    }
	//헤더
	@RequestMapping("sexyheader.do") 
	public String sexyheader(Model model) throws Exception{

	return "/Product/sexyheader";
	}
	
	//푸터
	@RequestMapping("footer.do") 
	public String footer(Model model) throws Exception{

	return "/page/footer";
	}
	

	
	
	//마이페이지 보이기
	@RequestMapping("/mypag/main.do") 
    public String mainMypage(Model model) throws Exception{
		  String sId = (String)session.getAttribute("sessionId");
		  
		  if(sId == null || sId == "") {
			  return "redirect:/user/login.do";
		  }else {
			  return "/myPag/myPag01";
		  }
    }
	//회원정보수정 페이지
	@RequestMapping("/mypag/infoUpdate.do") 
    public String infoUpdate(Model model) throws Exception{
        return "/myPag/infoUpdate";
    }
	//회원정보 배송주소록
	@RequestMapping("/mypag/infoAddr.do") 
    public String infoAddr(Model model) throws Exception{
        return "/myPag/infoAddr";
    }
	//배송주소록 수정
	@RequestMapping("/mypag/editAddr.do") 
    public String editAddr(HttpServletRequest request,Model model,@RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
        return "/myPag/editAddr";
    }
	//배송주소록 등록
	@RequestMapping("/mypag/addAddr.do") 
    public String addAddr(HttpServletRequest request,Model model,@RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
        return "/myPag/addAddr";
    }
	//주소API
	@RequestMapping("/mypag/addr.do") 
    public String addr(Model model, @RequestParam HashMap<String, Object> map, HttpServletRequest request) throws Exception{
		
		return "/myPag/jusoPopup";
    }
	//찜목록
	@RequestMapping("/mypag/myInformation.do") 
    public String myProductInformation1(Model model, @RequestParam HashMap<String, Object> map, HttpServletRequest request) throws Exception{
        return "/myPag/myInformation";
    }
	
	//마이페이지 1:1문의 myInquiry
	@RequestMapping("/mypag/myInquiry.do") 
	public String myInquiry(Model model) throws Exception{
		return "/myPag/myInquiry";
	}
	//마이페이지 1:1문의 글쓰기
		@RequestMapping("/mypag/myAddInquiry.do") 
		public String myAddInquiry(Model model) throws Exception{
			return "/myPag/myAddInquiry";
	}
	//마이페이지 문의글 상세보기
		@RequestMapping("/mypag/myInquiryView.do") 
		public String myInquiryView(HttpServletRequest request,Model model,@RequestParam HashMap<String, Object> map) throws Exception{
			request.setAttribute("map", map);
			return "/myPag/myInquiryView";
	}
		
		//마이페이지 공지사항 목록
		@RequestMapping("/mypag/noticeList.do") 
		public String noticeList(Model model) throws Exception{
			return "/myPag/noticeList";
	}
		
	//마이페이지 공지사항 상세보기
		@RequestMapping("/mypag/noticeView.do") 
		public String noticeView(HttpServletRequest request,Model model,@RequestParam HashMap<String, Object> map) throws Exception{
			request.setAttribute("map", map);
			return "/myPag/noticeView";
	}
	//마이페이지 이용안내
		@RequestMapping("/mypag/useGuide.do") 
		public String useGuide(Model model) throws Exception{
			return "/myPag/useGuide";
	}
	//마이페이지 FAQ
		@RequestMapping("/mypag/faq.do") 
		public String faq(Model model) throws Exception{
			return "/myPag/faq";
	}
		
//		적립금 페이지
		@RequestMapping("/mypag/mypageReserves.do") 
	    public String mypageReserves(Model model) throws Exception{
	        return "/myPag/mypageReserves";
	    }
		
		
//		주문내역
		@RequestMapping("/mypag/myPagOrderdetails.do") 
		public String myPagOrderdetails(HttpServletRequest request,Model model,@RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
	        return "/myPag/myPagOrderdetails";
	    }	
		
	    
		
		
		
		//마이페이지 찜목록 리스트
		 @RequestMapping(value = "/mypag/wishlist.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String wishlist(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			List<Wish> list = productService.searchWishProdeuct(map);
			resultMap.put("list", list);
			return new Gson().toJson(resultMap);
		}
	
		//마이페이지 찜목록 단일 삭제
		@RequestMapping(value = "/mypag/removeSingleProdeuctWish.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String removeSingle(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			productService.removeSingleProdeuctWish(map);
			resultMap.put("list", "삭제 완료");
			return new Gson().toJson(resultMap);
		}
		//마이페이지 찜목록 전체 삭제
		@RequestMapping(value = "/mypag/removeAllProdeuctWish.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String removeAll(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			productService.removeAllWish(map);
			resultMap.put("list", "삭제 완료");
			return new Gson().toJson(resultMap);
		}
		
		//마이페이지 찜목록 장바구니 등록 
		@RequestMapping(value = "/mypag/editCart.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String eidtcart(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			productService.editcart(map);
			resultMap.put("list", "장바구니이동완료");
			return new Gson().toJson(resultMap);
		}
//삭제 전체 삭제 
	  @RequestMapping(value = "/mypag/removeWishProduct.dox", method = RequestMethod.POST,produces = "application/json;charset=UTF-8")  
	  @ResponseBody
	  public String remove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
	  HashMap<String, Object> resultMap = new HashMap<String, Object>();
	  String json = map.get("selectItem").toString();
	  ObjectMapper mapper = new ObjectMapper();
	  List<Object> list = mapper.readValue(json, new TypeReference<List<Object>>(){});
	  map.put("list", list);
	  productService.removeWishProduct(map); 
	  return new Gson().toJson(resultMap);
		}	
		
		
		
		
		
	//마이페이지 상단 프로필  구매 / 환불 /반품 카운터  정보
	@RequestMapping(value = "/mypag/listExchange.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String listExchange(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			List<Order> list = orderService.orderCntsearch(map);
			resultMap.put("list", list);
			return new Gson().toJson(resultMap);
	}
	
	
	//마이페이지 사용자 정보
	@RequestMapping(value = "/mypag/Info.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String mypagInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		return new Gson().toJson(resultMap);
	}
	//마이페이지 배송주소록
	 @RequestMapping(value = "/delivery/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String infoAddr(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<DeliveryUser> list = deliveryService.searchDeliveryUser(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	//마이페이지 주문내역
		@RequestMapping(value = "/mypag/productInformation.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String productInformation(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Order> list = orderService.orderProductSearch(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
		}
		
	//마이페이지 배송주소록수정
		@RequestMapping(value = "/mypag/editAddr.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String editAddr(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			deliveryService.editAddr(map);
			return new Gson().toJson(resultMap);
		}
	//마이페이지 배송주소록등록
		@RequestMapping(value = "/mypag/addAddr.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String addAddr(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			deliveryService.addAddr(map);
			return new Gson().toJson(resultMap);
		}
	//마이페이지 배송주소록삭제
		@RequestMapping(value = "/mypag/deleteAddr.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String deleteAddr(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			deliveryService.deleteAddr(map);
			return new Gson().toJson(resultMap);
		}
	//마이페이지 1:1문의내역 출력
		@RequestMapping(value = "/mypag/userInquiry.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String userInquiry(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			int startNum = Integer.parseInt(String.valueOf(map.get("startNum")));
			int lastNum = Integer.parseInt(String.valueOf(map.get("lastNum")));
			map.put("startNum", startNum);
			map.put("lastNum", lastNum);
			resultMap = inquiryService.selectInquiry(map);
			return new Gson().toJson(resultMap);
		}
	//마이페이지 1:1등록
		@RequestMapping(value = "/mypag/myPageAddInquiry.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String myPageAddInquiry(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
				HashMap<String, Object> resultMap = new HashMap<String, Object>();
				inquiryService.myPageAddBoard(map);
				return new Gson().toJson(resultMap);
		}
		
	//마이페이지 1:1문의 첨부파일등록
		@RequestMapping("/mypag/fileUpload2.dox")
		public String result(@RequestParam("file1") MultipartFile multi, @RequestParam("iNo") int iNo, HttpServletRequest request,HttpServletResponse response, Model model)
			    {
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
			            System.out.println("Working Directory = " + path2 + "\\src\\webapp\\img");
			            if(!multi.isEmpty())
			            {
			                File file = new File(path2 + "\\src\\main\\webapp\\img", saveFileName);
			                multi.transferTo(file);
			                
			                HashMap<String, Object> map = new HashMap<String, Object>();
			                map.put("filename", saveFileName);
			                map.put("path", "../img/" + saveFileName);
			                map.put("iNo", iNo);
			                
			                // insert 쿼리 실행
			                inquiryService.addBoardImg(map);
			                
			                model.addAttribute("filename", multi.getOriginalFilename());
			                model.addAttribute("uploadPath", file.getAbsolutePath());
			                
			                return "redirect:main.do";
			            }
			        }catch(Exception e) {
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
		
		
		
	

}
