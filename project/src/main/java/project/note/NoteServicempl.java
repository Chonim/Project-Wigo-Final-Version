package project.note;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("noteService")
public class NoteServicempl implements NoteService {
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="noteDAO")
	private NoteDAO noteDAO;
	
	public Map<String, Object> selectNote(Map<String, Object> map) throws Exception {
		return noteDAO.selectNote(map);
	}

	@Override
	public void updateNote(Map<String, Object> map) throws Exception {
		noteDAO.updateNote(map);
	}
}