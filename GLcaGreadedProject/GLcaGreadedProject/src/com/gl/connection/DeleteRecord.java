package com.gl.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DeleteRecord {

	public static void main(String[] args) throws SQLException {
		
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gl","root","admin");
		
		Statement stmt  = con.createStatement();
		
		
		String str = "DELETE FROM EMPLOYEE WHERE ID = 3 ";
		String str1 = "DELETE FROM EMPLOYEE WHERE ID = 4 ";
				
		
		stmt.execute(str);
		stmt.execute(str1);
		
		con.close();
		
		System.out.println("Record Deleted..............");
		
		
	}

}
