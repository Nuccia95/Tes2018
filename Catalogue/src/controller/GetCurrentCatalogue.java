package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetCurrentCatalogue extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String currentCatalogue = req.getParameter("catalogueName");
		req.getSession().setAttribute("currentCatalogue", currentCatalogue);
		System.out.println(currentCatalogue);
	
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String currentCatalogue = (String) req.getSession().getAttribute("currentCatalogue");
		resp.getWriter().print(currentCatalogue);
	}
	
	
}
