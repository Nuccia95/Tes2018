package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Review;
import persistence.interfaces.ReviewDao;

public class ReviewDaoJDBC implements ReviewDao {

	private DataSource dataSource;

	public ReviewDaoJDBC(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	@Override
	public void save(Review review) {
		try {
			Connection connection = this.dataSource.getConnection();
			String insert = "insert into reviews(id, placeName, head, stars, image, description, lastLine) values (?,?,?,?,?,?,?)";
			PreparedStatement statement = connection.prepareStatement(insert);
			statement.setString(1, review.getId());
			statement.setString(2, review.getPlaceName());
			statement.setString(3, review.getHead());
			statement.setString(4, review.getStars());
			statement.setString(5, review.getImage());	
			statement.setString(6, review.getDescription());
			statement.setString(7, review.getLastLine());
			statement.executeUpdate();
			connection.close();
		} catch (SQLException e) {
		}
		
	}

	@Override
	public Review getByPlaceName(String placeName) {
		try {
			Connection connection = this.dataSource.getConnection();
			String query = "select * " + " from reviews " + " where placeName = ? ";

			PreparedStatement statement = connection.prepareStatement(query);
			statement.setString(1, placeName);
			ResultSet result = statement.executeQuery();
			Review review = new Review();
	
			if (result.next()) {	
				review.setId(result.getString("id"));
				review.setPlaceName(result.getString("placeName"));
				review.setHead(result.getString("head"));
				review.setStars(result.getString("stars"));
				review.setDescription(result.getString("description"));
				review.setLastLine(result.getString("lastLine"));
				review.setImage(result.getString("image"));

				connection.close();
				return review;	
			}
			connection.close();
		} catch (SQLException e) {
		}
		return null;	
		
	}

}

