package model;

import java.util.Random;

public class Shelf
{
	private static final Integer CAPACITY = 6;
	private static final Character BLANK = ' ';
	private StringBuilder letters;

	public Shelf()
	{
		letters = new StringBuilder(CAPACITY);
		for (int i = 0; i < CAPACITY; i++)
			letters.append(" ");
		fillEmptySlots();
	}

	private void fillEmptySlots()
	{
		Random rand = new Random(System.currentTimeMillis());
		int randomChar;

		for (int i = 0; i < CAPACITY; i++)
		{

			if (letters.charAt(i) == BLANK)
			{
				randomChar = rand.nextInt(26);
				letters.setCharAt(i, (char) (97 + randomChar));
			}
		}
	}

	private Character removeCharacterAt(int location) throws ArrayIndexOutOfBoundsException
	{
		Character ch = letters.charAt(location);
		letters.setCharAt(location, BLANK);
		return ch;
	}

	public Character selectLetterAt(int location)
	{
		Character ch = removeCharacterAt(location);
		fillEmptySlots();
		return ch;
	}

	public String getLetters()
	{
		return letters.toString();
	}
}
