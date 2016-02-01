package project.video.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import project.common.dao.AbstractDAO;
 
@Repository("VideoDAO")
public class VideoDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectVideoList(Map<String, Object> map) throws Exception{
	    return (Map<String, Object>)selectPagingList("video.selectVideoList", map);
	}

	public void insertVideo(Map<String, Object> map) throws Exception{
	    insert("video.insertVideo", map);
	}

	public void updateHitCnt(Map<String, Object> map) throws Exception{
	    update("video.updateHitCnt", map);
	}
	 
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectVideoDetail(Map<String, Object> map) throws Exception{
	    return (Map<String, Object>) selectOne("video.selectVideoDetail", map);
	}
	
	public void updateVideo(Map<String, Object> map) throws Exception{
	    update("video.updateVideo", map);
	}
	
	public void deleteVideo(Map<String, Object> map) throws Exception{
	    update("video.deleteVideo", map);
	}
	
	public void insertFile(Map<String, Object> map) throws Exception{
	    insert("video.insertFile", map);
	}
	
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectFileList(Map<String, Object> map) throws Exception{
	    return (List<Map<String, Object>>)selectList("video.selectFileList", map);
	}
	
	public void deleteFileList(Map<String, Object> map) throws Exception{
	    update("video.deleteFileList", map);
	}
	 
	public void updateFile(Map<String, Object> map) throws Exception{
	    update("video.updateFile", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> categorySearch(Map<String, Object> map) throws Exception {
	    return (Map<String, Object>)selectPagingList("video.selectVideoList2", map);
	}
}