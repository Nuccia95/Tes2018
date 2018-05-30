package persistence;

import persistence.interfaces.CityDao;
import persistence.interfaces.IndexDao;
import persistence.interfaces.NoteDao;
import persistence.interfaces.PlaceDao;
import persistence.interfaces.ReviewDao;
import persistence.interfaces.UserDao;

public abstract class DaoFactory {
	
	private static DaoFactory instance = null;
	private static String typeFactory = "persistence.PostgresDaoFactory";
	
	protected DaoFactory() {}

	public static DaoFactory getInstance() {
		
		if(instance == null) {
			try {
				instance = (DaoFactory) Class.forName(typeFactory).newInstance();
			} catch (InstantiationException | IllegalAccessException | ClassNotFoundException e) {
				e.printStackTrace();
			}
		}
		return instance;
	}
	
	public abstract UtilDao makeUtilDao();
	
	public abstract UserDao makeUserDao();
	
	public abstract IndexDao makeIndexDao();
	
	public abstract NoteDao makeNoteDao();
	
	public abstract CityDao makeCityDao();

	public abstract PlaceDao makePlaceDao();
	
	public abstract ReviewDao makeReviewDao();


}
