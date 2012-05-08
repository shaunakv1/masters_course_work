import junit.framework.TestCase;
import controller.GameController;

public class GameControllerTest extends TestCase
{
	GameController game;

	public void setUp() throws Exception
	{
		game = new GameController();
	}

	public void testToEnsureEmptyCartCannotBeDiscarded()
	{
		assertNull("Test Failed because empty cart got discarded and returned a not null string", game.actionDiscardCart());
	}

	public void testIfDiscardCartReturnsExpectedScore()
	{
		int initialScore = game.actionGetCurrentScore();
		String initialShelfLetters = game.actionGetShelfLetters();

		game.actionSelectLetterFromShelf(0);
		game.actionInsertSelectedLetterInCart(0);
		game.actionSelectLetterFromShelf(1);
		game.actionInsertSelectedLetterInCart(1);
		game.actionSelectLetterFromShelf(2);
		game.actionInsertSelectedLetterInCart(2);

		int expectedScoreChange = -((Character.getNumericValue(initialShelfLetters.charAt(0)) - 9) + (Character.getNumericValue(initialShelfLetters.charAt(1)) - 9) + (Character.getNumericValue(initialShelfLetters.charAt(2)) - 9) + 10);

		int expectedScore = initialScore + expectedScoreChange;

		game.actionDiscardCart();
		assertEquals("Failed because score returned does not match the expected value", expectedScore, game.actionGetCurrentScore());
	}

	public void testIfCollectCartReturnsExpectedScore()
	{

		int initialScore = game.actionGetCurrentScore();

		game.actionSetSelectedLetter('c');
		game.actionInsertSelectedLetterInCart(0);
		game.actionSetSelectedLetter('a');
		game.actionInsertSelectedLetterInCart(1);
		game.actionSetSelectedLetter('t');
		game.actionInsertSelectedLetterInCart(2);

		int expectedScoreChange = ((Character.getNumericValue('c') - 9) + (Character.getNumericValue('a') - 9) + (Character.getNumericValue('t') - 9));

		int expectedScore = initialScore + expectedScoreChange;

		game.actionCollectCart();
		assertEquals("Failed because score returned does not match the expected value", expectedScore, game.actionGetCurrentScore());
	}

	public void testIfCollectCartReturnsExpectedScoreForPalindromes()
	{

		int initialScore = game.actionGetCurrentScore();

		game.actionSetSelectedLetter('m');
		game.actionInsertSelectedLetterInCart(0);
		game.actionSetSelectedLetter('o');
		game.actionInsertSelectedLetterInCart(1);
		game.actionSetSelectedLetter('m');
		game.actionInsertSelectedLetterInCart(2);

		int expectedScoreChange = ((Character.getNumericValue('m') - 9) + (Character.getNumericValue('o') - 9) + (Character.getNumericValue('m') - 9) + 50);

		int expectedScore = initialScore + expectedScoreChange;

		game.actionCollectCart();
		assertEquals("Failed because score returned does not match the expected value", expectedScore, game.actionGetCurrentScore());
	}

	public void testIfCollectActionEnabledForValidWord()
	{

		game.actionSetSelectedLetter('c');
		game.actionInsertSelectedLetterInCart(0);
		game.actionSetSelectedLetter('a');
		game.actionInsertSelectedLetterInCart(1);
		game.actionSetSelectedLetter('t');
		game.actionInsertSelectedLetterInCart(2);
		assertTrue("test failed because collect action was Disabled for a valid word", game.isCollectActionValid());
	}

	public void testIfCollectActionIsDisabledForInvalidWord()
	{

		game.actionSetSelectedLetter('c');
		game.actionInsertSelectedLetterInCart(0);
		game.actionSetSelectedLetter('x');
		game.actionInsertSelectedLetterInCart(1);
		game.actionSetSelectedLetter('t');
		game.actionInsertSelectedLetterInCart(2);

		assertFalse("test failed because collect action was enabled for a invalid word", game.isCollectActionValid());
	}

	public void testIfLetterIsInsertedInCartAtexpectedPosition()
	{
		game.actionSetSelectedLetter('c');
		game.actionInsertSelectedLetterInCart(4);
		String lettersFromCart = game.actionDiscardCart();
		assertEquals("Failed Because letter not inserted at expected position", 'c', lettersFromCart.charAt(4));

	}

	public void testIfDiscardedLetterFromShelfIsScoredCorrectly()
	{
		int initialScore = game.actionGetCurrentScore();
		game.actionSetSelectedLetter('c');

		int expectedScoreChange = -((Character.getNumericValue('c') - 9));

		int expectedScore = initialScore + expectedScoreChange;
		
		assertEquals("Failed because discard letter action was not scored as expected",expectedScore, game.actionDiscardSelectedLetteraAndReturnCurrentScore().intValue());

	}

}