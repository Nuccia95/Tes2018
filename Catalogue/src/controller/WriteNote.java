package controller;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import persistence.DaoFactory;
public class WriteNote extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	
	
		String currentPages = req.getParameter("currentPages");
		String[] pages = new String[2];
		
		pages = currentPages.split("-");		
		String city = DaoFactory.getInstance().makeIndexDao().getByPrimaryKey(pages[0]);
		
		req.setAttribute("city", city);
		req.getRequestDispatcher("currentNotes.jsp").forward(req,resp);	
	}
	
}
