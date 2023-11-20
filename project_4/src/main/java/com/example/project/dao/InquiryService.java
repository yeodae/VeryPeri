package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import com.example.project.model.Inquiry;


public interface InquiryService {

	HashMap<String, Object>selectInquiryList(HashMap<String, Object> map);
	
	Inquiry selectInquiryInfo(HashMap<String, Object> map);
	
	int updateInquiryAnswer(HashMap<String, Object> map);
	
	//마이페이지 1:1문의내역 출력
	List<Inquiry> searchMypageInquiry(HashMap<String, Object> map);
	
	//마이페이지 1:1문의글 등록
	HashMap<String, Object> myPageAddBoard(HashMap<String, Object> map);
	
	List<Inquiry>searchInquiryList(HashMap<String, Object> map);
	
	//마이페이지 1:1문의 첨부파일등록
	int addBoardImg(HashMap<String, Object> map);
	//1:1문의 페이징
	HashMap<String, Object> selectInquiry(HashMap<String, Object> map);
	
		
}
