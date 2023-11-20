package com.example.project.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.project.model.Order;
import com.example.project.model.Product;

@Mapper
public interface OrderMapper {
	// 구매 상품 갯수 
	List<Order> orderCntselect(HashMap<String, Object> map);
	//구매한 상품 확인 (join)
	List<Order> orderProductSelect(HashMap<String, Object> map);
	// 주문정보 확인
	List<Order> selectOrderList(HashMap<String, Object> map);
	//페이징용 카운트
	int selectCnt3(HashMap<String, Object> map);
	//오더 상태 변경
	int updateOrder(HashMap<String, Object> map);
	//오더 상태 개별 변경
	int updateOrderInfo(HashMap<String, Object> map);
	
	//구매내역 확인
	
	List<Product> selectOrderp(HashMap<String, Object> map);
	// 사용자 장바구니 출력
	List<Product> selectcartlist(HashMap<String, Object> map);
	
	//구매확정으로 업데이트
	int mypageOrderConfirm(HashMap<String, Object> map);
	
	//구매 전 취소
	int mypageOrderCancel(HashMap<String, Object> map);
	
	//배송 완료 후 교환/반품
	// 1. 기존 오더/딜리버리 상태변경
	int mypageOrderchangeUpdate(HashMap<String, Object> map);
	// 2. 교환/반품사유 인서트
	int mypageOrderchangeInsert(HashMap<String, Object> map);
	
	// 유저 포인트 추가 
	int userPointAdd(HashMap<String, Object> map);
	
	// 유저 포인트 테이블에 추가 
	int userPointAdd2(HashMap<String, Object> map);
	
	//비회원 주문 조회
	List<Order> selectNonOrderList(HashMap<String, Object> map);
	//비회원 결제성공 페이지
	List<Order> nonPaymentkkk(HashMap<String, Object> map);
}
