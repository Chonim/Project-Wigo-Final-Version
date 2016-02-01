package project.chat.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;


@Service("chatService")
public class ChatServiceImpl implements ChatService{
	Logger log = Logger.getLogger(this.getClass());

    @Resource(name="chatDAO")
    private ChatDAO chatDAO;

	public Map<String, Object> selectChatList(Map<String, Object> map) throws Exception {
        return chatDAO.selectChatList(map);
	}
}	