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
import persistence.DaoFactory;

public class GetNearbies extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		long currentNoteId = (long) req.getSession().getAttribute("currentNoteInPlan");
		
		Note currentNote = DaoFactory.getInstance().makeNoteDao().getByPrimaryKey(currentNoteId);
	
		ArrayList<City> allNearbies = new ArrayList<>();
		
		for (City c  : currentNote.getNotes()) {
			//for all cities in note, get all its nearbies
			List<String> nearbies = DaoFactory.getInstance().makeCityDao().getNearbies(c.getName());
				if(nearbies!=null && !nearbies.isEmpty()) {
						c.setNearbyCities(nearbies);
						allNearbies.add(c);
				}
					
		}
		
		req.setAttribute("nearbies", allNearbies);
		req.getRequestDispatcher("fillnearbiesnotes.jsp").forward(req,resp);
	
	}

}
