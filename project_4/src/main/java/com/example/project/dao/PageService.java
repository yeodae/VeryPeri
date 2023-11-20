package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import com.example.project.model.Product;
import com.example.project.model.User;

public interface PageService {
	/* 맵퍼에 있는거 가져오기 */
	List<User> userPoint(HashMap<String, Object> map);
	
}
