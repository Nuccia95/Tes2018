package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.City;
import model.Note;
import model.Place;
import persistence.DaoFactory;

public class GetPlaces extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String category = req.getParameter("category");
		
		System.out.println(category);
		
		Long idNote = (Long) req.getSession().getAttribute("currentNoteInPlan");
		Note note = DaoFactory.getInstance().makeNoteDao().getByPrimaryKey(idNote);
		List<City> cities = note.getNotes();
		List<Place> allPlaces = new ArrayList<>();
		
		for (City city : cities) {
			List<Place> places = DaoFactory.getInstance().makePlaceDao().getByCityAndCategory(category, city.getName());
			if(places != null && !places.isEmpty())
			for (Place place : places)
				allPlaces.add(place);
		}
		
		req.getServletContext().setAttribute("allPlaces", allPlaces);
		req.getRequestDispatcher("fillSlider.jsp").forward(req,resp);		
}
}