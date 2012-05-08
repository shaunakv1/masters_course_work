package game;

import ui.GameBoard;
import controller.GameController;

public class LetterCart
{
	public static void main(String[] args)
	{
		new GameBoard(new GameController());
	}
}
