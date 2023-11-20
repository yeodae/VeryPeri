package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project.mapper.BanMapper;
import com.example.project.mapper.User2Mapper;
import com.example.project.model.User;

@Service
public class BanServiceImpl implements BanService{

	@Autowired
	BanMapper banMapper;

	@Override
	public int userBan(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return banMapper.userBan(map);
	}

	@Override
	public int fnUserBanDel(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return banMapper.fnUserBanDel(map);
	}

	
}
