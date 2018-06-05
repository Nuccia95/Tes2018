package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CleanPlan extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.getSession().removeAttribute("currentNoteInPlan");
		req.getSession().removeAttribute("currentNoteName");
		req.getSession().removeAttribute("currentCities");
		req.getSession().removeAttribute("nearbiesFavorites");
		req.getSession().removeAttribute("favorites");
		
	}
	
	
}
