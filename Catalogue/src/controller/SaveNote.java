package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.City;
import model.Note;
import model.User;
import persistence.DaoFactory;

public class SaveNote extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String noteName = req.getParameter("noteName");
		String jsonNotes = req.getParameter("notes");
		System.out.println("noteName");
		if(noteName == "") {
			resp.setStatus(500);
			resp.getWriter().write("invalid name");
			throw new RuntimeException("You must insert a name to save this list");
		}
		
		User user = (User) req.getSession().getAttribute("user");
		noteName = noteName.substring(0, 1).toUpperCase()+noteName.substring(1).toLowerCase();
		
		Gson gson = new Gson();
		String [] notelist = gson.fromJson(jsonNotes, String[].class);
		ArrayList<City> notes = new ArrayList<>();
		
		for (String i : notelist) {
			City c = new City();
			System.out.println("-"+i+"-");
			c.setName(i);
			notes.add(c);
		}
		
		Note note = new Note();
		note.setName(noteName);
		note.setOwner(user);
		note.setNotes(notes);
		DaoFactory.getInstance().makeNoteDao().save(note);
	}

}
