package persistence;

import persistence.interfaces.CityDao;
import persistence.interfaces.IndexDao;
import persistence.interfaces.NoteDao;
import persistence.interfaces.PlaceDao;
import persistence.interfaces.ReviewDao;
import persistence.interfaces.UserDao;

public class PostgresDaoFactory extends DaoFactory {

	private static DataSource dataSource;

	static {
		try {
			Class.forName("org.postgresql.Driver").newInstance();
			dataSource = new DataSource("jdbc:postgresql://localhost:5432/Tour", "postgres", "postgres");
		} catch (Exception e) {
			System.err.println("PostgresDAOFactory.class: failed to load MySQL JDBC driver\n" + e);
			e.printStackTrace();
		}
	}

	@Override
	public UtilDao makeUtilDao() {
		return new UtilDao(dataSource);
	}

	@Override
	public UserDao makeUserDao() {
		return new UserDaoJDBC(dataSource);
	}

	@Override
	public IndexDao makeIndexDao() {
		return new IndexDaoJDBC(dataSource);
	}

	@Override
	public NoteDao makeNoteDao() {
		return new NoteDaoJDBC(dataSource);
	}

	@Override
	public CityDao makeCityDao() {
		return new CityDaoJDBC(dataSource);
	}

	@Override
	public PlaceDao makePlaceDao() {
		return new PlaceDaoJDBC(dataSource);
	}

	@Override
	public ReviewDao makeReviewDao() {
		return new ReviewDaoJDBC(dataSource);
	}


}
