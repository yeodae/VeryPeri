package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import com.example.project.model.Staff;


public interface StaffService {
	
	HashMap<String, Object> selectStaff(HashMap<String, Object> map);
	
	List<Staff> selectStaffList(HashMap<String, Object> map);
	
	int addStaffInfo(HashMap<String, Object> map);
	
	Staff selectStaffInfo(HashMap<String, Object> map);
	
	int updateStaff(HashMap<String, Object> map);
	
	int deleteStaff(HashMap<String, Object> map);
	
}
