package persistence.interfaces;

import java.util.List;

import model.Place;

public interface PlaceDao {
	
	public void save(Place event);

	public Place getByPrimaryKey(long id);
	
	public List<Place> getByCategory(String category);
	
	public List<Place> getByCityAndCategory(String category, String city);

}
