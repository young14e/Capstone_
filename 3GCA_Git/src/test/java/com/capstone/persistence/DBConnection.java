package com.capstone.persistence;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class DBConnection {
	// final String DRIVER = "org.mariadb.jdbc.Driver";
	final String DRIVER = "net.sf.log4jdbc.sql.jdbcapi.DriverSpy";
	final String URL = "jdbc:log4jdbc:mariadb://localhost:3306/capstone";
	final String USER = "root";
	final String PASSWORD = "1234";

	@Test
	public void connectionTest() throws Exception {
		Class.forName(DRIVER);

		try {
			Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
			System.out.print(conn);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
