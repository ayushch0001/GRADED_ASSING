package com.gl.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;



public class ModifyColumn {
	
	
	public static void main(String[] args) throws SQLException {
		
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/gl","root","admin");
	
	Statement stmt = conn.createStatement();
	
		
	String s = "ALTER TABLE EMPLOYEE MODIFY EMAIL_ID  VARCHAR(30)";
		
	stmt.execute(s);
	conn.close();
	
	System.out.println("Query Excuted....................");
		
	}
}
