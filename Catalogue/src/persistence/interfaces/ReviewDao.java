package persistence.interfaces;

import model.Review;


public interface ReviewDao {
	
	public void save(Review review);

	public Review getByPlaceName(String placeName);

}
