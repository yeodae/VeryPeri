package com.example.project.dao;

import java.util.HashMap;

public interface ComplainService {

	HashMap<String, Object> selectComplainList(HashMap<String, Object> map);
	
	int complainYn(HashMap<String, Object> map);

}
