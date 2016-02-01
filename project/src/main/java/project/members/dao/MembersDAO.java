package project.members.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import project.common.dao.AbstractDAO;

@Repository("membersDAO")
public class MembersDAO extends AbstractDAO {

    @SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectMembersList(Map<String, Object> map) throws Exception {
    	return (List<Map<String, Object>>)selectList("members.selectMembersList", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectMemberProfileUpdate(Map<String, Object> map) throws Exception {		
	
		return (Map<String, Object>)selectOne("members.selectMemberProfileUpdate",map);
	}

	public void updateMemberProfile(Map<String, Object> map) throws Exception {
		update("members.updateMemberProfile",map);
		
	}

	public void deleteMemberProfile(Map<String, Object> map) {
		delete("members.deleteMemberProfile",map);
		
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFavoriteList(Map<String, Object> map) {
		return (List<Map<String, Object>>)selectList("members.selectFavoriteList", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectDebateList() {
		return (List<Map<String, Object>>)selectList("members.selectDebateList");
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> note(Map<String, Object> map) throws Exception {
		return (Map<String, Object>)selectOne("members.memo",map);
	}

	// 나의 댓글 조회.
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectReplyList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("members.selectReplyList", map);
	}
	
}
