package model;

public class ScoreCalculator
{
	private static final int PALINDROME_CREDIT = 50;
	private static final int DISCARD_PENALTY = 10;

	private static int getLetterScore(Character letter)
	{
		return Character.getNumericValue(letter) - 9;
	}

	public static int calculateCollectedCartScore(String letters, Boolean isPalindrome)
	{
		letters = letters.trim();

		int total = 0;
		for (Character letter : letters.toCharArray())
			if (Character.isLetter(letter))
				total += getLetterScore(letter);

		if (isPalindrome)
			total += PALINDROME_CREDIT;

		return total;
	}

	public static int calculateDiscardedCartScore(String letters)
	{
		letters = letters.trim();

		int total = 0;
		for (Character letter : letters.toCharArray())
			if (Character.isLetter(letter))
				total += getLetterScore(letter);

		total += DISCARD_PENALTY;

		return (-total);
	}

	public static int calculateDiscardedLetterScore(Character letter)
	{
		return -getLetterScore(letter);
	}
}
