package controller;

import model.Cart;
import model.ScoreCalculator;
import model.ScoreKeeper;
import model.Shelf;
import util.SpellChecker;

public class GameController
{
	private Character selectedLetter = null;
	private Shelf shelf;
	private Cart cart;
	private ScoreKeeper score;

	public Character actionSelectLetterFromShelf(int position)
	{
		if (selectedLetter == null)
		{
			selectedLetter = shelf.selectLetterAt(position);
			return (selectedLetter);
		} else
			return null;
	}

	public Integer actionDiscardSelectedLetteraAndReturnCurrentScore()
	{
		if (selectedLetter != null)
		{
			score.updateScore(ScoreCalculator.calculateDiscardedLetterScore(selectedLetter));
			selectedLetter = null;
			return score.getScore();
		} else
			return null;
	}

	public Character actionInsertSelectedLetterInCart(int position)
	{
		if (selectedLetter != null)
		{
			char tempChar = selectedLetter;
			selectedLetter = null;
			cart.addLetter(position, tempChar);
			return tempChar;

		} else
			return null;
	}

	public boolean isCollectActionValid()
	{
		if (SpellChecker.isCorrect(cart.getLetters()))
			return true;
		else
			return false;
	}

	public String actionDiscardCart()
	{
		if (!cart.getLetters().trim().isEmpty())
		{
			score.updateScore(ScoreCalculator.calculateDiscardedCartScore(cart.getLetters()));

			return cart.clearCart();
		} else
			return null;
	}

	public String actionCollectCart()
	{
		if (SpellChecker.isCorrect(cart.getLetters()))
		{
			score.updateScore(ScoreCalculator.calculateCollectedCartScore(cart.getLetters(), SpellChecker.isPalindrome(cart.getLetters())));

			return cart.clearCart();
		} else
			return null;
	}

	public String actionGetShelfLetters()
	{
		return shelf.getLetters();
	}

	public int actionGetCurrentScore()
	{
		return score.getScore();
	}

	public void actionSetSelectedLetter(char letter)
	{
		selectedLetter = letter;
	}

	public GameController()
	{
		cart = new Cart();
		shelf = new Shelf();
		score = new ScoreKeeper();
	}
}
