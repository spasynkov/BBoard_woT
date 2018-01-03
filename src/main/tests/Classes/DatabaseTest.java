package Classes;


import java.sql.Connection;
import java.sql.SQLException;

import org.junit.Assert;
import org.junit.Test;

public class DatabaseTest {



	@Test
	public void basicConnectionTest() throws SQLException {
		Connection conn = Database.getConn();
		Assert.assertNotNull(conn);
		Assert.assertTrue(!conn.isClosed());

	}
	@Test
	public void test() throws SQLException {
		Assert.assertTrue(Database.initConn());
		basicConnectionTest();
	}
}