package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Place;
import model.Review;
import persistence.DaoFactory;

public class GetReviews extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("getReview");
		
		ArrayList<Place> allPlaces = (ArrayList<Place>) req.getServletContext().getAttribute("allPlaces");		
		List<Review> allReviews = new ArrayList<>();
		
		for (Place place : allPlaces) {
			Review review = DaoFactory.getInstance().makeReviewDao().getByPlaceName(place.getName());
			if(review != null)
				allReviews.add(review);		
		}
		
		
		req.setAttribute("allReviews", allReviews);
		req.getRequestDispatcher("fillReviews.jsp").forward(req,resp);		
	}
	
}
