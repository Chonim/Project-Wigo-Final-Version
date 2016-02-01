package project.video.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface VideoService {
	 
	Map<String, Object> selectVideoList(Map<String, Object> map) throws Exception;
	
    void insertVideo(Map<String, Object> map, HttpServletRequest request) throws Exception;
    
    Map<String, Object> selectVideoDetail(Map<String, Object> map) throws Exception;
    
    void updateVideo(Map<String, Object> map, HttpServletRequest request) throws Exception;
    
    void deleteVideo(Map<String, Object> map) throws Exception;

	Map<String, Object> categorySearch(Map<String, Object> map) throws Exception;
}

