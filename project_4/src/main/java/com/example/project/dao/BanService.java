package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import com.example.project.model.User;

public interface BanService {
	int userBan(HashMap<String, Object> map);
	
	int fnUserBanDel(HashMap<String, Object> map);
}
