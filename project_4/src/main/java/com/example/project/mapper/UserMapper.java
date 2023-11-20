package com.example.project.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.project.model.User;

@Mapper
public interface UserMapper {
	//회원가입
	int insertUser(HashMap<String, Object> map);
	//로그인
	User selectUser(HashMap<String, Object> map);
	//로그인실패시 카운팅
	int updateUserCnt(HashMap<String, Object> map);
	//로그인성공시 CNT초기화
	int resetUserCnt(HashMap<String, Object> map);
	//로그인시 유저아이디체크
	User userCheckId(HashMap<String, Object> map);
	//유저 아이디 찾기
	User findUserId(HashMap<String, Object> map);
	//회원가입 아이디 중복체크
	int userCnt(HashMap<String, Object> map);
	//유저id 핸드폰번호로 검색
	User selectUserId(HashMap<String, Object> map);
	//유저 비밀번호 찾기
	User findUserPw(HashMap<String, Object> map);
	//유저pw 아이디로 검색
	User selectUserPw(HashMap<String, Object> map);
	//비회원 주문조회
	User selectNonOrder(HashMap<String, Object> map);
	//비회원 주문 주문번호로 검색
	List<User> selectNonOrderNo(HashMap<String, Object> map);
	//회원정보 수정
	int infoUpdate(HashMap<String, Object> map);
	//회원탈퇴
	int deleteUser(HashMap<String, Object> map);
	//주문내역 페이징
	List<User> selectOrderListPage(HashMap<String, Object> map);
	//전체갯수
	int selectOrderListPageCnt(HashMap<String, Object> map);
	//고객별 주문내역페이지
	int selectOrderListPageCnt2(HashMap<String, Object> map);
	// 주소목록 전체삭제
	int addrAllDelete(HashMap<String, Object> map);
	
	
}
