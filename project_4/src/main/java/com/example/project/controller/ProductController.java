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
import com.example.project.dao.ProductService;
import com.example.project.model.ABoard;
import com.example.project.model.Delivery;
import com.example.project.model.Product;
import com.example.project.model.Wish;
import com.google.gson.Gson;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;



@Controller
public class ProductController {
	
	@Autowired
	ProductService productService;
	
	  @Autowired 
	  HttpSession session;
	
	@RequestMapping("/product/add.do") 
	public String add(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		String a = (String) session.getAttribute("sessionId");
	    if (a != null && a.equals("admin")) {
	    	return "/Product/product-add";
	    } else {
	        return "redirect:../home.do";
	    }
		
	}
	@RequestMapping("/product/list.do") 
	public String list(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		String a = (String) session.getAttribute("sessionId");
	    if (a != null && a.equals("admin")) {
	    	return "/Product/product-list";
	    } else {
	        return "redirect:../home.do";
	    }
	}
	@RequestMapping("/product/stockpopup.do") 
	public String stockpopup(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		String a = (String) session.getAttribute("sessionId");
	    if (a != null && a.equals("admin")) {
	    	return "/Product/product-stockpopup";
	    } else {
	        return "redirect:../home.do";
	    }
	}
	//주문상세조회
		@RequestMapping("/myPag/OrderListView.do") 
		public String OrderListView(HttpServletRequest request,Model model,@RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
		return "/myPag/OrderListView";
			    }
	//상품등록
	@RequestMapping(value = "/product/add.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String add(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = productService.insertProduct(map);		
		return new Gson().toJson(resultMap);
	}
	//상품  상세 이미지 
	@RequestMapping("/product/insertProductDetailedImg.dox")
    public String insertProductDetailedImg(@RequestParam("file2") MultipartFile multi, @RequestParam("pNo") String pNo, HttpServletRequest request,HttpServletResponse response, Model model)
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
            String path2 = System.getProperty("user.dir"); //현재 작업 디렉토리(Working Directory)의 경로
            System.out.println("Working Directory = " + path2 + "\\src\\webapp\\img");
            if(!multi.isEmpty())
            {
                File file = new File(path2 + "\\src\\main\\webapp\\img", saveFileName);
                multi.transferTo(file);
                
                HashMap<String, Object> map = new HashMap<String, Object>();
                map.put("filename", saveFileName);
                map.put("path", "../img/" + saveFileName);
                map.put("pNo", pNo);
                
                // insert 쿼리 실행
                productService.insertProductDetailedImg(map);
                
                model.addAttribute("filename", multi.getOriginalFilename());
                model.addAttribute("uploadPath", file.getAbsolutePath());
                
                return "redirect:list.do";
            }
        }catch(Exception e) {
            System.out.println(e);
        }
        return "redirect:list.do";
    }
	//상품 이미지 
	@RequestMapping("/product/fileUploadimg.dox")
	public String result(@RequestParam("file1") MultipartFile multi, @RequestParam("pNo") String pNo, HttpServletRequest request,HttpServletResponse response, Model model)
	{
		String url = null;
		String path="c:\\img";
		try {
			
			//String uploadpath = request.getServletContext().getRealPath(path);
			String uploadpath = path;
			String originFilename = multi.getOriginalFilename();
			String extName = originFilename.substring(originFilename.lastIndexOf("."),originFilename.length());
			long size = multi.getSize();
			String saveFileName = genSaveFileName1(extName);
			
			System.out.println("uploadpath : " + uploadpath);
			System.out.println("originFilename : " + originFilename);
			System.out.println("extensionName : " + extName);
			System.out.println("size : " + size);
			System.out.println("saveFileName : " + saveFileName);
			String path2 = System.getProperty("user.dir"); //현재 작업 디렉토리(Working Directory)의 경로
			System.out.println("Working Directory = " + path2 + "\\src\\webapp\\img");
			if(!multi.isEmpty())
			{
				File file = new File(path2 + "\\src\\main\\webapp\\img", saveFileName);
				multi.transferTo(file);
				
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("filename", saveFileName);
				map.put("path", "../img/" + saveFileName);
				map.put("pNo", pNo);
				
				// insert 쿼리 실행
				productService.insertProductImg(map);
				
				model.addAttribute("filename", multi.getOriginalFilename());
				model.addAttribute("uploadPath", file.getAbsolutePath());
				
				return "redirect:list.do";
			}
		}catch(Exception e) {
			System.out.println(e);
		}
		return "redirect:list.do";
	}
	
	  // 현재 시간을 기준으로 파일 이름 생성
    private String genSaveFileName1(String extName) {
        String fileName = "";
        
        Calendar calendar = Calendar.getInstance();
        fileName += calendar.get(Calendar.YEAR);
        fileName += calendar.get(Calendar.MONTH);
        fileName += calendar.get(Calendar.DATE);
        fileName += calendar.get(Calendar.HOUR);
    	fileName += calendar.get(Calendar.MINUTE);
    	fileName += calendar.get(Calendar.SECOND);
    	fileName += "thumb";
        fileName += extName;
        
        return fileName;
    }
    private String genSaveFileName(String extName) {
    	String fileName = "";
    	
    	Calendar calendar = Calendar.getInstance();
    	fileName += calendar.get(Calendar.YEAR);
    	fileName += calendar.get(Calendar.MONTH);
    	fileName += calendar.get(Calendar.DATE);
    	fileName += calendar.get(Calendar.HOUR);
    	fileName += calendar.get(Calendar.MINUTE);
    	fileName += calendar.get(Calendar.SECOND);        
    	fileName += extName;
    	
    	return fileName;
    }
	

	@RequestMapping(value = "/product/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String List(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int startNum = Integer.parseInt(String.valueOf(map.get("startNum")));
		int lastNum = Integer.parseInt(String.valueOf(map.get("lastNum")));
		map.put("startNum", startNum);
		map.put("lastNum", lastNum);
		resultMap = productService.selectProductList(map);
		return new Gson().toJson(resultMap);
	}
	//제품 상세 페이지출력
	@RequestMapping(value = "/product/selectProductInfo.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String info(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Product> info = productService.selectProductInfo(map);
		resultMap.put("info", info);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/product/delete.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String delete(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		productService.deleteProduct(map);
		resultMap.put("message", "success");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/product/produckStockPlus.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String productStockPLUS(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		productService.productStockPLUS(map);
		resultMap.put("message", "success");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/product/search.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String productsearch(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int startNum = Integer.parseInt(String.valueOf(map.get("startNum")));
		int lastNum = Integer.parseInt(String.valueOf(map.get("lastNum")));
		map.put("startNum", startNum);
		map.put("lastNum", lastNum);
		resultMap = productService.searchProductList(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/product/search2.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String productsearch2(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int startNum = Integer.parseInt(String.valueOf(map.get("startNum")));
		int lastNum = Integer.parseInt(String.valueOf(map.get("lastNum")));
		map.put("startNum", startNum);
		map.put("lastNum", lastNum);
		resultMap = productService.searchProductList2(map);
		return new Gson().toJson(resultMap);
	}
	
	
	//마이페이지 찜목록 리스트
	 @RequestMapping(value = "/mypag/selectVProductList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String selectVProductList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Product> list = productService.selectVProductList(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	 
	 @RequestMapping(value = "/product/insertProductPayment.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String insertProductPayment(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			productService.insertProductBuy(map);
			resultMap.put("message", "success");
			return new Gson().toJson(resultMap);
	}
	 
	 @RequestMapping(value = "/product/insertProductPayment2.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String insertProductPayment2(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			productService.insertProductBuy2(map);
			resultMap.put("message", "success");
			return new Gson().toJson(resultMap);
	}
	 //위시리스트 담기
	@RequestMapping(value = "/product/insertWish.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String insertWish(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			productService.insertWish(map);
			return new Gson().toJson(resultMap);
	}
	//상품전체출력
		 @RequestMapping(value = "/home3.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
			@ResponseBody
			public String home3(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
				HashMap<String, Object> resultMap = new HashMap<String, Object>();
				List<Product> list = productService.searchProductNewList(map);
				resultMap.put("list", list);
				return new Gson().toJson(resultMap);
	}
		 //베스트아이템 컨트롤러
			@RequestMapping(value = "/bestItemLoad.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
			@ResponseBody
			public String bestItemLoad(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
				HashMap<String, Object> resultMap = new HashMap<String, Object>();
				List<Product> list = productService.bestItemLoad(map);
				resultMap.put("list", list);
				return new Gson().toJson(resultMap);

			
			}
	//마이페이지 주문내역 상세리스트
		@RequestMapping(value = "/mypag/OrderListView.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String OrderListView(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			List<Product> list = productService.selectOrderpuduct(map);
			resultMap.put("list", list);
			return new Gson().toJson(resultMap);
		}
	//날짜별 주문내역조회	
		@RequestMapping(value = "/mypag/searchOrderCalender.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String searchOrderCalender(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			List<Product> list = productService.selectOrderpuductSearch(map);
			resultMap.put("list", list);
			return new Gson().toJson(resultMap);
}
		//함께상품 출력
		@RequestMapping(value = "/product/together.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
		@ResponseBody
		public String together(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
			HashMap<String, Object> resultMap = new HashMap<String, Object>();
			List<Product> together = productService.together(map);
			resultMap.put("together", together);
			return new Gson().toJson(resultMap);
		}
		
		//상품전체출력
		 @RequestMapping(value = "/product/selectProductStock.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
			@ResponseBody
			public String selectProductStock(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
				HashMap<String, Object> resultMap = new HashMap<String, Object>();
				Product info = productService.selectProductStock(map);
				resultMap.put("info", info);
				return new Gson().toJson(resultMap);
	}
	
	
}
