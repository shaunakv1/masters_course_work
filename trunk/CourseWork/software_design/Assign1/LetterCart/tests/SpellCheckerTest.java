import util.SpellChecker;
import junit.framework.TestCase;

public class SpellCheckerTest extends TestCase
{
	public void testIfSpellCheckerDetectsCorrectSpelling()
	{
		assertTrue("Failed because spell check declared a correct spelling wrong", SpellChecker.isCorrect("quick"));

	}

	public void testIfSpellCheckerDetectsWrongSpelling()
	{
		assertFalse("Failed because spell check declared a wrong spelling correct", SpellChecker.isCorrect("ick"));
	}

	public void testIfSpellCheckerIgnoresBlanksBeforeAndAfter()
	{
		assertTrue("Failed because spell check failed to detect blanks", SpellChecker.isCorrect(" quick  "));
	}

	public void testIfPalindromeCheckerDetectsCorrectPalindrome()
	{
		assertTrue("Failed because palindrome check declared a correct palindrom wrong", SpellChecker.isPalindrome("Mom"));
	}

	public void testIfPalindromeCheckerDetectsWrongPalindrome()
	{
		assertFalse("Failed because spell check declared a wrong palindrome correct", SpellChecker.isPalindrome("Tim"));
	}

	public void testIfPalindromeCheckerDetectsBlankStringAsWrongPalindrome()
	{
		assertFalse("Failed because spell check declared a blank string as  correct palindrome", SpellChecker.isPalindrome("   "));
	}

	public void testIfPalindromeCheckerDetectsSingleLetterAsWrongPalindrome()
	{
		assertFalse("Failed because spell check declared a blank string as  correct palindrome", SpellChecker.isPalindrome("n"));
	}

	public void testIfPalindromeCheckerIgnoresBlanksBeforeAndAfter()
	{
		assertTrue("Failed because palindrome check failed to detect blanks", SpellChecker.isPalindrome(" madam  "));
	}

}
