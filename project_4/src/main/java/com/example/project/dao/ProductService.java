package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import com.example.project.model.ABoard;
import com.example.project.model.Delivery;
import com.example.project.model.Product;
import com.example.project.model.Wish;


public interface ProductService {

	HashMap<String, Object> insertProduct(HashMap<String, Object> map);
	
	HashMap<String, Object> selectProductList(HashMap<String, Object> map);
	
	List<Product> selectProductInfo(HashMap<String, Object> map);
//	 상품 페이지 출력
	List<Product>selectVProductList(HashMap<String, Object> map);
	
	int deleteProduct(HashMap<String, Object> map);
	
	int productStockPLUS(HashMap<String, Object> map);
	//상품이미지 등록 
	int insertProductImg(HashMap<String, Object> map);
	// 상세 이미지 등록
	int insertProductDetailedImg(HashMap<String, Object> map);
	
	HashMap<String, Object> searchProductList(HashMap<String, Object> map);
	HashMap<String, Object> searchProductList2(HashMap<String, Object> map);
	
	// 체크박스 찜목록 삭제
	int removeWishProduct(HashMap<String, Object> map);	
	//찜목록 출력
	List<Wish> searchWishProdeuct(HashMap<String, Object> map);
	// 찜목록 단일제거
	int removeSingleProdeuctWish(HashMap<String, Object> map);
	// 찜목록 전체 삭제
	int removeAllWish(HashMap<String, Object> map);
	// 장바구니 등록 > 이동 
	int editcart(HashMap<String, Object> map);
	
	//결제시 오더 테이블 등록
		int insertProductBuy(HashMap<String, Object> map);
		//결제시 딜리버리 테이블 등록
		int insertProductBuy2(HashMap<String, Object> map);

//---------------------------------------------------------------------------------------나연 작업 중		
	//아티스트별 상품 페이지 구현
		HashMap<String, Object> searchProductMain(HashMap<String, Object> map);
	
	//제품별 상품 페이지 구현
		HashMap<String, Object> searchProductALL(HashMap<String, Object> map);
	
	//위시리스트 담기
	int insertWish(HashMap<String, Object> map);
	//상품전체조회
	List<Product>searchProductNewList(HashMap<String, Object> map);	
	
	//베스트아이템조회//
	List<Product>bestItemLoad(HashMap<String, Object> map);	
	
	//주문상세조회
	List<Product> selectOrderpuduct(HashMap<String, Object> map);
	//날짜별 주문내역조회
	List<Product> selectOrderpuductSearch(HashMap<String, Object> map);
	//함께하기 좋은상품!
	List<Product> together(HashMap<String, Object> map);
	
	//재고 확인 조회
	Product selectProductStock(HashMap<String, Object> map);
}
