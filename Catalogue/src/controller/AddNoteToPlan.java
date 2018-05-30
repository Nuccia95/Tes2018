package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Note;
import persistence.DaoFactory;

public class AddNoteToPlan extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
		String idNote = req.getParameter("id");
		Long id = Long.parseLong(idNote);
		req.getSession().setAttribute("currentNoteInPlan", id);

		Note note = DaoFactory.getInstance().makeNoteDao().getByPrimaryKey(id);
		
		/* Put in session information about current Note */
		req.getSession().setAttribute("currentNoteName", note.getName());
		req.getSession().setAttribute("currentCities", note.getNotes());
		
		resp.getWriter().print(note.getName());
		req.setAttribute("name", note.getName());
		req.setAttribute("cities", note.getNotes());
		req.getRequestDispatcher("addNoteToPlan.jsp").forward(req,resp);
	}
	
}
