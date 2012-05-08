import junit.framework.Test;
import junit.framework.TestSuite;

public class SuiteOfTests extends TestSuite
{
	public static Test suite()
	{
		TestSuite theSuite = new TestSuite();
		theSuite.addTestSuite(TemperatureFinderTest.class);
		theSuite.addTestSuite(ProviderFactoryTest.class);
		return theSuite;
	}
}
