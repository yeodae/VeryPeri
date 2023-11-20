package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project.mapper.DDDDD;
import com.example.project.model.Product;


@Service
public class Ddd implements dd{
	
	@Autowired
	DDDDD ddd;

	//사용자 프로필 업데이트
	@Override
	public int updateprofile(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return ddd.updateprofile(map);
	}
}
