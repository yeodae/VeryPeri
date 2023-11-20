package com.example.project.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.project.model.ABoard;


@Mapper
public interface ABoardMapper {
	
	//공지 리스트 출력(페이징용)
	List<ABoard> selectABoardList (HashMap<String, Object> map);
	
	//공지 리스트 출력
	List<ABoard> selectABoardList2 (HashMap<String, Object> map);
	
	//공지만 출력
	List<ABoard> selectABoardList3 (HashMap<String, Object> map);
	
	//이벤트만 출력
	List<ABoard> selectABoardList4 (HashMap<String, Object> map);
	
	// 페이징용 카운트
	int selectCnt(HashMap<String, Object> map);
	
	// 페이징용 카운트2
	int selectCntAboard(HashMap<String, Object> map);
	
	//공지 등록
	int insertABoard(HashMap<String, Object> map);
	
	//공지 첨부파일
	int insertAboardImg(HashMap<String, Object> map);
	
	//공지 상세 보기
	ABoard selectABoardInfo(HashMap<String, Object> map);
	
	//게시글 수정
	int updateABoard(HashMap<String, Object> map);
	
	//게시글 삭제
	int deleteABoard(HashMap<String, Object> map);
	
	//첨부파일 삭제
	int deleteABoardImg(HashMap<String, Object> map);
	
	//공지사항 조회수증가
	int ABoardCnt(HashMap<String, Object> map);
	
	//이벤트 아티스트별 인포 리스트
	List<ABoard> selectEventAtistInfo(HashMap<String, Object> map);
}
