package project.debate;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import project.common.common.CommandMap;
import project.mongo.DebateReply;
import project.mongo.SpringMongoConfig;

@Controller
public class DebateController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="debateService")
	private DebateService debateService;
	
	// 리스트 조회
	@RequestMapping(value="/debate/openDebateList.do")
	public ModelAndView openDebatelist(HttpServletRequest request, CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/debate/debateList");
		
		String option = request.getParameter("hFilter");
		String currentPageNo = request.getParameter("currentPageNo");
		
		if (option != null && !option.isEmpty()){
			switch (option) {
			case "1": option = "전체"; break;
			case "2": option = "교육"; break;
			case "3": option = "사회"; break;
			case "4": option = "문화"; break;
			case "5": option = "정책"; break;
			default:
				break;
			}
		} else {
			option = "전체";
		}
		commandMap.put("option", option);
		commandMap.put("currentPageNo", currentPageNo);
		
		Map<String,Object> map = debateService.selectDebateList(commandMap.getMap());
	    mv.addObject("paginationInfo", (PaginationInfo)map.get("paginationInfo"));
		mv.addObject("list",map.get("result"));

		//카테고리 개수 계산
		option = "카테고리";
		commandMap.put("option", option);
		Map<String,Object> map2 = debateService.selectDebateList(commandMap.getMap());
		@SuppressWarnings("unchecked")
		List<Map<String,Object>> list = (List<Map<String, Object>>) map2.get("result");

		int a=list.size(), b=0, c=0, d=0, e=0; //a=전체, b=교육, c=사회, d=문화, e=정책
		
		for (int i=0; i<list.size(); i++) {
			String test = (String) list.get(i).get("CTG");
			switch (test) {
				case "교육": b += 1;	break;
				case "사회": c += 1;	break;
				case "문화": d += 1;	break;
				case "정책": e += 1;	break;
			default:
				break;
			}
		} int[] count = {a, b, c, d, e};
		mv.addObject("count", count);
		mv.addObject("hFilter",request.getParameter("hFilter"));
		return mv;
	}

		// detail view
		@RequestMapping(value="/debate/openDebateDetail.do")
		public ModelAndView detail(HttpSession session, HttpServletRequest request, CommandMap commandMap) throws Exception {
			ModelAndView mv = new ModelAndView("/debate/debateDetail");
			
			// request
			String idx = request.getParameter("idx");
			String opinion = request.getParameter("opinion");
	    	String user = (String) session.getAttribute("sId");
	    	int age =  Integer.parseInt(session.getAttribute("sAge")+"");
	    	String sex = (String) session.getAttribute("sSex");
	    	// map put
		    commandMap.put("opinion", opinion);
		    commandMap.put("user", user);
		    commandMap.put("idx", idx);
		    String sage = "";
		    if(age<20){
		    	sage = "ETC";
		    }else if(age<30){
		    	sage = "TWENTY";
		    }else if(age<40){
		    	sage = "THIRTY";
		    }else if(age<50){
		    	sage = "FORTY";
		    }else if(age<60){
		    	sage = "FIFTY";
		    }else{
		    	sage = "ETC";
		    }
		    
		    if(sex.equals("남")){
		    	sex = "MALE";
		    }else{
		    	sex = "FEMALE";
		    }
		
		    // 댓글
		    Map<String,Object> map3 = debateService.debateReply(commandMap.getMap());
			mv.addObject("paginationInfo", (PaginationInfo)map3.get("paginationInfo"));
			mv.addObject("list",map3.get("result"));
			
			// 디테일조회
			Map<String,Object> map = debateService.selectDebateDetail(commandMap.getMap());
			Map<String,Object> map2 = debateService.selectMyDebate(commandMap.getMap());
			Map<String, Object> map4 = new HashMap<>();
			
			// mv insert
			if(null != map2 && !map2.isEmpty()) {
				mv.addObject("me",map2);
			} else {
				   if(null != opinion) {
				    	debateService.myOpinion(commandMap.getMap());
				    	
				    	sage = sage + "_"+opinion;
				    	sex = sex + "_"+opinion;
				    	commandMap.put("age", sage);
						commandMap.put("sex", sex);
						debateService.updateDebateCount(commandMap.getMap());
						
						map4.put("OP", opinion);
						mv.addObject("me",map4);
				    }else{
						map4.put("OP", "N");
						mv.addObject("me",map4);
				    }
			}
			mv.addObject("map",map);
			return mv;
		}
		
		// random view
		@RequestMapping(value="/debate/openRandomDebateDetail.do")
		public ModelAndView randomView(HttpSession session, HttpServletRequest request, CommandMap commandMap) throws Exception {
			ModelAndView mv = new ModelAndView("/debate/debateDetail");

			// request
			Map<String, Object> totalDebatesMap = debateService.selectDebateList(commandMap.getMap());
			@SuppressWarnings("unchecked")
			List<Map<String, Object>> totalDebatesList = (List<Map<String, Object>>) totalDebatesMap.get("result");
			int totalDebates = totalDebatesList.size();
			System.out.println("갯수: " + totalDebates);
			// 안 먹히므로 무시...

			// 랜덤으로 선택해서 들어가기
			String randomIdx = Double.toString((int) (Math.random() * 80) + 1); 
			String idx = randomIdx.substring(0, randomIdx.length()-2);
			System.out.println("선택된 IDX: " + idx);

			// request
			String opinion = request.getParameter("opinion");
	    	String user = (String) session.getAttribute("sId");
	    	// map put
		    commandMap.put("opinion", opinion);
		    commandMap.put("user", user);
		    commandMap.put("idx", idx);
		
		    // 댓글
		    Map<String,Object> map3 = debateService.debateReply(commandMap.getMap());
			mv.addObject("paginationInfo", (PaginationInfo)map3.get("paginationInfo"));
			mv.addObject("list",map3.get("result"));
			// 디테일조회
			Map<String,Object> map = debateService.selectDebateDetail(commandMap.getMap());
			Map<String,Object> map2 = debateService.selectMyDebate(commandMap.getMap());
			// mv insert
			if(null != map2 && !map2.isEmpty()) {
				mv.addObject("me",map2);
			} else {
				   if(null != opinion) {
				    	debateService.myOpinion(commandMap.getMap());
				    	Map<String, Object> map4 = new HashMap<>();
						map4.put("OP", opinion);
						mv.addObject("me",map4);
				    }else{
						Map<String, Object> map4 = new HashMap<>();
						map4.put("OP", "N");
						mv.addObject("me",map4);
				    }
			}
			mv.addObject("map",map);
			return mv;
		}

		// 내 토론현황
		@RequestMapping(value="/debate/openMyDebate.do")
		public ModelAndView openMyDebate(HttpSession session, CommandMap commandMap) throws Exception{
		    ModelAndView mv = new ModelAndView("/debate/myDebate");
	    	String user = (String) session.getAttribute("sId");
		    commandMap.put("user", user);
			Map<String,Object> map = debateService.openMyDebate(commandMap.getMap());
			@SuppressWarnings("unchecked")
			List<Map<String,Object>> list = (List<Map<String, Object>>) map.get("result");
			// 상태 배열....
			int agree = 0;
			int disagree = 0;
			for (int i=0; i<list.size()-1; i++) {
				if (list.get(i).get("OP").equals("A")){
					agree = agree+1;
				}
				if (list.get(i).get("OP").equals("D")){
					disagree = disagree+1;
				}
			}
			mv.addObject("count_agree", agree);
			mv.addObject("count_disagree", disagree);
			mv.addObject("list", list);
		    return mv;
		}
				
		// write view
			@RequestMapping(value="/debate/openDebateWrite.do")
			public ModelAndView openDebateWrite(CommandMap commandMap) throws Exception{
			    ModelAndView mv = new ModelAndView("/debate/debateWrite");
			    return mv;
			}
			
		// write submit
		@RequestMapping(value="/debate/uploadDebate.do")
		private ModelAndView uploadDebate(CommandMap commandMap, MultipartHttpServletRequest request, HttpSession session,@RequestParam("enroll_img") MultipartFile file) throws Exception {
			ModelAndView mv = new ModelAndView("redirect:/debate/openDebateList.do");

			// images/debate 갯수로 idx 추출 (db io 안하기 위해서 이렇게 함..)
			String kikiki = request.getSession().getServletContext().getRealPath("/images/debate");
			File hehehe = new File(kikiki);
			String [] hahaha = hehehe.list(); // 요까지
			
			// 1. idx
				commandMap.put("idx", hahaha.length +1);
				commandMap.put("Dindex", "D"+(hahaha.length+1+""));
			// 2. 카테고리
				commandMap.put("ctg", request.getParameter("enroll_ctg"));
			// 3. 이미지
				   String path = "C://dev/workspace/project/src/main/webapp/images/debate/";
				   String filename = (hahaha.length +1)+".jpg";
				   File f = new File(path + filename);
				   try {file.transferTo(f);}
				   	catch (Exception e) {System.out.println(e.getMessage());} 
			// 4. 제목
				   String tmp = request.getParameter("enroll_title");
				   commandMap.put("title", tmp.substring(0, tmp.length()-2));
			// 5. 내용
				   commandMap.put("cont", request.getParameter("enroll_contents"));
			// 6. 태그
				   commandMap.put("tag", request.getParameter("enroll_tag"));
			// 7. 글쓴이
				   commandMap.put("writer", session.getAttribute("sName"));

			debateService.insertDebateColumn(commandMap.getMap());
			debateService.insertDebateTopic(commandMap.getMap());	
			return mv;
	}
		// 음.. 이것은 댓글이다!
		@RequestMapping(value="/debate/debateReply.do")
		public ModelAndView debateReply(HttpSession session, HttpServletRequest request, CommandMap commandMap) throws Exception {
			// 순서 바꾸면 안됨!
			ModelAndView mv = new ModelAndView("redirect:/debate/openDebateDetail.do?idx="+request.getParameter("idx"));
			
			commandMap.put("reply_id", request.getParameter("reply_id"));
			commandMap.put("reply_idx", request.getParameter("idx"));
			commandMap.put("reply_contents", request.getParameter("reply_contents"));
			commandMap.put("reply_agree", request.getParameter("reply_agree"));
			
			debateService.insertDebateReply(commandMap.getMap());

			//mongoDB save
			ApplicationContext ctx = 
		             new AnnotationConfigApplicationContext(SpringMongoConfig.class);
			MongoOperations mongoOperation = (MongoOperations) ctx.getBean("mongoTemplate");
			
			DebateReply debatereply = new DebateReply(request.getParameter("title"),request.getParameter("reply_contents"),request.getParameter("reply_agree"));
			
			mongoOperation.save(debatereply);
			((AbstractApplicationContext) ctx).close();
			return mv;
		}
		
		// 즐겨찾기
		@RequestMapping(value="/debate/favorite.do")
		public void favorite(HttpServletRequest request, HttpServletResponse response, CommandMap commandMap) throws Exception {
			
			// response 한글처리
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			String id = request.getParameter("id");
			String index = request.getParameter("index");
			String n = request.getParameter("n");
			
			// 넘어온 값 저장
			commandMap.put("id", id);
			commandMap.put("index", index);
			
			// db 조회결과 배열에 저장
			Map<String,Object> map = debateService.selectFavoriteList(commandMap.getMap());
			@SuppressWarnings("unchecked")
			List<Map<String,Object>> list = (List<Map<String, Object>>) map.get("result");

			if (list.size() == 1) {	// 이미 즐겨찾기 한 상태
				response.getWriter().print("favorite-already");
			} else if(list.size() == 0) { // 즐겨찾기 안된상태
				if (n.equals("1")) {
					debateService.insertFavorite(commandMap.getMap());
				}
				response.getWriter().print("favorite-done");
			}
		}		

		// 댓글 공감비공감
		@RequestMapping(value="/debate/OX.do")
		public void OX(HttpServletRequest request, HttpServletResponse response, CommandMap commandMap) throws Exception {
			
			String ox = request.getParameter("OX");
			String idx = request.getParameter("IDX");
			
			commandMap.put("OX", ox);
			commandMap.put("IDX", idx);
			
			// db 조회결과 배열에 저장
			debateService.ox(commandMap.getMap());
		}		
}

