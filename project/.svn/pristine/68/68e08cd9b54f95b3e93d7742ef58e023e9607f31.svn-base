package project.video.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import project.common.util.FileUtils;
import project.video.dao.VideoDAO;

@Service("videoService")
public class VideoServiceImpl implements VideoService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="fileUtils")
    private FileUtils fileUtils;
     
    @Resource(name="VideoDAO")
    private VideoDAO videoDAO;

    @Override
    public Map<String, Object> selectVideoList(Map<String, Object> map) throws Exception {
        return videoDAO.selectVideoList(map);
    }
	
	@Override
    public void insertVideo(Map<String, Object> map, HttpServletRequest request) throws Exception {
		videoDAO.insertVideo(map);
         
        List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(map, request);
        for(int i=0, size=list.size(); i<size; i++){
            videoDAO.insertFile(list.get(i));
        }
    }
	
	@Override
	public Map<String, Object> selectVideoDetail(Map<String, Object> map) throws Exception {
		videoDAO.updateHitCnt(map);
	    Map<String, Object> resultMap = new HashMap<String,Object>();
	    Map<String, Object> tempMap = videoDAO.selectVideoDetail(map);
	    resultMap.put("map", tempMap);
	     
	    List<Map<String,Object>> list = videoDAO.selectFileList(map);
	    resultMap.put("videoList", list);
	     
	    return resultMap;
	}

	@Override
	public void updateVideo(Map<String, Object> map, HttpServletRequest request) throws Exception{
		videoDAO.updateVideo(map);
	     
	    videoDAO.deleteFileList(map);
	    List<Map<String,Object>> list = fileUtils.parseUpdateFileInfo(map, request);
	    Map<String,Object> tempMap = null;
	    for(int i=0, size=list.size(); i<size; i++){
	        tempMap = list.get(i);
	        if(tempMap.get("IS_NEW").equals("Y")){
	        	videoDAO.insertFile(tempMap);
	        }
	        else{
	            videoDAO.updateFile(tempMap);
	        }
	    }
	}
	
	@Override
	public void deleteVideo(Map<String, Object> map) throws Exception {
		videoDAO.deleteVideo(map);
	}

	@Override
	public Map<String, Object> categorySearch(Map<String, Object> map) throws Exception {
		   return videoDAO.categorySearch(map);
	}
}