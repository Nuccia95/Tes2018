package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Place;
import persistence.interfaces.PlaceDao;

public class PlaceDaoJDBC implements PlaceDao {
	
	private DataSource dataSource;

	public PlaceDaoJDBC(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	@Override
	public void save(Place place) {
		try {
			Connection connection = this.dataSource.getConnection();
			String insert = "insert into places(id, name, category, image, city_name) values (?,?,?,?,?)";
			Long id = IdBroker.getId(connection);
			place.setId(id);
			PreparedStatement statement = connection.prepareStatement(insert);
			statement.setLong(1, place.getId());
			statement.setString(2, place.getName());
			statement.setString(3, place.getCategory());
			statement.setString(4, place.getImage());	
			statement.setString(5, place.getCity());
			statement.executeUpdate();
		
			connection.close();
		} catch (SQLException e) {
		}
		
	}

	@Override
	public Place getByPrimaryKey(long id) {
		try {
			Connection connection = this.dataSource.getConnection();
			String query = "select * " + " from places " + " where id = ? ";

			PreparedStatement statement = connection.prepareStatement(query);
			statement.setLong(1, id);
			ResultSet result = statement.executeQuery();
			Place place = new Place();
			if (result.next()) {	
				place.setName(result.getString("name"));
				place.setCategory(result.getString("category"));
				place.setImage(result.getString("image"));
				place.setCity(result.getString("city_name"));
				connection.close();
				return place;	
			}
			connection.close();
		} catch (SQLException e) {
		}
		return null;	
	}

	@Override
	public List<Place> getByCategory(String category) {
		try {
			Connection connection = this.dataSource.getConnection();
			String query = " select * " + " from places " + " where category = ? ";

			PreparedStatement statement = connection.prepareStatement(query);
			statement.setString(1, category);
			ResultSet result = statement.executeQuery();
			List<Place> places = new ArrayList<>();
			while (result.next()) {
				Place p = new Place();
				p.setId(result.getLong("id"));
				p.setName(result.getString("name"));
				p.setImage(result.getString("image"));
				p.setCategory(category);
				p.setCity(result.getString("city"));
				places.add(p);
			}
			connection.close();
			return places;
		} catch (SQLException e) {
		}
		return null;
	}

	@Override
	public List<Place> getByCityAndCategory(String category, String city) {
		try {
			Connection connection = this.dataSource.getConnection();
			String query = " select * " + " from places " + " where category = ? and city_name = ? ";

			PreparedStatement statement = connection.prepareStatement(query);
			statement.setString(1, category);
			statement.setString(2, city);
			ResultSet result = statement.executeQuery();
			List<Place> places = new ArrayList<>();
			while (result.next()) {
				Place p = new Place();
				p.setId(result.getLong("id"));
				p.setName(result.getString("name"));
				p.setImage(result.getString("image"));
				p.setCategory(category);
				p.setCity(city);
				places.add(p);
			}
			connection.close();
			return places;
		} catch (SQLException e) {
		}
		return null;
	}

}
