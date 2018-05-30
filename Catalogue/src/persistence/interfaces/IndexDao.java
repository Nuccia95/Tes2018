package persistence.interfaces;

public interface IndexDao {
	
	public void save(String page, String city);
	
	public String getByPrimaryKey(String page);

}
