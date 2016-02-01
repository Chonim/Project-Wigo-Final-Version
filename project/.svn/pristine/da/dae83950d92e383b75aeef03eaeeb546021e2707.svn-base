package project.board.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public interface BoardService {
	 
	Map<String, Object> selectBoardList(Map<String, Object> map) throws Exception;
	
    void insertBoard(Map<String, Object> map, HttpServletRequest request) throws Exception;
    
    Map<String, Object> selectBoardDetail(Map<String, Object> map) throws Exception;
    
    void updateBoard(Map<String, Object> map, HttpServletRequest request) throws Exception;
    
    void deleteBoard(Map<String, Object> map) throws Exception;

	Map<String, Object> categorySearch(Map<String, Object> map) throws Exception;
	
	void insertBoardReply(Map<String, Object> map) throws Exception;
}

