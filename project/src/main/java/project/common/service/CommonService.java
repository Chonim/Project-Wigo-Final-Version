package project.common.service;

import java.util.Map;

public interface CommonService {
	Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
	
	Map<String, Object> login(Map<String, Object> map) throws Exception;

	void join(Map<String, Object> map) throws Exception;

	Map<String, Object> search(String keyword) throws Exception;

	void addTag(Map<String, Object> map) throws Exception;

	Map<String, Object> searchForAddTag(String keyword) throws Exception;

}