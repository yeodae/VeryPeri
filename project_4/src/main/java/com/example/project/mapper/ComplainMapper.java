package com.example.project.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.project.model.Inquiry;


@Mapper
public interface ComplainMapper {
	
	//미답변 민원 목록 출력
	List<Inquiry> selectComplainList(HashMap<String, Object> map);
	// 페이징용 카운트
	int selectCnt2(HashMap<String, Object> map);
	//민원 여부 등록
	int complainYn(HashMap<String, Object> map);
}
