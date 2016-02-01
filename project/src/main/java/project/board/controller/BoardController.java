package project.board.controller;

import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import project.board.service.BoardService;
import project.common.common.CommandMap;
 
@Controller
public class BoardController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	// list
	@RequestMapping(value="/board/openBoardList.do")
	public ModelAndView openBoardList(CommandMap commandMap) throws Exception{
	    ModelAndView mv = new ModelAndView("/board/boardList");
	      
	    Map<String,Object> resultMap = boardService.selectBoardList(commandMap.getMap());
	     
	    mv.addObject("paginationInfo", (PaginationInfo)resultMap.get("paginationInfo"));
	    mv.addObject("list", resultMap.get("result"));
	    return mv;
	}
	
	// list
	@RequestMapping(value="/board/categorySearch.do")
	public ModelAndView categorySearch(HttpServletRequest request, CommandMap commandMap) throws Exception{
	    ModelAndView mv = new ModelAndView("/board/boardList");
	    commandMap.put("category", request.getParameter("c"));
	    Map<String,Object> resultMap = boardService.categorySearch(commandMap.getMap());
	     
	    mv.addObject("paginationInfo", (PaginationInfo)resultMap.get("paginationInfo"));
	    mv.addObject("list", resultMap.get("result"));
	     
	    return mv;
	}
	
	// commandMap
	@RequestMapping(value="/board/testMapArgumentResolver.do")
	public ModelAndView testMapArgumentResolver(CommandMap commandMap) throws Exception{
	    ModelAndView mv = new ModelAndView("");
	     
	    if(commandMap.isEmpty() == false){
	        Iterator<Entry<String,Object>> iterator = commandMap.getMap().entrySet().iterator();
	        Entry<String,Object> entry = null;
	        while(iterator.hasNext()){
	            entry = iterator.next();
	            log.debug("key : "+entry.getKey()+", value : "+entry.getValue());
	        }
	    }
	    return mv;
	}
	
	// write view
	@RequestMapping(value="/board/openBoardWrite.do")
	public ModelAndView openBoardWrite(CommandMap commandMap) throws Exception{
	    ModelAndView mv = new ModelAndView("/board/boardWrite");
	     
	    return mv;
	}
	
	// insert
	@RequestMapping(value="/board/insertBoard.do")
	public ModelAndView insertBoard(CommandMap commandMap, HttpServletRequest request, HttpSession session) throws Exception{
	    ModelAndView mv = new ModelAndView("redirect:/board/openBoardList.do");
	    commandMap.put("writer", session.getAttribute("sName"));
	    boardService.insertBoard(commandMap.getMap(), request);
	    return mv;
	}

	// detail view
	@RequestMapping(value="/board/openBoardDetail.do")
	public ModelAndView openBoardDetail(CommandMap commandMap, HttpServletRequest request) throws Exception{
		
		String title = request.getParameter("title");
		String idx = request.getParameter("idx");
		
	    ModelAndView mv = new ModelAndView("/board/boardDetail");
	     
	    Map<String,Object> map = boardService.selectBoardDetail(commandMap.getMap());
	    mv.addObject("map", map.get("map"));
	    mv.addObject("list", map.get("list"));
	    mv.addObject("replyList", map.get("replyList"));
	    
	    return mv;
	}
	
	// update view
	@RequestMapping(value="/board/openBoardUpdate.do")
	public ModelAndView openBoardUpdate(CommandMap commandMap) throws Exception{
	    ModelAndView mv = new ModelAndView("/board/boardUpdate");
	     
	    Map<String,Object> map = boardService.selectBoardDetail(commandMap.getMap());
	    mv.addObject("map", map.get("map"));
	    mv.addObject("list", map.get("list"));
	     
	    return mv;
	}
	 
	// update
	@RequestMapping(value="/board/updateBoard.do")
	public ModelAndView updateBoard(CommandMap commandMap, HttpServletRequest request) throws Exception{
	    ModelAndView mv = new ModelAndView("redirect:/board/openBoardDetail.do");
	     
	    boardService.updateBoard(commandMap.getMap(), request);
	     
	    mv.addObject("IDX", commandMap.get("IDX"));
	    return mv;
	}
	
	// delete
	@RequestMapping(value="/board/deleteBoard.do")
	public ModelAndView deleteBoard(CommandMap commandMap) throws Exception{
	    ModelAndView mv = new ModelAndView("redirect:/board/openBoardList.do");
	     
	    boardService.deleteBoard(commandMap.getMap());
	     
	    return mv;
	}
	
	// insert reply
		@RequestMapping(value="/board/insertBoardReply.do")
		public ModelAndView insertBoardReply(CommandMap commandMap, HttpServletRequest request, HttpSession session) throws Exception{
		    ModelAndView mv = new ModelAndView("redirect:/board/openBoardDetail.do?IDX="+request.getParameter("PARENT_IDX"));
		    commandMap.put("writer", session.getAttribute("sName"));
		    commandMap.put("sId", session.getAttribute("sId"));
		    boardService.insertBoardReply(commandMap.getMap());
		    return mv;
		}
}