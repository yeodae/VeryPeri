package com.example.project.dao;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project.mapper.ComplainMapper;


@Service
public class ComplainServiceImpl implements ComplainService{
	
	@Autowired
	ComplainMapper complainMapper;

	@Override
	public HashMap<String, Object> selectComplainList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", complainMapper.selectComplainList(map));
		resultMap.put("cnt", complainMapper.selectCnt2(map));
		return resultMap;
	}

	@Override
	public int complainYn(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return complainMapper.complainYn(map);
	}
}
