package persistence.interfaces;

import java.util.List;

import model.City;
import model.Note;
import model.User;

public interface NoteDao {
	
	public void save(Note note);
	
	public Note getByPrimaryKey(Long id);
	
	public List<City> getCities(Long id);
	
	public List<Note> getByOwner(User owner);

	public void delete(Long id);
	
}
