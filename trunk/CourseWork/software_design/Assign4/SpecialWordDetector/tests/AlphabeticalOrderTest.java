
import junit.framework.TestCase;
import logics.AlphabeticalOrder;

public class AlphabeticalOrderTest extends TestCase
{
	AlphabeticalOrder alphabetical;

	public void setUp()
	{
		alphabetical = new AlphabeticalOrder();
	}

	public void testIfAlphabeticalDry()
	{
		assertTrue("Expected dry to be alphabetical", alphabetical.isSpecial("dry"));
	}

	public void testIfAlphabeticalAlMoSt()
	{
		assertTrue("Expected AlMoSt to be alphabetical", alphabetical.isSpecial("AlMoSt"));
	}

	public void testIfAlphabeticalCrow()
	{
		assertFalse("Expected Crow not to be alphabetical", alphabetical.isSpecial("crow"));
	}

	public void testIfAlphabeticalSingleLetter()
	{
		assertFalse("Expected Single Letter to fail", alphabetical.isSpecial("a"));
	}

	public void testIfAlphabeticalBlank()
	{
		assertFalse("Expected blank to fail", alphabetical.isSpecial("   "));
	}
}
