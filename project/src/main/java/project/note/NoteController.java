package project.note;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import project.common.common.CommandMap;
import project.common.service.CommonService;

@Controller
public class NoteController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="commonService")
    private CommonService commonService;
	
	@Resource(name="noteService")
	private NoteService noteService;
	
	@RequestMapping(value="/note/openNote.do")
	public void openNote(CommandMap map, HttpServletResponse response, HttpSession session) throws Exception{
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String id = (String) session.getAttribute("sId");
		map.put("id", id);

		Map<String, Object> contentsMap = noteService.selectNote(map.getMap());
		// System.out.println(contentsMap.toString());
		
		String contents = contentsMap.get("CONTENTS").toString();
		System.out.println(contents);
		response.getWriter().print(contents);
	}
	
	@RequestMapping(value="/note/updateNote.do")
	public void updateNote(HttpSession session, HttpServletRequest request, CommandMap map) throws Exception {
		
		String id = (String) session.getAttribute("sId");
		String contents = request.getParameter("memoContents");
		
		map.put("id", id);
		map.put("contents", contents);
		
		noteService.updateNote(map.getMap());
	}
	
}
