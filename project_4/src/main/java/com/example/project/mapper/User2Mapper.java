package com.example.project.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.project.model.Apply;
import com.example.project.model.DeliveryUser;
import com.example.project.model.Inquiry;
import com.example.project.model.Order;
import com.example.project.model.User;
import com.example.project.model.User2;

@Mapper
public interface User2Mapper {
	//회원 조회
	List<User> selectUserList(HashMap<String, Object> map);
	
	// 페이징용 카운트
	int selectCnt(HashMap<String, Object> map);
	
	//비밀번호 오류횟수 초기화
	int userCntReset(HashMap<String, Object> map);
	
	//회원 상세 보기
	User selectUserInfo(HashMap<String, Object> map);
	
	//비밀번호 초기화
	int userPwReset(HashMap<String, Object> map);
	
	//회원 포인트 수정
	int userPointAdd(HashMap<String, Object> map);
	
	//회원 문의내역 조회
	List<Inquiry> user2SelectInquiry (HashMap<String, Object> map);
	
	//회원 주문내역 조회
	List<Order> user2SelectOrder (HashMap<String, Object> map);
	
	//회원 응모내역 조회
	List<Apply> user2SelectApply (HashMap<String, Object> map);
	
	//회원 배송정보 조회
	List<DeliveryUser> user2SelectDelivery (HashMap<String, Object> map);
	
	//회원 아이디로 검색
	List<User> searchUserList (HashMap<String, Object> map);
}
