package com.gl.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class InsertNewRecord {

	public static void main(String[] args) throws SQLException {
		// TODO Auto-generated method stub
		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gl","root","admin");
		
		Statement stmt = con.createStatement();
		
		

		String str1 = "INSERT INTO EMPLOYEE VALUE (6,'Jay','jay@gmail.com','1247853956')";
		String str2 = "INSERT INTO EMPLOYEE VALUE (7,'Veeru','veeru@gmail.com','1395674930')";

		stmt.execute(str1);
		stmt.execute(str2);
		
		
		con.close();
		
		
		System.out.println("Query Excuted............");
		
		
	}

}
