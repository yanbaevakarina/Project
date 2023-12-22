package management.web;

	import java.io.IOException;
	import java.sql.SQLException;
	import java.util.List;

	import javax.servlet.RequestDispatcher;
	import javax.servlet.ServletException;
	import javax.servlet.annotation.WebServlet;
	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import management.dao.OrderDAO;
import management.model.History;
import management.model.Order;


	@WebServlet(urlPatterns = {"/order","/insert_order","/orderlist"})
	public class OrderServlet extends HttpServlet {
		private static final long serialVersionUID = 1L;
	    private OrderDAO orderDAO;
	    

	    public OrderServlet() {
	    	this.orderDAO = new OrderDAO();
	    }


		protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
			String action = request.getServletPath();
			switch(action) {
			case "/insert_order":
				try {
					insertOrder(request,response);
				} catch (ServletException | IOException | SQLException e) {
					e.printStackTrace();
				}
				break;
			case "/order":
				try {
					listOrderId(request,response);
				} catch(SQLException e) {
					e.printStackTrace();
				}
				break;
			case "/orderlist":
				try {
					listOrder(request,response);
				} catch(SQLException e) {
					e.printStackTrace();
				}
				break;
			default:
				break;		
			} 
		}
		
		private void listOrderId(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException, SQLException{
			int iduser = Integer.parseInt(request.getParameter("iduser"));
			List <Order> listOrder = orderDAO.selectOrder(iduser);
			request.setAttribute("listOrder", listOrder);
			RequestDispatcher dispatcher = request.getRequestDispatcher("history.jsp");
			dispatcher.forward(request, response);
		}
		
		private void insertOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
			int iduser = Integer.parseInt(request.getParameter("iduser"));
			int sum = Integer.parseInt(request.getParameter("sum"));
			Order newOrder = new Order(iduser, sum);
			orderDAO.insertOrder(newOrder);
			response.sendRedirect("history_insert?idusers="+iduser);
		}
		
		private void listOrder(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException, SQLException{
			List <Order> listOrder = orderDAO.selectAllOrder();
			request.setAttribute("listOrder", listOrder);
			RequestDispatcher dispatcher = request.getRequestDispatcher("order-list.jsp");
			dispatcher.forward(request, response);
		}

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			this.doGet(request, response);
		}
	}

