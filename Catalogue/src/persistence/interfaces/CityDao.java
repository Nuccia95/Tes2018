package persistence.interfaces;

import java.util.List;

import model.City;

public interface CityDao {

	public void save(City city);

	public City getByPrimaryKey(String name);
	
	public List<String> getNearbies(String cityName);
	
}
