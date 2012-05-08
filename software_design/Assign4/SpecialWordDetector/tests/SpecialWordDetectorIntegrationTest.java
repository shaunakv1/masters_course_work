import specialworddetector.SpecialWordDetector;
import junit.framework.TestCase;

public class SpecialWordDetectorIntegrationTest extends TestCase
{
	SpecialWordDetector specialWordDetector;
	public void setUp() throws Exception
	{
		specialWordDetector = new SpecialWordDetector();
	}
	public void testIfWordSpecial() throws Exception
	{
		assertTrue(specialWordDetector.isWordSpecial("madam"));
	}
	public void testIfWordNotSpecial() throws Exception
	{
		assertFalse(specialWordDetector.isWordSpecial("madm"));
	}
}
