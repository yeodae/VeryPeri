package com.example.project.mapper;

import java.util.HashMap;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface BanMapper {
	//회원 정지
	int userBan(HashMap<String, Object> map);
	
	//회원 정지 해제
	int fnUserBanDel(HashMap<String, Object> map);
}
