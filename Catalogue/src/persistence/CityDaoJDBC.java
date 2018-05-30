package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.City;
import persistence.interfaces.CityDao;

public class CityDaoJDBC implements CityDao {
	
	private DataSource dataSource;

	public CityDaoJDBC(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public void save(City city) {
		try {
			
			List<String> nearbies = city.getNearbyCities();
			
			Connection connection;
			connection = this.dataSource.getConnection();
			String insert = "insert into cities(name) values (?)";
			PreparedStatement statement = connection.prepareStatement(insert);
			statement.setString(1, city.getName());
			statement.executeUpdate();
			
			if (nearbies != null) {
				insert = "insert into nearbies(city_name, nearby_name) values (?,?)";
				statement = connection.prepareStatement(insert);
				for (String nearby : nearbies) {
					statement.setString(1, city.getName());
					statement.setString(2, nearby);
					statement.executeUpdate();
				}
			}
			connection.close();
		} catch (SQLException e) {
		}
		
	}

	@Override
	public City getByPrimaryKey(String name) {
		try {
			Connection connection = this.dataSource.getConnection();
			String query = "select * " + " from cities " + " where name = ? ";

			PreparedStatement statement = connection.prepareStatement(query);
			statement.setString(1, name);
			ResultSet result = statement.executeQuery();
			City city = new City();
			if (result.next()) {
				String cityname = result.getString("name");
				city.setName(cityname);
				connection.close();
				return city;
			}
			connection.close();
		} catch (SQLException e) {
		}
		return null;	
	}

	@Override
	public List<String> getNearbies(String cityName) {
		try {
			Connection connection = this.dataSource.getConnection();
			String query = "select * " + " from nearbies " + " where city_name = ? ";

			PreparedStatement statement = connection.prepareStatement(query);
			statement.setString(1, cityName);
			ResultSet result = statement.executeQuery();
			List<String> nearbies = new ArrayList<>();
			
			while (result.next()) {
				String cityname = result.getString("nearby_name");
				nearbies.add(cityname);
			}

			connection.close();
			return nearbies;
		} catch (SQLException e) {
		}
		return null;	
	}
}
