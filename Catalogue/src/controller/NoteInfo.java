package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Note;
import persistence.DaoFactory;

public class NoteInfo extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Long currentNote = (Long) req.getSession().getAttribute("currentNoteInPlan");
		System.out.println(currentNote);
		
		Note note = DaoFactory.getInstance().makeNoteDao().getByPrimaryKey(currentNote);
		
		String cities[] = new String[note.getNotes().size()];
		
		for(int i=0; i<note.getNotes().size(); i++) {
			cities[i] = note.getNotes().get(i).getName();
		}
		
		req.setAttribute("cities", cities);
		req.getRequestDispatcher("addCitiesToPlan.jsp").forward(req,resp);	

	}
	
}
