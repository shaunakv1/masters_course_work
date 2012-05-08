import specialworddetector.DetectorLoader;
import specialworddetector.SpecialWordDetector;
import junit.framework.TestCase;
import logics.AlphabeticalOrder;
import logics.IsWordPalindrome;

public class SpecialWordDetectorTest extends TestCase
{
	SpecialWordDetector specialWordDetector;
	
	public void setUp() throws Exception
	{
		DetectorLoader.getInstance().removeDetectors();
	}
	
	public void testIfWordSpecialWithNoLogic() throws Exception
	{
		specialWordDetector = new SpecialWordDetector();
		assertFalse(specialWordDetector.isWordSpecial("madam"));
	}

	public void testIfWordSpecialWithPalindromeDetectorLogic() throws Exception
	{
		DetectorLoader.getInstance().addDetectors(new IsWordPalindrome());
		specialWordDetector = new SpecialWordDetector();
		assertTrue(specialWordDetector.isWordSpecial("madam"));
	}

	public void testIfWordSpecialWithAlphabeticalOrder() throws Exception
	{
		DetectorLoader.getInstance().addDetectors(new AlphabeticalOrder());
		specialWordDetector = new SpecialWordDetector();
		assertTrue(specialWordDetector.isWordSpecial("almost"));
	}

	public void testIfWordSpecialWithBothLogics() throws Exception
	{
		DetectorLoader.getInstance().addDetectors(new IsWordPalindrome());
		DetectorLoader.getInstance().addDetectors(new AlphabeticalOrder());
		specialWordDetector = new SpecialWordDetector();
		assertTrue(specialWordDetector.isWordSpecial("madam"));
		assertTrue(specialWordDetector.isWordSpecial("almost"));
	}

	public void testIfWordSpecialWithBothLogicsInReverseOrder() throws Exception
	{
		DetectorLoader.getInstance().addDetectors(new AlphabeticalOrder());
		DetectorLoader.getInstance().addDetectors(new IsWordPalindrome());
		specialWordDetector = new SpecialWordDetector();
		assertTrue(specialWordDetector.isWordSpecial("almost"));
		assertTrue(specialWordDetector.isWordSpecial("madam"));
	}

	public void testIfWordSpecialAfterRemovingLogicAfterAdding() throws Exception
	{
		DetectorLoader.getInstance().addDetectors(new IsWordPalindrome());
		specialWordDetector = new SpecialWordDetector();
		DetectorLoader.getInstance().removeDetectors();
		assertTrue(specialWordDetector.isWordSpecial("madam"));
	}
}