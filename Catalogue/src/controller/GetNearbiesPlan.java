package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

public class GetNearbiesPlan extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String jsonFavorites = req.getParameter("favorites");
		Gson gson = new Gson();
		String [] nearbieslist = gson.fromJson(jsonFavorites, String[].class);
		ArrayList<String> nearbiesFavorites  = new ArrayList<>();

		for(int i=0; i<nearbieslist.length; i++)
			nearbiesFavorites.add(nearbieslist[i]);
		
		req.getSession().setAttribute("nearbiesFavorites", nearbiesFavorites);
	
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.getRequestDispatcher("writenearbiesonplan.jsp").forward(req,resp);		
		
	}

}
