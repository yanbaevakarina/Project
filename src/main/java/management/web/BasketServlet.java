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

import management.dao.BasketDAO;
	import management.model.Basket;
import management.model.Product;
import management.model.User;


	@WebServlet(urlPatterns = {"/basket","/new_pr_basket", "/delete_pr_basket", "/basket_id", "/clear_basket"})
	public class BasketServlet extends HttpServlet {
		private static final long serialVersionUID = 1L;
	    private BasketDAO basketDAO;
	    

	    public BasketServlet() {
	    	this.basketDAO = new BasketDAO();
	    }


		protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
			String action = request.getServletPath();
			switch(action) {
			case "/new_pr_basket":
				try {
					insertBasket(request,response);
				} catch (ServletException | IOException | SQLException e) {
					e.printStackTrace();
				}
				break;
			case "/delete_pr_basket":
				try {
					deleteBasket(request,response);
				} catch(SQLException e) {
					e.printStackTrace();
				}
				break;
			case "/clear_basket":
				try {
					clearBasket(request,response);
				} catch(SQLException e) {
					e.printStackTrace();
				}
				break;
			case "/basket":
				try {
					listBasket(request,response);
				} catch(SQLException e) {
					e.printStackTrace();
				}
				break;
			case "/basket_id":
				try {
					listBasketId(request,response);
				} catch(SQLException e) {
					e.printStackTrace();
				}
				break;
				
			default:
				break;		
			} 
		}
		
		private void listBasketId(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException, SQLException{
			int idusers = Integer.parseInt(request.getParameter("idusers"));
			List <Basket> listBasket = basketDAO.selectBasket(idusers);
			int sum = basketDAO.sumBasket(idusers);
			request.setAttribute("listBasket", listBasket);
			request.setAttribute("sum", sum);
			RequestDispatcher dispatcher = request.getRequestDispatcher("basket.jsp");
			dispatcher.forward(request, response);
		}
		
		private void listBasket(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException, SQLException{
			List <Basket> listBasket = basketDAO.selectAllBasket();
			request.setAttribute("listBasket", listBasket);
			RequestDispatcher dispatcher = request.getRequestDispatcher("basket.jsp");
			dispatcher.forward(request, response);
			}
		
		private void deleteBasket(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException, SQLException{
		int id = Integer.parseInt(request.getParameter("id")); 
		int idusers = Integer.parseInt(request.getParameter("idusers"));
		basketDAO.deleteBasket(id);			
		response.sendRedirect("basket_id?idusers="+idusers); }

		private void clearBasket(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException, SQLException{
		int idusers = Integer.parseInt(request.getParameter("idusers"));
		basketDAO.clearBasket(idusers);			
		response.sendRedirect("success.jsp"); 
		}		
		
		private void insertBasket(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
			int idusers = Integer.parseInt(request.getParameter("idusers"));
			int idproduct = Integer.parseInt(request.getParameter("idproduct"));
			int price = Integer.parseInt(request.getParameter("price"));
			String product = request.getParameter("product");
			Basket newBasket = new Basket(idusers, idproduct, price, product);
			basketDAO.insertBasket(newBasket);
			response.sendRedirect("index");
		}
		
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			this.doGet(request, response);
		}
	}
