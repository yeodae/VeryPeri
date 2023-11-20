package com.example.project.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.project.model.DeliveryUser;
import com.example.project.model.Order;

@Mapper
public interface DeliveryMapper {
	//유저배송주소록 출력
	List<DeliveryUser> selectDeliveryUser(HashMap<String, Object> map);
	//유저배송주소록 수정
	int updateAddr(HashMap<String, Object> map);
	//배송주소록 추가
	int insertAddr(HashMap<String, Object> map);
	//배송주소록 삭제
	int deleteAddr(HashMap<String, Object> map);
	
	// 주문정보 확인
	List<Order> deliveryListSelect(HashMap<String, Object> map);
	//페이징용 카운트
	int selectCnt4(HashMap<String, Object> map);
	
	//주문번호별 배송 현황
	List<Order> deliveryInfoSelect(HashMap<String, Object> map);
	
	//배송완료 상태 변경
	int updateOrder2 (HashMap<String, Object> map);
	//배송완료 상태 변경 개별
	int updateOrderInfo2 (HashMap<String, Object> map);
}
