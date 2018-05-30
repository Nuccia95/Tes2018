package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.City;
import model.Note;
import model.User;
import persistence.interfaces.CityDao;
import persistence.interfaces.NoteDao;
import persistence.interfaces.UserDao;

public class NoteDaoJDBC implements NoteDao {

	private DataSource dataSource;

	public NoteDaoJDBC(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public void save(Note note) {
		try {
			Connection connection = this.dataSource.getConnection();

			List<City> notes = note.getNotes();
			String insert = "insert into notes(id, name, owner_id) values (?,?,?)";

			if (note.getId() == null) {
				Long id = IdBroker.getId(connection);
				note.setId(id);
			}

			PreparedStatement statement = connection.prepareStatement(insert);
			statement.setLong(1, note.getId());
			statement.setString(2, note.getName());
			statement.setLong(3, note.getOwner().getId());
			statement.executeUpdate();

			if (notes != null) {
				insert = "insert into composedby(note_id, city_name) values (?,?)";
				statement = connection.prepareStatement(insert);
				statement.setLong(1, note.getId());

				for (City c : notes) {
					statement.setString(2, c.getName());
					statement.executeUpdate();
				}
			}

			connection.close();
		} catch (SQLException e) {
		}
	}

	@Override
	public List<City> getCities(Long id) {
		try {
			Connection connection = this.dataSource.getConnection();
			String query = "select c.name " 
						 +  "from composedby as cb, cities c " 
						 +  "where cb.note_id = ?  and c.name = cb.city_name ";

			PreparedStatement statement;
			statement = connection.prepareStatement(query);
			statement.setLong(1, id);
			ResultSet result = statement.executeQuery();
			List<City> cities = new ArrayList<>();

			while (result.next()) {
				CityDao cityDao = DaoFactory.getInstance().makeCityDao();
				City city = cityDao.getByPrimaryKey(result.getString("name"));
				cities.add(city);
			}
			connection.close();
			return cities;
		} catch (SQLException e) {
		}
		return null;
	}
	
	
	@Override
	public Note getByPrimaryKey(Long id) {
		try {
			Connection connection = this.dataSource.getConnection();
			Note note = new Note();
			String query = "select * from notes where id = ?";
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setLong(1, id);
			ResultSet result = statement.executeQuery();
			if (result.next()) {
				note.setId(result.getLong("id"));
				note.setName(result.getString("name"));
				UserDao uDao = DaoFactory.getInstance().makeUserDao();
				User owner = uDao.getByPrimaryKey(result.getLong("owner_id"));
				note.setOwner(owner);
				note.setNotes(getCities(note.getId()));
			}
			connection.close();
			return note;
		} catch (SQLException e) {
		}
		return null;
	}

	@Override
	public List<Note> getByOwner(User owner) {
		try {
			Connection connection = this.dataSource.getConnection();
			String query = "select * from notes where owner_id = ?";
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setLong(1, owner.getId());
			ResultSet result = statement.executeQuery();

			List<Note> notes = new ArrayList<>();

			while (result.next()) {
				Note note = new Note();
				note.setId(result.getLong("id"));
				note.setName(result.getString("name"));
				note.setOwner(owner);
				notes.add(note);
			}
			connection.close();
			return notes;
		} catch (SQLException e) {
		}
		return null;
	}

	@Override
	public void delete(Long id) {
		try {
			Connection connection = this.dataSource.getConnection();
			
			String query = "delete from composedby where note_id = ?";
			PreparedStatement statement = connection.prepareStatement(query);
			statement.setLong(1, id);
			statement.executeUpdate();
			
			query = "delete from notes where id = ?";
			statement = connection.prepareStatement(query);
			statement.setLong(1, id);
			statement.executeUpdate();
			
			connection.close();	
		} catch (SQLException e) {
		}

	}



}
