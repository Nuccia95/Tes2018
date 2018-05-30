package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UtilDao {

	private DataSource dataSource;

	public UtilDao(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public void dropDatabase() {
		Connection connection;
		try {
			connection = dataSource.getConnection();
			String delete = "drop SEQUENCE if EXISTS sequenza_id;"
					+ "drop table if exists composedby cascade;"
					+ "drop table if exists notes cascade;"
					+ "drop table if exists places cascade;"
					+ "drop table if exists reviews cascade;"
					+ "drop table if exists cities cascade;"
					+ "drop table if exists nearbies cascade;"
					+ "drop table if exists index cascade;"
					+ "drop table if exists users cascade;";
			PreparedStatement statement = connection.prepareStatement(delete);

			statement.executeUpdate();
			System.out.println("Database dropped");

			connection.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void createDatabase() {
		Connection connection;
		try {
			connection = dataSource.getConnection();
			String create = "create SEQUENCE sequenza_id;"
					+ "create table users(id bigint primary key, firstName varchar(255), lastName varchar(255), image varchar(255));"
					+ "create table notes(id bigint primary key, name varchar(255), owner_id bigint REFERENCES users(id));"
					+ "create table index(page varchar(255), city varchar(255));"			
					+ "create table cities(name varchar(255) primary key);"
					+ "create table nearbies(city_name varchar(255) REFERENCES cities(name), nearby_name varchar(255));"
					+ "create table places(id bigint primary key, name varchar(255), category varchar(255), image varchar(255), city_name varchar(255) REFERENCES cities(name));"
					+ "create table reviews(id varchar(255), placeName varchar(255), head varchar(255), stars varchar(255), image varchar(255), description varchar(255), lastLine varchar(255));"
					+ "create table composedby(note_id bigint REFERENCES notes(id), city_name varchar(255) REFERENCES cities(name));";
			PreparedStatement statement = connection.prepareStatement(create);
			statement.executeUpdate();
			System.out.println("Database created");

			connection.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
