package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project.mapper.OrderMapper;
import com.example.project.model.Order;
import com.example.project.model.Product;

@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	OrderMapper orderMapper;
	
	@Override
	public List<Order> orderCntsearch(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return orderMapper.orderCntselect(map);
	}
	

	@Override
	public List<Order> orderProductSearch(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return orderMapper.orderProductSelect(map);
	}


	@Override
	public HashMap<String, Object> selectOrderList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", orderMapper.selectOrderList(map));
		resultMap.put("cnt", orderMapper.selectCnt3(map));
		return resultMap;
	}


	@Override
	public int updateOrder(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return orderMapper.updateOrder(map);
	}


	@Override
	public int updateOrderInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return orderMapper.updateOrderInfo(map);
	}
	
	
	//구매자 상품목록 출력 
	@Override
	public List<Product> searchOrderp(HashMap<String, Object> map) {
	// TODO Auto-generated method stub
	return orderMapper.selectOrderp(map);
	}	
	
	
	
	// 사용자 장바구니 출력 
	@Override
	public List<Product> selectcartlist(HashMap<String, Object> map) {
	// TODO Auto-generated method stub
	return orderMapper.selectcartlist(map);
	}


	//구매확정으로 업데이트
	@Override
	public int mypageOrderConfirm(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		orderMapper.userPointAdd(map);
		orderMapper.userPointAdd2(map);
		return orderMapper.mypageOrderConfirm(map);
	}
	
	//구매 전 취소
	@Override
	public int mypageOrderCancel(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return orderMapper.mypageOrderCancel(map);
	}

	//배송 완료 후 교환/반품
	@Override
	public int mypageOrderchange(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		orderMapper.mypageOrderchangeUpdate(map);
		return orderMapper.mypageOrderchangeInsert(map);
	}


	@Override
	public List<Order> selectNonOrderList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return orderMapper.selectNonOrderList(map);
	}

	//비회원 주문결제 성공페이지
	@Override
	public List<Order> nonPaymentkkk(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return orderMapper.nonPaymentkkk(map);
	}

	
}
