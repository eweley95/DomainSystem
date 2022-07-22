package com.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DbConn {
    
	private static final Logger log = Logger.getLogger("DbConn");
	
    private static Connection conn = null;
    private static String dbURL = "jdbc:mysql://localhost:3306/ip2location?useSSL=false";
    
    DbConn() {}
    
    public static Connection getConn() throws ClassNotFoundException {
        if (conn != null) {
            return conn;
        } else {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(dbURL, "appContest", "gamerx@123456");
            } catch (ClassNotFoundException | SQLException e) {
               log.log(Level.SEVERE, e.getMessage());
            }
        }
        return conn;
    }
    
    public void closeConn() throws ClassNotFoundException {
        try {
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
}
