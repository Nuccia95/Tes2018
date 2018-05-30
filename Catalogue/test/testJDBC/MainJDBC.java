package testJDBC;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

import model.City;
import model.Place;
import model.Review;
import persistence.DaoFactory;
import persistence.PostgresDaoFactory;
import persistence.UtilDao;
import persistence.interfaces.CityDao;
import persistence.interfaces.IndexDao;
import persistence.interfaces.PlaceDao;
import persistence.interfaces.ReviewDao;

public class MainJDBC {

	private static BufferedReader reader;

	public static void main(String[] args) {

		DaoFactory factory = PostgresDaoFactory.getInstance();
		UtilDao utilDao = factory.makeUtilDao();
		utilDao.dropDatabase();
		utilDao.createDatabase();
		IndexDao indexDao = factory.makeIndexDao();
		CityDao cityDao = factory.makeCityDao();
		PlaceDao placeDao = factory.makePlaceDao();
		ReviewDao reviewDao=factory.makeReviewDao();
		
		try {
			reader = new BufferedReader(new FileReader("files/cities.txt"));
			String line = reader.readLine();
			while (line != null) {
				String[] city_nearbies= line.split("-");
				City city = new City();
				city.setName(city_nearbies[0]);
				
				String[]nearbieslist = city_nearbies[1].split(",");
				ArrayList<String> nearbies = new ArrayList<>();
				
				for(int i=0; i<nearbieslist.length; i++)
					nearbies.add(nearbieslist[i]);
				
				city.setNearbyCities(nearbies);
				cityDao.save(city);
				line = reader.readLine();
			}
	    }catch (IOException e) {
			e.printStackTrace();
		}
		
		try {
			reader = new BufferedReader(new FileReader("files/index.txt"));
			String line = reader.readLine();
			while (line != null) {
				String[] page_city = line.split("-");
				indexDao.save(page_city[0], page_city[1]);
				City city = new City();
				city.setName(page_city[1]);
				cityDao.save(city);
				line = reader.readLine();
			}
	    }catch (IOException e) {
			e.printStackTrace();
		}
		
		try {
			reader = new BufferedReader(new FileReader("files/places.txt"));
			String line = reader.readLine();
			while (line != null) {
				String[] places = line.split(",");
				Place place = new Place();
				place.setName(places[0]);
				place.setCategory(places[1]);
				place.setCity(places[2]);
				place.setImage(places[3]);
				placeDao.save(place);
				line = reader.readLine();
			}
	    }catch (IOException e) {
			e.printStackTrace();
		}
		
		try {
			reader = new BufferedReader(new FileReader("files/reviews.txt"));
			String line = reader.readLine();
			while (line != null) {
				String[] reviews = line.split("@");
				Review rev = new Review();
				rev.setPlaceName(reviews[0]);
				rev.setId(reviews[1]);
				rev.setHead(reviews[2]);
				rev.setStars(reviews[3]);
				rev.setImage(reviews[4]);
				rev.setDescription(reviews[5]);
				rev.setLastLine(reviews[6]);
				reviewDao.save(rev);
				line = reader.readLine();
			}
	    }catch (IOException e) {
			e.printStackTrace();
		}
		
	}
}