package com.employee.util;

import java.sql.*;

public class DataBaseUtility {
	public static Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ems","root","root");
            
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return connection;
	}

	public static void close(Object object) {
        try {
            if (object != null) {
                if (object instanceof Connection){
                    ((Connection)object).close();
                }
                else if (object instanceof Statement) {
                     ((Statement)object).close();
                }
                else if(object instanceof PreparedStatement) {
                    ((PreparedStatement)object).close();
                }
                else if (object instanceof CallableStatement) {
                    ((CallableStatement)object).close();
                }
                else if (object instanceof ResultSet) {
                    ((ResultSet)object).close();
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
            // TODO: handle exception
        }
	}
}
