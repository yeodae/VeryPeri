package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import com.example.project.model.DeliveryUser;
import com.example.project.model.Order;

public interface DeliveryService {
	// 유저 배송지 출력
	List<DeliveryUser> searchDeliveryUser(HashMap<String, Object> map);
	//유저 배송주소록 수정
	int editAddr(HashMap<String, Object> map);
	//유저 배송주소록 추가
	int addAddr(HashMap<String, Object> map);
	//유저 배송주소록 삭제
	int deleteAddr(HashMap<String, Object> map);
	
	HashMap<String, Object> deliveryListSelect(HashMap<String, Object> map);
	
	//주문번호별 배송 현황
	List<Order> deliveryInfoSelect(HashMap<String, Object> map);
	
	//배송완료 상태 변경
	int updateOrder2 (HashMap<String, Object> map);
	//배송완료 상태 변경 개별
	int updateOrderInfo2 (HashMap<String, Object> map);
}
