package logics;

import ilogics.DetectionLogic;

public class IsWordPalindrome implements DetectionLogic
{
	public boolean isSpecial(String word)
	{
		if (word.trim().length() < 2)
			return false;
		String reverse = new StringBuilder(word).reverse().toString();
		return word.toString().equalsIgnoreCase(reverse);
	}
}
