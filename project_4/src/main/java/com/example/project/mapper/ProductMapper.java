package com.example.project.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.project.model.Delivery;
import com.example.project.model.Product;
import com.example.project.model.Wish;

@Mapper
public interface ProductMapper {
	
	//상품 등록
	int insertProduct(HashMap<String, Object> map);
	
	//상품 리스트
	List<Product>selectProductList(HashMap<String, Object> map);

	List<Product>selectVProductList(HashMap<String, Object> map);
	
	//상품페이징용 갯수
	int selectCnt(HashMap<String, Object> map);
	
	//제품 상세 페이지 조회
	List<Product> selectProductInfo(HashMap<String, Object> map);
	
	//아티스트별 상품 조회 > 어드민 페이지
	List<Product> searchProductList(HashMap<String, Object> map);
	
	//아티스트별 상품 조회 > 어드민 페이지
	List<Product> searchProductList2(HashMap<String, Object> map);
	
	//상품 삭제
	int deleteProduct(HashMap<String, Object> map);
	
	//상품 재고 확인
	Product selectProductStock(HashMap<String, Object> map);
	
	//상품 재고 조정
	int productStockPLUS(HashMap<String, Object> map);
	//상품 이미지등록
	int insertProductImg(HashMap<String, Object> map);
	// 상세 이미지 등록
	int insertProductDetailedImg(HashMap<String, Object> map);
	
	//------- 찜목록 삭제 체크박스 선택 
		int deleteWishProduct(HashMap<String, Object> map);
		
		// 찜목록 상품 출력
		List<Wish> selectWishProdeuct(HashMap<String, Object> map);
		// 단일찜목록 제거
		int deleteSingleProdeuctWish(HashMap<String, Object> map);
		// 찜목록 전체제거
		int deleteAllWish(HashMap<String, Object> map);
		//장바구니 등록 > 이동
		int insertcart(HashMap<String, Object> map);
	//결제시 오더 테이블 등록
	int insertProductBuy(HashMap<String, Object> map);
	//결제시 딜리버리 테이블 등록
	int insertProductBuy2(HashMap<String, Object> map);

//----------------------------------------------------------------------나연 작업 중
	//아티스트별 상품 메인 페이지 구현 
	List<Product> selectProductMain(HashMap<String, Object> map);
	
	//상품별 전체 출력 페이지 구현 
	List<Product> selectProductALL(HashMap<String, Object> map);
	
	//위시리스트 담기
	int insertWish(HashMap<String, Object> map);
	//위시리스트 중복제거
	int searchWish(HashMap<String, Object> map);
	
	//상품전체조회
	List<Product>searchProductNewList(HashMap<String, Object> map);	
	//베스트아이템불러오기
	List<Product>bestItemLoad(HashMap<String, Object> map);	
	//주문상세목록조회
	List<Product> selectOrderpuduct(HashMap<String, Object> map);
	//날짜별 주문내역조회
	List<Product> selectOrderpuductSearch(HashMap<String, Object> map);
	//함께하면좋은상품!
	List<Product> together(HashMap<String, Object> map);
}
