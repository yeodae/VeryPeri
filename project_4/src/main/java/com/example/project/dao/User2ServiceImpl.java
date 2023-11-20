package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project.mapper.User2Mapper;
import com.example.project.model.User;
import com.example.project.model.User2;

@Service
public class User2ServiceImpl implements User2Service{

	@Autowired
	User2Mapper user2Mapper;

	@Override
	public HashMap<String, Object> selectUserList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", user2Mapper.selectUserList(map));
		resultMap.put("cnt", user2Mapper.selectCnt(map));
		return resultMap;
	}

	@Override
	public int userCntReset(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return user2Mapper.userCntReset(map);
	}

	@Override
	public HashMap<String, Object> selectUserInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		resultMap.put("Info", user2Mapper.selectUserInfo(map));
		resultMap.put("Inquiry", user2Mapper.user2SelectInquiry(map));
		resultMap.put("Order", user2Mapper.user2SelectOrder(map));
		resultMap.put("Apply", user2Mapper.user2SelectApply(map));
		resultMap.put("Delivery", user2Mapper.user2SelectDelivery(map));
		
		return resultMap; 
	}

	@Override
	public int userPwReset(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return user2Mapper.userPwReset(map);
	}

	@Override
	public int userPointAdd(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return user2Mapper.userPointAdd(map);
	}

	@Override
	public List<User> searchUserList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return user2Mapper.searchUserList(map);
	}
	
}
