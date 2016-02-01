package project.common.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("commonDAO")
public class CommonDAO extends AbstractDAO{
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception{
	    return (Map<String, Object>)selectOne("common.selectFileInfo", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> login(Map<String, Object> map) throws Exception{
	    return (Map<String, Object>)selectOne("common.login", map);
	}

	public void join(Map<String, Object> map) throws Exception{
		insert("common.join", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> search(String keyword) throws Exception{
	    return (Map<String, Object>)search("common.search", keyword);
	}

	public void addTag(Map<String, Object> map) {
		update("common.addTag", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> searchForAddTag(String keyword) throws Exception {
	    return (Map<String, Object>)selectOne("common.searchForAddTag", keyword);
	}
}