package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import com.example.project.model.User;
import com.example.project.model.User2;

public interface User2Service {
	HashMap<String, Object> selectUserList(HashMap<String, Object> map);
	
	int userCntReset(HashMap<String, Object> map);
	
	HashMap<String, Object> selectUserInfo(HashMap<String, Object> map);
	
	int userPwReset(HashMap<String, Object> map);
	
	int userPointAdd(HashMap<String, Object> map);
	
	List<User> searchUserList (HashMap<String, Object> map);
}
