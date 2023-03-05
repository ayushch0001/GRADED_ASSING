package com.gl.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;


public class RemoveAllRecord {

	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gl","root","admin");
		
		Statement stmt = con.createStatement();
		
		String str = "TRUNCATE TABLE EMPLOYEE" ;
		
		stmt.execute(str);
		
		con.close();
		
		System.out.println("Remove All Record..................");
		
		

	}

}
