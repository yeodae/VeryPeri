package com.example.project.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.project.model.Staff;


@Mapper
public interface StaffMapper {
	
	//직원 로그인
	Staff selectStaff(HashMap<String, Object> map);
	
	//직원 리스트 출력
	List<Staff> selectStaffList (HashMap<String, Object> map);
	
	//직원 추가
	int addStaffInfo (HashMap<String, Object> map);
	
	//수정페이지 직원 조회
	Staff selectStaffInfo(HashMap<String, Object> map);
	
	//직원 수정
	int updateStaff(HashMap<String, Object> map);
	
	//직원 삭제
	int deleteStaff(HashMap<String, Object> map);
	
}
