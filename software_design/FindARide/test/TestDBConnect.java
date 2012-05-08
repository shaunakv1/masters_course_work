import org.junit.*;

import CSF.jdbc.DBConnect;

import java.sql.*;

import junit.framework.TestCase;

public class TestDBConnect extends TestCase
{
	public static Connection dbConnection;

	@Before
	public void setUp() throws ClassNotFoundException, SQLException
	{

		DBConnect.connect();
		dbConnection = DBConnect.getConnection();
	}

	@After
	public void tearDown()
	{
	}

	@Test
	public void testConnect()
	{
		assertNotNull(DBConnect.getConnection());
		
	}
}