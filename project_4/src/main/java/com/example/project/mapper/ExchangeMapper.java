package com.example.project.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.project.model.DeliveryUser;
import com.example.project.model.Exchange;
import com.example.project.model.Order;

@Mapper
public interface ExchangeMapper {
	
	// 교환/환불 접수 리스트
	List<Exchange> selectExchangeList(HashMap<String, Object> map);
	
	//교환/환불 변경
	int updateExchangeState(HashMap<String, Object> map);
	
	//페이징
	int exchangeSelectCnt(HashMap<String, Object> map);
	
	
}
