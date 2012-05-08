import junit.framework.TestCase;
import model.Shelf;

public class ShelfTest extends TestCase
{
	Shelf shelf;

	protected void setUp() throws Exception
	{
		shelf = new Shelf();
	}

	public void testCanary()
	{
		assertTrue(true);
	}

	public void testCreateShelf()
	{
		assertNotNull(shelf);
	}

	public void testShelfFilledOnCreate()
	{
		String aShelf = shelf.getLetters();

		for (Character ch : aShelf.toCharArray())
		{
			assertTrue(Character.isLetter(ch));
		}
	}

	public void testSelectLetterFromShelf()
	{
		Character ch = shelf.selectLetterAt(4);
		assertTrue(Character.isLetter(ch));
	}

	public void testIfSlotIsRefilledImmediatelyAfterSelection()
	{
		Character ch = shelf.selectLetterAt(3);
		ch = shelf.selectLetterAt(3);
		assertTrue(Character.isLetter(ch));
	}

	public void testOutOfBoundsSelection()
	{
		try
		{
			shelf.selectLetterAt(7);
			fail("Test Failed because No Exception received even if index was out of bound");
		} catch (StringIndexOutOfBoundsException e)
		{
			//success
		}
	}

	public void testBoundaryValuesSelection()
	{
		Character ch = shelf.selectLetterAt(0);
		assertTrue(Character.isLetter(ch));
		ch = shelf.selectLetterAt(5);
		assertTrue(Character.isLetter(ch));
	}

	public void testRandomnessAmongstShelfCharacters()
	{
		int numberOfInstancesWhenCharsAreEqual = 0;

		shelf = new Shelf();
		Character ch1 = shelf.selectLetterAt(0);
		Character ch2 = shelf.selectLetterAt(4);
		if (ch1 == ch2)
			numberOfInstancesWhenCharsAreEqual++;

		shelf = new Shelf();
		ch1 = shelf.selectLetterAt(1);
		ch2 = shelf.selectLetterAt(3);
		if (ch1 == ch2)
			numberOfInstancesWhenCharsAreEqual++;

		shelf = new Shelf();
		ch1 = shelf.selectLetterAt(2);
		ch2 = shelf.selectLetterAt(5);
		if (ch1 == ch2)
			numberOfInstancesWhenCharsAreEqual++;

		shelf = new Shelf();
		ch1 = shelf.selectLetterAt(0);
		ch2 = shelf.selectLetterAt(4);
		if (ch1 == ch2)
			numberOfInstancesWhenCharsAreEqual++;

		assertTrue("Test Failed because letters dont appear to be random", numberOfInstancesWhenCharsAreEqual < 3);
	}

	public void testRandomnessAmongstCharactersInSameSlot()
	{
		int numberOfInstancesWhenCharsAreEqual = 0;

		if (shelf.selectLetterAt(3) == shelf.selectLetterAt(3))
			numberOfInstancesWhenCharsAreEqual++;
			
		assertTrue("Test Failed because letters are not replaced randomly in same slot", numberOfInstancesWhenCharsAreEqual <1);

	}

	public void testGeneralRandomnessInMultipalShelfGenerations()
	{
		int numberOfInstancesWhenCharsAreEqual = 0;

		shelf = new Shelf();
		Character ch1 = shelf.selectLetterAt(0);
		Character ch2 = shelf.selectLetterAt(4);
		if (ch1 == ch2)
			numberOfInstancesWhenCharsAreEqual++;

		shelf = new Shelf();
		ch1 = shelf.selectLetterAt(0);
		ch2 = shelf.selectLetterAt(4);
		if (ch1 == ch2)
			numberOfInstancesWhenCharsAreEqual++;

		shelf = new Shelf();
		ch1 = shelf.selectLetterAt(0);
		ch2 = shelf.selectLetterAt(4);
		if (ch1 == ch2)
			numberOfInstancesWhenCharsAreEqual++;

		shelf = new Shelf();
		ch1 = shelf.selectLetterAt(0);
		ch2 = shelf.selectLetterAt(4);
		if (ch1 == ch2)
			numberOfInstancesWhenCharsAreEqual++;

		assertTrue("Test Failed because letters dont appear to generated at random", numberOfInstancesWhenCharsAreEqual < 3);
	}

}
