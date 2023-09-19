package com.thread.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTests {

	@Test
	public void testConnection() {
		
		try(Connection con =
				DriverManager.getConnection(
				"jdbc:mysql://34.64.70.237:3306/test",
				"root",
				"board0@")) {
					
					log.info(con);
				} catch (Exception e) {
					fail(e.getMessage());
					}
				}
	}
