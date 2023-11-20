package com.example.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.project.model.Test;

@Mapper
public interface TestMapper {
	List<Test> selectTest();
}
