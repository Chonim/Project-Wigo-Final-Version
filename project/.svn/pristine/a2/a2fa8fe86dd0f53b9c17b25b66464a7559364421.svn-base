package project.debate;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("debateService")
public class DebateServiceImpl implements DebateService{
	Logger log = Logger.getLogger(this.getClass());

    @Resource(name="debateDAO")
    private DebateDAO debateDAO;

	@Override
	public Map<String, Object> selectDebateList(Map<String, Object> map) throws Exception {
        return debateDAO.selectDebateList(map);
	}

	@Override
    public void insertDebate(Map<String, Object> map, HttpServletRequest request) throws Exception {
        debateDAO.insertDebate(map);
    }
	
	@Override
	public Map<String, Object> selectDebateDetail(Map<String, Object> map) throws Exception {
//	    debateDAO.updateHitCnt(map);
//	    Map<String, Object> resultMap = new HashMap<String,Object>();
	    Map<String, Object> tempMap = debateDAO.selectDebateDetail(map);
//	    resultMap.put("map", tempMap);
	    return tempMap;
	}

	@Override
	public void updateDebate(Map<String, Object> map, HttpServletRequest request) throws Exception{
	    debateDAO.updateDebate(map);
	}
	
	@Override
	public void deleteDebate(Map<String, Object> map) throws Exception {
	    debateDAO.deleteDebate(map);
	}

	@Override
	public void myOpinion(Map<String, Object> map) throws Exception {
		debateDAO.myOpinion(map);
	}

	@Override
	public Map<String, Object> selectMyDebate(Map<String, Object> map) throws Exception {
		return debateDAO.selectMyDebate(map);
	}

	@Override
	public Map<String, Object> openMyDebate(Map<String, Object> map) throws Exception {
		return debateDAO.openMyDebate(map);
	}

	@Override
	public void insertDebateColumn(Map<String, Object> map) throws Exception {
        debateDAO.insertDebateColumn(map);
	}

	@Override
	public void insertDebateTopic(Map<String, Object> map) throws Exception {
		debateDAO.insertDebateTopic(map);
	}

	@Override
	public Map<String, Object> debateReply(Map<String, Object> map) throws Exception {
		return debateDAO.debateReply(map);
	}

	@Override
	public void insertDebateReply(Map<String, Object> map) throws Exception {
		debateDAO.insertDebateReply(map);
	}

	@Override
	public Map<String, Object> selectFavoriteList(Map<String, Object> map) throws Exception {
		return debateDAO.selectFavoriteList(map);
	}

	@Override
	public void insertFavorite(Map<String, Object> map) throws Exception {
		debateDAO.insertFavorite(map);
	}

	@Override
	public void ox(Map<String, Object> map) throws Exception {
		debateDAO.ox(map);
	}
	
	@Override
	public void updateDebateCount(Map<String, Object> map) throws Exception{
	    debateDAO.updateDebateCount(map);
	}
	
}