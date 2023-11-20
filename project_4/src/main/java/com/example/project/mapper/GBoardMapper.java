	package com.example.project.mapper;
	import java.util.HashMap;
	import java.util.List;
	import org.apache.ibatis.annotations.Mapper;
import com.example.project.model.DeliveryUser;
import com.example.project.model.GBoard;
	
	@Mapper
	public interface GBoardMapper {
		
		//테스트!!!!!!!!!!
		List<DeliveryUser> DDDDD(HashMap<String, Object> map);
		
		//게시글 전체 출력
		List<GBoard> selectGBoardList(HashMap<String, Object> map);
		
		//아티스트 게시글만 출력
		List<GBoard> selectArtistGBoard(HashMap<String, Object> map);
		
		//게시글 등록
		int insertGBoard(HashMap<String, Object> map);
		//게시글 등록 시 이미지 첨부 
		int insertGBoardImg(HashMap<String, Object> map);
		
		//게시글 삭제
		int deleteGBoard(HashMap<String, Object> map);
		
		//게시글 삭제 시 이미지도 삭제
		int deleteGBoardImg(HashMap<String, Object> map);
		
		//게시글 검색 
		List<GBoard> selectGBoardInfo(HashMap<String, Object> map);
		
		//GBoard에 gLike +1 
		int plusLikeGBoard(HashMap<String, Object> map);
		
		//GBoard에 gLike -1 
		int minusLikeGBoard(HashMap<String, Object> map);
		
		//GBoard_Like에 좋아요 +1 기능
		int plusLike(HashMap<String, Object> map);
		
		//GBoard_Like에 좋아요 -1 기능
		int minusLike(HashMap<String, Object> map);
		
		//GBoard_Like에 좋아요 눌렀는지 아닌지 체크 
		int checkLike(HashMap<String, Object> map);
		
		//GCOMMENTS 댓글 조회 
		List<GBoard> selectComment(HashMap<String, Object> map);
		
		//GCOMMENTS에 댓글 추가
		int insertComment(HashMap<String, Object> map);
		
		//GCOMMENTS 댓글 삭제
		int deleteComment(HashMap<String, Object> map);
		
		//좋아요 기능 구현
		
		//T4_GCOMMENTS 좋아요 +1 or 좋아요 -1
		int plusLikeComment(HashMap<String, Object> map);
		int minusLikeComment(HashMap<String, Object> map);
		
		//T4_GCOMMENTS_LIKE 좋아요 +1 or 좋아요 -1
		int plusLikeComment2(HashMap<String, Object> map);
		int minusLikeComment2(HashMap<String, Object> map);
		
		//	//T4_GCOMMENTS_LIKE 좋아요 눌렀는지 아닌지 체크
		int checkLikeComment(HashMap<String, Object> map);
		
		//GCOMMENTS 에 대댓글 추가 기능 구현
		int insertCocomment(HashMap<String, Object> map);
		
		//GCOMMENTS 대댓글 조회 기능
		List<GBoard> selectCocomment(HashMap<String, Object> map);
		
		//GCOMMENTS 대댓글 삭제 기능 
		int deleteCocomment(HashMap<String, Object> map);
		
		//신고 기능 구현 
		//게시글 신고 테이블 전체 출력
		List<GBoard> selectReportBoard(HashMap<String, Object> map);
		//댓글 신고 테이블 전체 출력
		List<GBoard> selectReportComm(HashMap<String, Object> map);
		
		//1. Report 테이블에 신고 추가
		int insertReport(HashMap<String, Object> map);
		//2. Gboard에 신고 횟수 추가 
		int reportCnt(HashMap<String, Object> map);
		
		//1.댓글용 Report 테이블에 신고 추가
		int insertGCReport(HashMap<String, Object> map);
		//2. GComments 테이블 신고 횟수 추가
		int gcBanCnt(HashMap<String, Object> map);
		
		//마이페이지 구현
		
		//마이페이지 작성글 모두 출력 : 게시글 -> 댓글 -> 대댓글 순
		List<GBoard> selectMypageGBoard(HashMap<String, Object> map);
		List<GBoard> selectMypageComment(HashMap<String, Object> map);
		List<GBoard> selectMypageCoComment(HashMap<String, Object> map);
		
		//마이페이지 프로필 출력
		List<GBoard> selectProfile(HashMap<String, Object> map);
		
		//마이페이지 멤버쉽 구독 정보 출력
		List<GBoard> selectMembership(HashMap<String, Object> map);
		
		//프로필 등록
		int insertProfile(HashMap<String, Object> map);
		
		//마이페이지 프로필 닉네임 변경
		int  updateProfile(HashMap<String, Object> map);
		//마이페이지 프로필 이미지 등록
		int  updateProfileImg(HashMap<String, Object> map);
		
		//마이페이지 프로필 이미지 제거
		int deleteProfileImg(HashMap<String, Object> map);
		
//알림 기능 구현
		
		//게시글 알람 추가 기능
		int insertAlarm(HashMap<String, Object> map);
		
		//댓글 알람 추가 기능
		int insertCommentAlarm(HashMap<String, Object> map);
		
		//게시글알람 업데이트 기능 - 읽음 여부 Y
		int updateAleramRead(HashMap<String, Object> map);
		
		//댓글 알람 업데이트 기능 - 읽음 여부 Y
		int updateCommentAleramRead(HashMap<String, Object> map);
				
		
		//해당 유저가 아티스트인지 체크
		int selectArtistCheck(HashMap<String, Object> map);
		
		//서비스딴 사용 : 게시글 알람 전체 출력
		List<GBoard> selectMyBoadAlarmList(HashMap<String, Object> map);
		
		//서비스 사용 : 댓글 알람 전체 출력
		List<GBoard> selectMyCommentAlarmList(HashMap<String, Object> map);
		
		//출력용 
		//내 글에 댓글 달린 갯수 + 아이디 
		List<GBoard> selectMyBoadCommentList(HashMap<String, Object> map);
	    //내 글에 좋아요 달린 갯수 + 아이디 
		List<GBoard> selectMyBoardLikeList(HashMap<String, Object> map);
	    //내 댓글에 대댓글 달린 갯수 + 아이디 
		List<GBoard> selectMyCommentCoCommentList(HashMap<String, Object> map);
	    //내 댓글에 좋아요 달린 갯수 + 아이디 
		List<GBoard> selectMyCommentLikeList(HashMap<String, Object> map);
		
		//서비스 추가용
		//내 글에 댓글 달린 갯수만
		int selectMyBoadCommentCnt(HashMap<String, Object> map);
	    //내 글에 좋아요 달린 갯수만
		int selectMyBoardLikeCnt(HashMap<String, Object> map);
	    //내 댓글에 대댓글 달린 갯수만
		int selectMyCommentCoCommentCnt(HashMap<String, Object> map);
	    //내 댓글에 좋아요 달린 갯수만
		int selectMyCommentLikeCnt(HashMap<String, Object> map);
		
		//게시글 알림 1개 출력
		List<GBoard> selectAlarm(HashMap<String, Object> map);
		//댓글 알림 1개 출력
		List<GBoard> selectAlarm2(HashMap<String, Object> map);
		
		//아티스트 게시글, 댓글 관련 알람 1개
		List<GBoard> selectAlarm3(HashMap<String, Object> map);
		//아티스트 대댓글 관련 알람 1개
		List<GBoard> selectAlarm4(HashMap<String, Object> map);
	}
