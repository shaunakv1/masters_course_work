import junit.framework.Test;
import junit.framework.TestSuite;

public class SuiteOfTests extends TestSuite
{
	public static Test suite()
	{
		TestSuite theSuite = new TestSuite();
		theSuite.addTestSuite(SpecialWordDetectorIntegrationTest.class);
		theSuite.addTestSuite(SpecialWordDetectorTest.class);
		theSuite.addTestSuite(IsWordPalindromeTest.class);
		theSuite.addTestSuite(AlphabeticalOrderTest.class);
		theSuite.addTestSuite(DetectorLoaderTest.class);
		return theSuite;
	}
}
