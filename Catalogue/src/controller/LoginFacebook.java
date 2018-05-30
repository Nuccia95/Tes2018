package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import model.User;
import persistence.DaoFactory;
import persistence.interfaces.UserDao;

public class LoginFacebook extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String jsonUser = req.getParameter("user");
		Gson gson = new Gson();
		User user = gson.fromJson(jsonUser, model.User.class);
		User u = DaoFactory.getInstance().makeUserDao().getByPrimaryKey(user.getId());
		
		if(u == null) {
			UserDao userDao = DaoFactory.getInstance().makeUserDao();
			userDao.save(user);
		}
		HttpSession session = req.getSession();
		session.setAttribute("user", user);
		resp.getWriter().print("login");
	}


}
