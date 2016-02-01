package project.members.service;

import java.util.List;
import java.util.Map;

public interface MembersService {
	
	// 회원 정보 조회.
	List<Map<String, Object>> selectMembersList(Map<String, Object> map) throws Exception;

	Map<String, Object> selectMemberProfileUpdate(Map<String, Object> map) throws Exception;

	void updateMemberProfile(Map<String, Object> map) throws Exception;

	void deleteMemberProfile(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectFavoriteList(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectDebateList() throws Exception;

	Map<String, Object> note(Map<String, Object> map) throws Exception;

	// 나의 댓글 조회.
	List<Map<String, Object>> selectReplyList(Map<String, Object> map) throws Exception;

}
