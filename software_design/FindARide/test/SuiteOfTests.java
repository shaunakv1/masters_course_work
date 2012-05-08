import junit.framework.Test;
import junit.framework.TestSuite;

public class SuiteOfTests extends TestSuite
{
	public static Test suite()
	{
		TestSuite theSuite = new TestSuite();
		theSuite.addTestSuite(TestDBConnect.class);
		theSuite.addTestSuite(user.UserDaoTest.class);
        theSuite.addTestSuite(request.RequestDaoTest.class);
        theSuite.addTestSuite(ride.RideDaoTest.class);
        return theSuite;
	}
}
