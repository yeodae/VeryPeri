package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import com.example.project.model.Order;
import com.example.project.model.Product;
import com.example.project.model.Test;

public interface OrderService {
	// 구매 상품 갯수 
	List<Order> orderCntsearch(HashMap<String, Object> map);
	//구매한 상품 확인 (join)
	List<Order> orderProductSearch(HashMap<String, Object> map);
	
	HashMap<String, Object> selectOrderList(HashMap<String, Object> map);
	
	int updateOrder(HashMap<String, Object> map);
	
	//오더 상태 개별 변경
	int updateOrderInfo(HashMap<String, Object> map);
	
	//구매자 상품목록 출력 
	List<Product> searchOrderp(HashMap<String, Object> map);
	
	// 사용자 장바구니 출력 
	List<Product> selectcartlist(HashMap<String, Object> map);
	
	//구매확정으로 업데이트
	int mypageOrderConfirm(HashMap<String, Object> map);
	
	//구매 전 취소
	int mypageOrderCancel(HashMap<String, Object> map);
	
	//배송 완료 후 교환/반품
	int mypageOrderchange(HashMap<String, Object> map);
	
	//비회원 주문내역 조회
	List<Order> selectNonOrderList(HashMap<String, Object> map);
	
	//비회원 주문결제 성공페이지
	List<Order> nonPaymentkkk(HashMap<String, Object> map);
}
