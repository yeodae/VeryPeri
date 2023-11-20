package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.project.mapper.UserMapper;
import com.example.project.model.User;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserMapper userMapper;

	@Override
	public int addUser(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.insertUser(map);
	
	}
	
	@Override
	public HashMap<String, Object> userLogin(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		User user = userMapper.selectUser(map);
		if(user != null) {
			if("Y".equals(user.getbYn()) || user.getbYn()!= null){
				resultMap.put("success", false);
				resultMap.put("message", "정지사유 : "+user.getbReasons());
				return resultMap;
			}
			else if(user.getuCnt() >= 5) {
				resultMap.put("success", false);
				resultMap.put("message", "5회 이상 실패, 관리자에게 문의하세요.");
			}
			else {
				userMapper.resetUserCnt(map);
				resultMap.put("success", true);
				resultMap.put("message", user.getuName() + "님 환영합니다!");
				resultMap.put("user", user);
			}
		} else {
			resultMap.put("success", false);
			User tempUser = userMapper.userCheckId(map) ;			
			if(tempUser != null) {
				userMapper.updateUserCnt(map);
				int cnt = tempUser.getuCnt() + 1;
				String message = cnt + "번 실패! \n패스워드를 확인해주세요.";
				if(cnt >= 5) {
					message = "5회 이상 실패, 관리자에게 문의하세요.";
				}
				resultMap.put("message", message);
			} else {
				resultMap.put("message", "존재하지않는 아이디입니다.");
			}
		}
		
		return resultMap;
	}

	@Override
	public User searchUserId(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.findUserId(map);
	}

	@Override
	public int searchUserCnt(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.userCnt(map);
	}

	@Override//유저 핸드폰번호로 검색
	public User viewUserId(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.selectUserId(map);
	}

	@Override
	public User searchUserPw(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.findUserPw(map);
	}

	@Override
	public User viewUserPw(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.selectUserPw(map);
	}

	@Override
	public User searchNonOrder(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.selectNonOrder(map);
	}
	
	@Override
	public List<User> searchNonOrderNo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		System.out.println(map.get("oNo"));
		return userMapper.selectNonOrderNo(map);
	}

	@Override
	public int editInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.infoUpdate(map);
	}

	@Override
	public int removeUser(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.deleteUser(map);
	}

	@Override
	public HashMap<String, Object> selectOrderListPage(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", userMapper.selectOrderListPage(map));
		resultMap.put("cnt", userMapper.selectOrderListPageCnt2(map));
		return resultMap;
	}
	// 주소 전체 제거
	@Override
	public int addrAllDelete(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.addrAllDelete(map);
	}
	
}
