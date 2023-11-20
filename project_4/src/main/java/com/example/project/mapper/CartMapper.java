package com.example.project.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.project.model.Cart;

@Mapper
public interface CartMapper {
	
	//장바구니 전체 상품 리스트 출력
	List<Cart>  selectCartListAll(HashMap<String, Object> map);
	
	//장바구니 페이지에서 상품 수량 변경 
	int cartPageUpdateCnt(HashMap<String, Object> map);
	
	// 장바구니에 상품 추가
	int insertCart(HashMap<String, Object> map);
	
	// 장바구니에서 상품 삭제
	int deleteCart(HashMap<String, Object> map);
	
	//상품에 수량 추가
	int updateCnt(HashMap<String, Object> map);
	
	//장바구니 목록에 같은 상품 있는지 확인
	Cart selectCartList(HashMap<String, Object> map);
	
}