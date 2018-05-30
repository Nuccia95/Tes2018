package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.User;
import persistence.interfaces.UserDao;

public class UserDaoJDBC implements UserDao {

	private DataSource dataSource;

	public UserDaoJDBC(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public void save(User user) {
		try {
			Connection connection = this.dataSource.getConnection();
			String insert = "insert into users(id, firstName, lastName, image) values (?,?,?,?)";
			PreparedStatement statement = connection.prepareStatement(insert);
			statement.setLong(1, user.getId());
			statement.setString(2, user.getFirstName());
			statement.setString(3, user.getLastName());
			statement.setString(4, user.getImage());
			statement.executeUpdate();
			connection.close();
		} catch (SQLException e) {

		}
	}

	@Override
	public User getByPrimaryKey(Long id) {
		try {
			Connection connection = this.dataSource.getConnection();
			User user = null;
			String query = "select * from users where id = ?";
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setLong(1, id);
			ResultSet result = statement.executeQuery();
			if (result.next()) {
				user = new User();
				user.setId(result.getLong("id"));
				user.setFirstName(result.getString("firstName"));
				user.setLastName(result.getString("lastName"));
				user.setImage(result.getString("image"));
			}
			connection.close();
			return user;
		} catch (SQLException e) {
		}
		return null;
	}

	@Override
	public void delete(User user) {
		try {
			Connection connection = this.dataSource.getConnection();
			String delete = "delete from studente where id = ? ";
			PreparedStatement statement = connection.prepareStatement(delete);
			statement.setLong(1, user.getId());
			statement.executeUpdate();
			connection.close();
		} catch (SQLException e) {
		}
	}

}
