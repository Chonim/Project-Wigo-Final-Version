package project.chat.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

//import project.chat.service.ChatService;
import project.common.common.CommandMap;
import project.common.service.CommonService;
 
@Controller
public class ChatController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="commonService")
    private CommonService commonService;
	
	@Resource(name="chatService")
    private ChatService chatService;
	
	// 챗방 리스트로
	@RequestMapping(value="/chat/openChat.do")
	public ModelAndView openChat(CommandMap commandMap, HttpServletRequest request) throws Exception{
	    ModelAndView mv = new ModelAndView("/chat/chatList");
	    
	    Map<String,Object> map = chatService.selectChatList(commandMap.getMap());
	    mv.addObject("chatList", map.get("result"));
	    
	    String keyword = request.getParameter("keyword");
	    request.setAttribute("keyword", keyword);
	    return mv;
	}
	
	// 방으로 들어가기
	@RequestMapping(value="/chat/openChatRoom.do")
	public ModelAndView openChatRoom(CommandMap commandMap, HttpSession session, HttpServletRequest request) throws Exception{
	    ModelAndView mv = new ModelAndView("/chat/chatRoom");
	    mv.addObject("title",request.getParameter("title"));
	    mv.addObject("idx", request.getParameter("idx"));
	    
	    return mv;
	}
}

