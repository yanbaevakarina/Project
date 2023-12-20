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

public class HistoryDAO {
	
    private String jdbcURL = "jdbc:mysql://localhost/space?serverTimezone=Europe/Moscow&useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "199920032004";
    private static final String INSERT_HISTORY_SQL = "INSERT INTO space.history(idusers, product, price) SELECT idusers, product, price FROM space.basket where idusers=?;";
    private static final String SELECT_HISTORY_BY_ID = "SELECT * from history where idusers=?;";
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
        
}
