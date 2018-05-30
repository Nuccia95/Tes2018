package persistence.interfaces;

import model.User;

public interface UserDao {

	public void save(User user);

	public User getByPrimaryKey(Long id);

	public void delete(User user);


}
