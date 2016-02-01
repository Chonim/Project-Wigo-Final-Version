package project.chat.controller;

import java.util.Map;

import org.springframework.stereotype.Repository;

import project.common.dao.AbstractDAO;

@Repository("chatDAO")
public class ChatDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public Map<String, Object> selectChatList(Map<String, Object> map) throws Exception {
		return search("selectChatList", map);
	}
}