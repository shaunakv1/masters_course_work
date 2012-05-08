package model;

import exceptions.CartOverwriteException;

public class Cart
{
	private static final Character BLANK = ' ';
	private StringBuilder letters =new StringBuilder("       ");

	private void blankTheCart()
	{
		letters =new StringBuilder("       ");
	}

	public String getLetters()
	{
		return letters.toString();
	}

	public String clearCart()
	{
		String tempString = letters.toString();
		blankTheCart();
		return tempString;
	}

	public void addLetter(int location, char aChar)
	{
		if (letters.charAt(location) != BLANK)
			throw new CartOverwriteException("Cant Overwrite a Letter in Cart");

		letters.setCharAt(location, aChar);
	}
}
