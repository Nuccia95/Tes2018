package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Note;
import model.User;
import persistence.DaoFactory;

public class UserNotes extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		User user = (User) req.getSession().getAttribute("user");
		List<Note> notes = (List<Note>) DaoFactory.getInstance().makeNoteDao().getByOwner(user);
		req.setAttribute("notes", notes);
		req.getRequestDispatcher("userNotes.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String noteId = req.getParameter("id");
		Long id = Long.parseLong(noteId);	
		Note note = DaoFactory.getInstance().makeNoteDao().getByPrimaryKey(id);
		req.setAttribute("cities", note.getNotes());
		req.getRequestDispatcher("openedCurrentNote.jsp").forward(req, resp);
	}
}
