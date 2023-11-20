package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import com.example.project.model.Event;
import com.example.project.model.User;
import com.example.project.model.User2;

public interface EventService {
	
	HashMap<String, Object> selectEventList(HashMap<String, Object> map);
	
	int insertEvent(HashMap<String, Object> map);
	
	int updateEvent(HashMap<String, Object> map);
	
	//이벤트 응모내역이 있는지 확인
	HashMap<String, Object> evtApplyYn(HashMap<String, Object> map);
	
	//이벤트 응모
		int evtApply(HashMap<String, Object> map);
}
