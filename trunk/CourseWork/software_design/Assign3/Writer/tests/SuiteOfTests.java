import junit.framework.Test;
import junit.framework.TestSuite;

public class SuiteOfTests extends TestSuite
{
	public static Test suite()
	{
		TestSuite theSuite = new TestSuite();
		theSuite.addTestSuite(StringWriterTest.class);
		theSuite.addTestSuite(FileWriterTest.class);
		theSuite.addTestSuite(LowerCaseOperatorTest.class);
		theSuite.addTestSuite(UpperCaseOperatorTest.class);
		theSuite.addTestSuite(StupidRemoverOperatorTest.class);
		theSuite.addTestSuite(MixedOperatorTest.class);
		return theSuite;
	}
}
