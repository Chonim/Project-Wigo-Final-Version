package project.note;

import java.util.Map;

import org.springframework.stereotype.Repository;

import project.common.dao.AbstractDAO;

@Repository("noteDAO")
public class NoteDAO extends AbstractDAO {
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> selectNote(Map<String, Object> map) throws Exception {
		return (Map<String, Object>) selectOne("note.select", map);
	}

	public void updateNote(Map<String, Object> map) throws Exception {
		update("note.update", map);
	}
	
}