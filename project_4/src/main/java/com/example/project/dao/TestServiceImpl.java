package com.example.project.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project.mapper.TestMapper;
import com.example.project.model.Test;

@Service
public class TestServiceImpl implements TestService{

	@Autowired
	TestMapper testMapper;
	@Override
	public List<Test> searchTest() {
		// TODO Auto-generated method stub
		return testMapper.selectTest();
	}

}
