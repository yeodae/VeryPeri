package com.example.project.dao;

import java.util.HashMap;
import java.util.List;

import com.example.project.model.DeliveryUser;
import com.example.project.model.GBoard;

public interface GBoardService {
	
	//전체 게시글 출력
	List<GBoard> searchGBoardList(HashMap<String, Object> map);
	
	//전체 아티스트 게시글 출력
	List<GBoard> searchArtistGBoard(HashMap<String, Object> map);
	
	//게시글 등록
	HashMap<String, Object> addGBoard(HashMap<String, Object> map);
	
	//게시글 등록 중 이미지 파일 첨부
	int addGBoardImg(HashMap<String, Object> map);
	
	//게시글 삭제
	int removeGBoard(HashMap<String, Object> map);
	
	//게시글 검색
	List<GBoard> searchGBoardInfo(HashMap<String, Object> map);
	
	
	//댓글 기능
	
	//좋아요 기능
	int likeGBoard(HashMap<String, Object> map);
	
	//GCOMMENTS 댓글 조회 
	List<GBoard> searchComment(HashMap<String, Object> map);
	
	//GCOMMENTS에 댓글 추가
	int addComment(HashMap<String, Object> map);
	
	//GCOMMENTS 댓글 삭제
	int removeComment(HashMap<String, Object> map);
	
	//댓글 좋아요 기능 
	int likeComment(HashMap<String, Object> map);
	
	
	//대댓글
	
	//대댓글 달기 기능
	int addCocomment(HashMap<String, Object> map);
	
	//대댓글 조회 기능
	List<GBoard> searchCocomment(HashMap<String, Object> map);
	
	//대댓글 삭제 기능
	int removeCocomment(HashMap<String, Object> map);
	
	
	
	//신고 기능 구현
	
	//1. 신고 ->  Report 테이블에 추가 + 게시글 테이블에 신고 횟수 증가
	int addReport(HashMap<String, Object> map);
	
	//2. 신고 ->  댓글용 Report 테이블에 추가 + 댓글 테이블에 신고 횟수 증가
	int addGCReport(HashMap<String, Object> map);
	
	
	
	//마이페이지 구현
	//마이페이지 작성글 모두 출력 : 게시글 -> 댓글 -> 대댓글 순
	List<GBoard> searchsMypageGBoard(HashMap<String, Object> map);
	List<GBoard> searchMypageComment(HashMap<String, Object> map);
	List<GBoard> searchMypageCoComment(HashMap<String, Object> map);
	
	//마이페이지 프로필 출력
	List<GBoard> searchProfile(HashMap<String, Object> map);
	
	//멤버쉽 출력
	List<GBoard> searchsMembership(HashMap<String, Object> map);
	
	// 프로필 등록 
	HashMap<String, Object> addProfile(HashMap<String, Object> map);
	
	// 프로필 닉네임 변경 
	int updateProfile(HashMap<String, Object> map);
	
	//프로필 이미지 변경
	int updateProfileImg(HashMap<String, Object> map);
	
	//프로필 이미지 제거
	int removeProfileImg(HashMap<String, Object> map);

//알림 기능 구현
	//서비스 선에서 구현 불가능 또는 귀찮은 것들
	//내 글에 댓글 달린 갯수 
	List<GBoard> searchMyBoadCommentCnt(HashMap<String, Object> map);
	//내 글에 좋아요 달린 갯수
	List<GBoard> searchMyBoardLikeCnt(HashMap<String, Object> map);
	//내 댓글에 대댓글 달린 갯수
	List<GBoard> searchMyCommentCoCommentCnt(HashMap<String, Object> map);
	//내 댓글에 좋아요 달린 갯수
	List<GBoard> searchMyCommentLikeCnt(HashMap<String, Object> map);
	//알림 3개 출력
	HashMap<String, Object> selectAlarm(HashMap<String, Object> map);


}
