package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Note;
import persistence.DaoFactory;

public class CurrentCategory extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String category = req.getParameter("currentCategory");
		req.getSession().setAttribute("currentCategory", category);
		
		long noteId = (long) req.getSession().getAttribute("currentNoteInPlan");
		
		Note note = DaoFactory.getInstance().makeNoteDao().getByPrimaryKey(noteId);
		
		req.setAttribute("cities", note.getNotes());
		req.getRequestDispatcher("addCitiesToPlan.jsp").forward(req,resp);
	}
	

}
