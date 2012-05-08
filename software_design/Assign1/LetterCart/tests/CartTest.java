import model.Cart;
import exceptions.CartOverwriteException;
import junit.framework.TestCase;

public class CartTest extends TestCase
{
	Cart cart;

	protected void setUp() throws Exception
	{
		cart = new Cart();
	}

	public void testCanary()
	{
		assertTrue(true);
		
	}

	public void testCreateCart()
	{
		assertNotNull(cart);
	}

	public void testIfCartBlankOnCreate()
	{
		String letters = cart.getLetters();

		for (char ch : letters.toCharArray())
		{
			assertEquals(' ', ch);
		}
	}

	public void testIfCartBlankOnClear()
	{
		cart.addLetter(1, 'h');
		cart.addLetter(3, 'a');
		cart.addLetter(5, 'f');

		cart.clearCart();

		String aCart = cart.getLetters();
		for (char ch : aCart.toCharArray())
		{
			assertEquals(' ', ch);
		}

	}

	public void testIfLetterAddedAsExpected()
	{
		cart.addLetter(3, 's');
		assertEquals('s',cart.getLetters().charAt(3));
	}

	public void testOutOfBoundsLetterAdditions()
	{
		try
		{
			cart.addLetter(7, 's');
			fail("Test Failed because No Exception received even if index was out of bound");
		} catch (StringIndexOutOfBoundsException e)
		{
			//success
		}
	}

	public void testToEnsureOverWritingNotAllowed()
	{
		try
		{
			int someLocation = 3;
			cart.addLetter(someLocation, 's');
			cart.addLetter(someLocation, 'a');
			fail("Test Failed because No Exception thrown even if overwriting was performed");
		} catch (CartOverwriteException e)
		{
			//success
		}
	}
}
