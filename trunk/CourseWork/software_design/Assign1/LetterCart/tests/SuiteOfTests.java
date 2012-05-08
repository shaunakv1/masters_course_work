import junit.framework.Test;
import junit.framework.TestSuite;

public class SuiteOfTests extends TestSuite {
  public static Test suite() {        
    TestSuite theSuite = new TestSuite();
    theSuite.addTestSuite(ShelfTest.class);
    theSuite.addTestSuite(CartTest.class);
    theSuite.addTestSuite(ScoreKeeperTest.class);
    theSuite.addTestSuite(ScoreCalculatorTest.class);
    theSuite.addTestSuite(SpellCheckerTest.class);
    theSuite.addTestSuite(GameControllerTest.class);
     return theSuite;
  }
}
