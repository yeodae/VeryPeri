package com.example.project.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.project.model.Order;
import com.example.project.model.Product;

@Mapper
public interface DDDDD {
	
	//사용자 프로필 업데이트
	int updateprofile(HashMap<String, Object> map);
	
}
