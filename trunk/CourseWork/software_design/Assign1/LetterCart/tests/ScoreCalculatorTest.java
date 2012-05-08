
import junit.framework.TestCase;
import model.ScoreCalculator;

public class ScoreCalculatorTest extends TestCase
{
	public void testIfDiscardedLetterIsScoredCorrectly()
	{
		assertEquals("Test Failed because discarded letter score was incorrect", -3, ScoreCalculator.calculateDiscardedLetterScore('c'));
	}
	
	public void testIfDiscardedCartIsScoredCorrectly()
	{
		assertEquals("Test Failed because discarded Cart score was incorrect", -34, ScoreCalculator.calculateDiscardedCartScore("atc"));
	}
	
	public void testIfCollectedNonPalindromeCartIsScoredCorrectly()
	{
		assertEquals("Test Failed because collected Cart score was incorrect", 24, ScoreCalculator.calculateCollectedCartScore("cat", false));
	}
	
	public void testIfCollectedPalindromeCartIsScoredCorrectly()
	{
		assertEquals("Test Failed because collected Cart score was incorrect", 74, ScoreCalculator.calculateCollectedCartScore("cat", true));
	}
}
