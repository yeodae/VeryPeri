package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project.mapper.StaffMapper;
import com.example.project.model.Staff;


@Service
public class StaffServiceImpl implements StaffService{
	
	@Autowired
	StaffMapper staffMapper;

	@Override
	public HashMap<String, Object> selectStaff(HashMap<String, Object> map) {
	    HashMap<String, Object> resultMap = new HashMap<String, Object>();
	    Staff staff = staffMapper.selectStaff(map);
	    if (staff == null) {
	        resultMap.put("message", "성함 혹은 사번을 확인해주세요.");
	    } else {
	        Integer cnt = staff.getCnt();
	        if(cnt == null || cnt == 0) {
	            resultMap.put("message", "성함 혹은 사번을 확인해주세요.");
	        } else {
	            resultMap.put("success", true);
	            resultMap.put("message", staff.getsName() + "님 환영합니다.");
	            resultMap.put("staff", staff);
	        }
	    }
	    return resultMap;
	}

	@Override
	public List<Staff> selectStaffList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return staffMapper.selectStaffList(map);
	}

	@Override
	public int addStaffInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return staffMapper.addStaffInfo(map);
	}

	@Override
	public Staff selectStaffInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return staffMapper.selectStaffInfo(map);
	}

	@Override
	public int updateStaff(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return staffMapper.updateStaff(map);
	}

	@Override
	public int deleteStaff(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return staffMapper.deleteStaff(map);
	}


}
