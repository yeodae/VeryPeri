package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project.mapper.CartMapper;
import com.example.project.model.Cart;
import com.example.project.model.Wish;

@Service
public class CartServiceImpl implements CartService{

	@Autowired
	CartMapper cartMapper;
	
	//장바구니 전체 목록 출력
	@Override
	public List<Cart> searchCartListAll(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return cartMapper.selectCartListAll(map);
	}
	
	//장바구니 페이지에서 수량 자체 변경
	@Override
	public int cartPageChangeCnt(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return cartMapper.cartPageUpdateCnt(map);
	}

	//장바구니에서 상품 삭제
	@Override
	public int removeCart(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return cartMapper.deleteCart(map);
	}
	
	
	//장바구니 동일 제품 들어가있는지 확인 후 추가
	@Override
	public HashMap<String, Object> searchCartProduct(HashMap<String, Object> map) {
	    HashMap<String, Object> resultMap = new HashMap<String, Object>();

	    Cart existingCartItem = cartMapper.selectCartList(map);

	    if (existingCartItem != null) {
	        int pLimit = existingCartItem.getpLimit();
	        int cnt = existingCartItem.getCnt();

	        if (cnt > pLimit) {
	            cnt = pLimit;
	            map.put("quantity", cnt);
	            cartMapper.updateCnt(map);
	            resultMap.put("message", "수량 추가 성공");
	        } else {
	            cartMapper.updateCnt(map);
	            resultMap.put("message", "수량 추가 성공");
	        }
	    } else {
	        // 장바구니에 없는 경우 새로운 상품을 등록
	        cartMapper.insertCart(map);
	        resultMap.put("message", "장바구니 등록 완료");
	    }

	    return resultMap;
	}




	

}
