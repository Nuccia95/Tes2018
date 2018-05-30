package persistence;

import java.sql.*;

class DataSource {
	final private String dbURI;
	final private String userName;
	final private String password;

	public DataSource(String dbURI, String userName, String password) {
		this.dbURI = dbURI;
		this.userName = userName;
		this.password = password;
	}

	public Connection getConnection() {
		Connection connection = null;
		try {
			connection = DriverManager.getConnection(dbURI, userName, password);
		} catch (SQLException e) {
			System.out.println(e);
		}
		return connection;
	}
}
