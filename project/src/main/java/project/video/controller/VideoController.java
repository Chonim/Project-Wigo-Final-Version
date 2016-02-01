package project.video.controller;

import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import project.video.service.VideoService;
import project.common.common.CommandMap;
 
@Controller
public class VideoController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="videoService")
	private VideoService videoService;
	
	// list
	@RequestMapping(value="/video/openVideoList.do")
	public ModelAndView openVideoList(CommandMap commandMap) throws Exception{
	    ModelAndView mv = new ModelAndView("/video/videoList");
	      
	    Map<String,Object> resultMap = videoService.selectVideoList(commandMap.getMap());
	     
	    mv.addObject("paginationInfo", (PaginationInfo)resultMap.get("paginationInfo"));
	    mv.addObject("videoList", resultMap.get("result"));
	     
	    return mv;
	}
	
	// list
	@RequestMapping(value="/video/categorySearch.do")
	public ModelAndView categorySearch(HttpServletRequest request, CommandMap commandMap) throws Exception{
	    ModelAndView mv = new ModelAndView("/video/videoList");
	    commandMap.put("category", request.getParameter("c"));
	    Map<String,Object> resultMap = videoService.categorySearch(commandMap.getMap());
	     
	    mv.addObject("paginationInfo", (PaginationInfo)resultMap.get("paginationInfo"));
	    mv.addObject("videoList", resultMap.get("result"));
	     
	    return mv;
	}
	
	// commandMap
	@RequestMapping(value="/video/testMapArgumentResolver.do")
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
	@RequestMapping(value="/video/openVideoWrite.do")
	public ModelAndView openVideoWrite(CommandMap commandMap) throws Exception{
	    ModelAndView mv = new ModelAndView("/video/videoWrite");
	     
	    return mv;
	}
	
	// insert
	@RequestMapping(value="/video/insertVideo.do")
	public ModelAndView insertVideo(CommandMap commandMap, HttpServletRequest request) throws Exception{
	    ModelAndView mv = new ModelAndView("redirect:/video/openVideoList.do");
	     
	    videoService.insertVideo(commandMap.getMap(), request);
	     
	    return mv;
	}

	// detail view
	@RequestMapping(value="/video/openVideoDetail.do")
	public ModelAndView openVideoDetail(CommandMap commandMap) throws Exception{
	    ModelAndView mv = new ModelAndView("/video/videoList");
	     
	    Map<String,Object> map = videoService.selectVideoDetail(commandMap.getMap());
	    mv.addObject("map", map.get("map"));
	    mv.addObject("videoList", map.get("videoList"));
	     
	    return mv;
	}
	
	// update view
	@RequestMapping(value="/video/openVideoUpdate.do")
	public ModelAndView openVideoUpdate(CommandMap commandMap) throws Exception{
	    ModelAndView mv = new ModelAndView("/video/videoUpdate");
	     
	    Map<String,Object> map = videoService.selectVideoDetail(commandMap.getMap());
	    mv.addObject("map", map.get("map"));
	    mv.addObject("list", map.get("list"));
	     
	    return mv;
	}
	 
	// update
	@RequestMapping(value="/video/updateVideo.do")
	public ModelAndView updateVideo(CommandMap commandMap, HttpServletRequest request) throws Exception{
	    ModelAndView mv = new ModelAndView("redirect:/video/openVideoDetail.do");
	     
	    videoService.updateVideo(commandMap.getMap(), request);
	     
	    mv.addObject("IDX", commandMap.get("IDX"));
	    return mv;
	}
	
	// delete
	@RequestMapping(value="/video/deleteVideo.do")
	public ModelAndView deleteVideo(CommandMap commandMap) throws Exception{
	    ModelAndView mv = new ModelAndView("redirect:/video/openVideoList.do");
	     
	    videoService.deleteVideo(commandMap.getMap());
	     
	    return mv;
	}
}