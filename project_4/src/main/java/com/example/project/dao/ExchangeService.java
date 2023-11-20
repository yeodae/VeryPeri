package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import com.example.project.model.DeliveryUser;
import com.example.project.model.Exchange;
import com.example.project.model.Order;

public interface ExchangeService {
	// 교환/환불 접수 리스트
	HashMap<String, Object> selectExchangeList(HashMap<String, Object> map);
	
	//교환/환불 변경
	int updateExchangeState(HashMap<String, Object> map);
}
