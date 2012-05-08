package CSF.jdbc;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class DBConnect
{
	private static Connection dbConnection;

	public static void connect()
	{
		Properties properties = new Properties();
		try
		{
			properties.load(new FileInputStream("database.PROPERTIES"));
		} catch (IOException e)
		{
			System.err.println("Properties File Not Found..");
		}
		try
		{

			String database = properties.getProperty("database");
			String username = properties.getProperty("username");
			String password = properties.getProperty("password");
			String ipAddress = properties.getProperty("ipAddress");
			String port =properties.getProperty("port");

			Class.forName("com.mysql.jdbc.Driver");
			dbConnection =
					DriverManager.getConnection("jdbc:mysql://" + ipAddress
							+ ":" + port + "/" + database, username, password);

            dbConnection.setAutoCommit(false);

		}

		catch (SQLException e)
		{
			System.err.println("***Cannot Connect to  FindARideDB ***********");
			e.printStackTrace();
		} catch (Exception e)
		{
			System.err.println("***Cannot Connectto  FindARideDB ***********");
			e.printStackTrace();
		}

	}

	public static Connection getConnection()
	{
		return dbConnection;
	}
}
