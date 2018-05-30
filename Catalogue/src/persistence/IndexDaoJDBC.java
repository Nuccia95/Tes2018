package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import persistence.interfaces.IndexDao;


public class IndexDaoJDBC implements IndexDao {
	
	private DataSource dataSource;

	public IndexDaoJDBC(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public void save(String page, String city) {
		try {
			Connection connection;
			connection = this.dataSource.getConnection();
			String insert = "insert into index(page,city) values (?,?)";
			PreparedStatement statement = connection.prepareStatement(insert);
			statement.setString(1, page);
			statement.setString(2, city);
			statement.executeUpdate();
			connection.close();
		} catch (SQLException e) {
		}
	}

	@Override
	public String getByPrimaryKey(String page) {
		try {
			Connection connection = this.dataSource.getConnection();
			String query = "select * " + " from index " + " where page = ? ";

			PreparedStatement statement = connection.prepareStatement(query);
			statement.setString(1, page);
			ResultSet result = statement.executeQuery();

			if (result.next()) {
				String city = result.getString("city");
				connection.close();
				return city;
			}
			connection.close();
		} catch (SQLException e) {
		}
		return null;
		
	}



	


}
