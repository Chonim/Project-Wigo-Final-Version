package project.members.controller;



import java.io.File;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import project.common.common.CommandMap;
import project.members.service.MembersService;

@Controller
public class MembersController {
	 Logger log = Logger.getLogger(this.getClass());
     
	    @Resource(name="membersService")
	    private MembersService membersService;
	    
	    //회원정보 조회.
	    @RequestMapping(value="/members/memberProfile.do")
	    public ModelAndView openMembersList(CommandMap commandMap, HttpSession session) throws Exception{
	        ModelAndView mv = new ModelAndView("/members/memberProfile");
	        String id = (String) session.getAttribute("sId");
	        commandMap.put("id", id);
	        
	        //메모
			Map<String, Object> contentsMap = membersService.note(commandMap.getMap());
			if (contentsMap != null) {
				String contents = contentsMap.get("CONTENTS").toString();
				mv.addObject("memo", contents);
			} else {
				mv.addObject("memo", "작성하신 메모가 없습니다.");
			}
	         
	        List<Map<String,Object>> list = membersService.selectMembersList(commandMap.getMap()); // 회원정보 조회
	        List<Map<String,Object>> favoriteList = membersService.selectFavoriteList(commandMap.getMap()); // 즐겨찾기 목록 조회
	        List<Map<String,Object>> mdebateList = membersService.selectDebateList(); // 디베이트 테이블 조회
	        List<Map<String,Object>> reply = membersService.selectReplyList(commandMap.getMap()); // 나의 댓글 조회
	        
	        for (int i = 0; i < favoriteList.size(); i++) {
				int idx = Integer.parseInt(favoriteList.get(i).get("F_INDEX")+"");
				favoriteList.get(i).put("F_TITLE", mdebateList.get(idx-1).get("TITLE")+"");
			}
	        mv.addObject("resultList", favoriteList);
	        mv.addObject("list", list);
	        mv.addObject("reply", reply);
	        return mv;
	    }
	    
	    
	    @RequestMapping(value="/members/testMapArgumentResolver.do")
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
	    
	    
	    //회원정보 수정할 페이지 open.
	    @RequestMapping(value="/members/openMemberProfileUpdate.do")
	    public ModelAndView openMemberProfileUpdate(CommandMap commandMap, HttpSession session) throws Exception{
	        ModelAndView mv = new ModelAndView("/members/memberProfileUpdate");
	        
	        String id = (String) session.getAttribute("sId");
	        commandMap.put("id", id);
				
			//회원정보
	        Map<String,Object> map = membersService.selectMemberProfileUpdate(commandMap.getMap());
	        mv.addObject("map", map);
	        
	        return mv;
	    }
	    
	    //회원정보 수정된 내용 저장.
	    @RequestMapping(value="/members/updateMemberProfile.do")
	    public ModelAndView updateMemberProfile(CommandMap commandMap, @RequestParam("photo") MultipartFile photo) throws Exception{
	        ModelAndView mv = new ModelAndView("redirect:/members/memberProfile.do"); 
   
	        String id = (String) commandMap.get("id");
	        String name = (String) commandMap.get("name");
	        
	        System.out.println("=============================>"+id);
	        System.out.println("=============================>"+name);

            if (photo.isEmpty()) {


		} else {

			String path = "C://dev/workspace/project/src/main/webapp/images/members/";
			String filename = id +".jpg";
			File f = new File(path + filename);
			   try {photo.transferTo(f);}
			   	catch (Exception e) {System.out.println(e.getMessage());}
		}
	        
	        membersService.updateMemberProfile(commandMap.getMap());	        
	        mv.addObject("ID", commandMap.get("ID"));
	        
	        return mv;
	    }
	    
	    //회원정보 삭제.
	    @RequestMapping(value="/members/deleteMemberProfil.do")
	    public ModelAndView deleteMemberProfile(CommandMap commandMap, HttpSession session) throws Exception{
	        ModelAndView mv = new ModelAndView("redirect:/common/logout.do"); 
	        
	        String id = (String) session.getAttribute("sId");
	        commandMap.put("id", id);
	        
	        membersService.deleteMemberProfile(commandMap.getMap());	        
	        
	        return mv;
	    }
	    
	    
	    

	    
	}