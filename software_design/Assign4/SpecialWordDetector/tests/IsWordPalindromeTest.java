import junit.framework.TestCase;
import logics.IsWordPalindrome;

public class IsWordPalindromeTest extends TestCase
{
	IsWordPalindrome isPalindrome;

	public void setUp()
	{
		isPalindrome = new IsWordPalindrome();
	}

	public void testCanary()
	{
		assertTrue(true);
	}

	public void testIfPalindromeMadam()
	{
		assertTrue("Expected Madam to be a palindrome ", isPalindrome.isSpecial("madam"));
	}

	public void testIfPalindromeMadm()
	{
		assertFalse("Expected Madm not to be a palidnrome", isPalindrome.isSpecial("madm"));
	}

	public void testIfPalindromeSingleLetter()
	{
		assertFalse("Expected r not to be a palindrome", isPalindrome.isSpecial("r"));
	}

	public void testIfPalindromeBlankString()
	{
		assertFalse("Expected blank not to be a palindrome", isPalindrome.isSpecial("   "));
	}

}
