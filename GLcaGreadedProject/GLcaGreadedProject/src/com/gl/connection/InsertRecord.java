package com.gl.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class InsertRecord {

	
	public static void main(String[] args) throws SQLException {

		
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gl","root","admin");
	
	
		Statement stmt = con.createStatement();
		
		
		String s1 = "INSERT INTO EMPLOYEE VALUE(1,'Harash','harsh@gmail.com','7896541230')";
		String s2 = "INSERT INTO EMPLOYEE VALUE(2,'Jaggu','jaggu@gmail.com','8976541230')";
		String s3 = "INSERT INTO EMPLOYEE VALUE(3,'Raju','raju@gmail.com','9655541230')";
		String s4 = "INSERT INTO EMPLOYEE VALUE(4,'Bheem','bheem@gmail.com','8965641230')";
		String s5 = "INSERT INTO EMPLOYEE VALUE(5,'Ravi','ravi@gmail.com','7896753230')";

		

		stmt.execute(s1);
		stmt.execute(s2);
		stmt.execute(s3);
		stmt.execute(s4);
		stmt.execute(s5);
		
		con.close();
		
		System.out.println("Query Excuted....");
	}
}

