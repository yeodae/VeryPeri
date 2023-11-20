package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project.mapper.ABoardMapper;
import com.example.project.model.ABoard;


@Service
public class ABoardServiceImpl implements ABoardService{
	
	@Autowired
	ABoardMapper aboardMapper;
	
	@Override
	public HashMap<String, Object> selectABoardList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", aboardMapper.selectABoardList(map));
		resultMap.put("cnt", aboardMapper.selectCnt(map));
		return resultMap;
	}

	@Override
	public HashMap<String, Object> insertABoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		aboardMapper.insertABoard(map);
		resultMap.put("idx", map.get("idx"));
		return resultMap;
	}

	@Override
	public int insertAboardImg(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return aboardMapper.insertAboardImg(map);
	}
	
	@Override
	public ABoard selectABoardInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return aboardMapper.selectABoardInfo(map);
	}

	@Override
	public int updateABoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return aboardMapper.updateABoard(map);
	}

	@Override
	public int deleteABoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		aboardMapper.deleteABoardImg(map);
		return aboardMapper.deleteABoard(map);
	}

	@Override
	public HashMap<String, Object> selectABoardList2(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("hits", aboardMapper.ABoardCnt(map));
		resultMap.put("list",aboardMapper.selectABoardList2(map));
		return resultMap;				
	}

	@Override
	public HashMap<String, Object> selectABoardList3(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", aboardMapper.selectABoardList3(map));
		resultMap.put("cnt", aboardMapper.selectCntAboard(map));
		return resultMap;				
	}

	@Override
	public List<ABoard> selectABoardList4(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return aboardMapper.selectABoardList4(map);
	}

	@Override
	public List<ABoard> selectEventAtistInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return aboardMapper.selectEventAtistInfo(map);
	}


	
}
