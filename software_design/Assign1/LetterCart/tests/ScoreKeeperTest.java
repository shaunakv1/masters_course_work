
import junit.framework.TestCase;
import model.ScoreKeeper;


public class ScoreKeeperTest  extends TestCase
{
	ScoreKeeper scoreKeeper;
	public void setUp() throws Exception
	{
		scoreKeeper=new ScoreKeeper();
	}
	
	public void testScoreIsZeroInitially()
	{
		scoreKeeper=new ScoreKeeper();
		assertEquals(0, scoreKeeper.getScore());
	}
	
	public void testIfScoreIsUpdatedCorrectlyForPositiveValues()
	{
		int initialScore=scoreKeeper.getScore();
		scoreKeeper.updateScore(21);
		assertEquals(initialScore+21, scoreKeeper.getScore());
	}
	
	public void testIfScoreIsUpdatedCorrectlyForNegativeValues()
	{
		int initialScore=scoreKeeper.getScore();
		scoreKeeper.updateScore(-21);
		assertEquals(initialScore-21, scoreKeeper.getScore());
	}
}
