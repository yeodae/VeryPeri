package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project.mapper.EventMapper;
import com.example.project.model.Event;

@Service
public class EventServiceImpl implements EventService{

	@Autowired
	EventMapper eventMapper;

	@Override
	public HashMap<String, Object> selectEventList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", eventMapper.selectEventList(map));
		resultMap.put("cnt", eventMapper.selectCnt(map));
		return resultMap;
	}

	@Override
	public int insertEvent(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return eventMapper.insertEvent(map);
	}

	@Override
	public int updateEvent(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return eventMapper.updateEvent(map);
	}

	@Override
	public HashMap<String, Object> evtApplyYn(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("info", eventMapper.evtApplyProduct(map));
		resultMap.put("ynApplyYn", eventMapper.evtApplyYn(map));
		return resultMap;
	}

	@Override
	public int evtApply(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return eventMapper.evtApply(map);
	}

	
}
