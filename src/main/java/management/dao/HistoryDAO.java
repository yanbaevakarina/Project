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

public class HistoryDAO {
	
	String jdbcURL = "jdbc:mysql://81.177.136.147:49603/bonch_2105465?serverTimezone=Europe/Moscow&useSSL=false";
    String jdbcUsername = "bonch_2105465";
    String jdbcPassword = "KtkWw/aXOJ4=";
    /*private static final String INSERT_HISTORY_SQL = "INSERT INTO history(idusers, product, price) SELECT idusers, product, price FROM basket where idusers=?;";*/
    private static final String INSERT_HISTORY_SQL = "insert into history(idusers,product,price) SELECT basket.idusers, basket.product, basket.price FROM basket where idusers=?;";
    private static final String SELECT_HISTORY_BY_ID = "SELECT * from history where idusers=?;";
    private static final String SELECT_ALL_HISTORY = "SELECT * from history;";
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
    
    // добавление товара в историю покупок
    public boolean insertHistory(int idusers) throws SQLException {
    	boolean rowInserted;
    	try(Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_HISTORY_SQL)){
    		preparedStatement.setInt(1, idusers);
    		rowInserted = preparedStatement.executeUpdate()>0;
    		
    	}return rowInserted;
    }

    // вывод заказов по пользователю
        public List <History> selectHistory(int idusers) {
        	List <History> history = new ArrayList<>();
        	try(Connection connection = getConnection(); PreparedStatement statement = connection.prepareStatement(SELECT_HISTORY_BY_ID);){
        		statement.setInt(1, idusers);
        		ResultSet rs = statement.executeQuery();
             	while(rs.next()) {
             		int id = rs.getInt("id");
             		String product = rs.getString("product");
             		int price = rs.getInt("price");
             		history.add(new History(id,idusers,product,price));
             	}
        		}
	        	 catch(SQLException e) {
	        		e.printStackTrace();
	        	}return history;}
        
       	public List <History> selectAllHistory() {
       	List <History> history = new ArrayList<>();

           try(Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_HISTORY);){
            	ResultSet rs = preparedStatement.executeQuery();
            		
            	while(rs.next()) {
            		int id = rs.getInt("id");
            		int idusers = rs.getInt("idusers");
             		String product = rs.getString("product");
             		int price = rs.getInt("price");
            		history.add(new History(id,idusers,product,price));
            	}
       		}
           	 catch(SQLException e) {
           		e.printStackTrace();
           	}return history;}
}
