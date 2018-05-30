package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import persistence.DaoFactory;

public class DeleteNote extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String idNote = req.getParameter("id");
		Long id = Long.parseLong(idNote);
		DaoFactory.getInstance().makeNoteDao().delete(id);
		
	}
}
