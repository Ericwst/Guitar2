package tool;

import java.sql.*;
import java.io.*;

public class JDBConnection implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public Connection connection = null;
	private static final String FILENAME = "F:/sqlitestudio/guitar";	
	public JDBConnection(){
		try {
			Class.forName("org.sqlite.JDBC");
			connection= DriverManager.getConnection("jdbc:sqlite:"+FILENAME);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
