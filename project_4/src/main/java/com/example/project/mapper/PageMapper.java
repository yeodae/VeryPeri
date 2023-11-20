package com.example.project.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.project.model.Product;
import com.example.project.model.User;

@Mapper

public interface PageMapper {

//사용자 포인트 /모델파일이름  /sql에서 만든이름
		

			List<User> userPoint(HashMap<String, Object> map);

			
		
}
