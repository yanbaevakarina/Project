	package management.web;

	import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
	import java.util.List;

	import javax.servlet.RequestDispatcher;
	import javax.servlet.ServletException;
	import javax.servlet.annotation.WebServlet;
	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import management.dao.HistoryDAO;
import management.model.Basket;
import management.model.History;
import management.model.Order;
import management.model.User;


	@WebServlet(urlPatterns = {"/history","/history_insert"})
	public class HistoryServlet extends HttpServlet {
		private static final long serialVersionUID = 1L;
	    private HistoryDAO historyDAO;
	    

	    public HistoryServlet() {
	    	this.historyDAO = new HistoryDAO();
	    }


		protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
			String action = request.getServletPath();
			switch(action) {
			case "/history_insert":
				try {
					insertHistory(request,response);
				} catch (ServletException | IOException | SQLException e) {
					e.printStackTrace();
				}
				break;
			case "/history":
				try {
					listHistoryId(request,response);
				} catch(SQLException e) {
					e.printStackTrace();
				}
				break;
				
			default:
				break;		
			} 
		}
		
		private void listHistoryId(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException, SQLException{
			int idusers = Integer.parseInt(request.getParameter("idusers"));
			List <History> listHistory = historyDAO.selectHistory(idusers);
			request.setAttribute("listHistory", listHistory);
			RequestDispatcher dispatcher = request.getRequestDispatcher("history.jsp");
			dispatcher.forward(request, response);
		}

		private void insertHistory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
			int idusers = Integer.parseInt(request.getParameter("idusers"));
			historyDAO.insertHistory(idusers);
			response.sendRedirect("clear_basket?idusers="+idusers);
		}
		
		
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			this.doGet(request, response);
		}
	}
