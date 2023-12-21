package management.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import management.model.Basket;
import management.model.History;
import management.model.Order;

public class OrderDAO {
	
    private String jdbcURL = "jdbc:mysql://localhost/space?serverTimezone=Europe/Moscow&useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "199920032004";
    private static final String INSERT_ORDER_SQL = "INSERT INTO orders" + "(iduser,sum) VALUES" + "(?, ?);";
    private static final String SELECT_ORDER_BY_ID = "SELECT * from orders where iduser=?;";
    private static final String SELECT_ALL_ORDER = "SELECT * FROM orders;";
    protected Connection getConnection() {
    	Connection connection=null;
    	try {
    		Class.forName("com.mysql.jdbc.Driver");
    		connection = DriverManager.getConnection(jdbcURL,jdbcUsername,jdbcPassword);
    	} catch(SQLException e) {
    		e.printStackTrace();
    	} catch (ClassNotFoundException e) {
    		e.printStackTrace();
    	}return connection;
    }
    // добавление заказа в список заказов
    public void insertOrder(Order order) throws SQLException {
    	try(Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ORDER_SQL)){
    		preparedStatement.setInt((1), order.getIduser());
    		preparedStatement.setInt((2), order.getSum());
    		preparedStatement.executeUpdate();
			} catch(Exception e) {
				e.printStackTrace();
			}
    }
    public List <Order> selectOrder(int iduser) {
    	List <Order> order = new ArrayList<>();
    	try(Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(SELECT_ORDER_BY_ID);){
    		statement.setInt(1, iduser);
    		ResultSet rs = statement.executeQuery();
    		
         	while(rs.next()) {
         		int id = rs.getInt("id");
         		int sum = rs.getInt("sum");
         		order.add(new Order(id,iduser,sum));
         	}
    		}
        	 catch(SQLException e) {
        		e.printStackTrace();
        	}return order;}
    
    // вывод всех заказов пользователей
   	public List <Order> selectAllOrder() {
   	List <Order> order = new ArrayList<>();

       try(Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_ORDER);){
        	ResultSet rs = preparedStatement.executeQuery();
        		
        	while(rs.next()) {
        		int id = rs.getInt("id");
        		int iduser = rs.getInt("iduser");
        		int sum = rs.getInt("sum");
        		order.add(new Order(id,iduser,sum));
        	}
   		}
       	 catch(SQLException e) {
       		e.printStackTrace();
       	}return order;}
}