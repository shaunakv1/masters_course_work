package ui;

import java.awt.Color;
import java.awt.Font;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

import controller.GameController;

public class GameBoard extends JPanel implements ActionListener
{
	private static final long serialVersionUID = -8046692517247258087L;

	private List<JButton> cartButtons;
	private List<JButton> shelfButtons;
	private JLabel scoreValueLabel;
	private JLabel selectedLetterLabel;
	private JButton collectCart;
	private GameController game;

	private static final String BUTTON_TYPE_CART = "c";
	private static final String BUTTON_TYPE_SHELF = "s";
	private static final String DISCARD_LETTER_BUTTON = "Discard Letter";
	private static final String DISCARD_CART_BUTTON = "Discard Cart";
	private static final String COLLECT_CART_BUTTON = "Collect Cart";

	public GameBoard(GameController game)
	{
		this.game = game;
		cartButtons = new ArrayList<JButton>();
		shelfButtons = new ArrayList<JButton>();

		int shelfSize = 6;
		int cartSize = 7;

		JButton b;
		for (int i = 0; i < shelfSize; i++)
		{
			b = new JButton(" ");
			b.setName(BUTTON_TYPE_SHELF + i);
			b.addActionListener(this);
			shelfButtons.add(b);
		}

		for (int i = 0; i < cartSize; i++)
		{
			b = new JButton(" ");
			b.setName(BUTTON_TYPE_CART + i);
			b.addActionListener(this);
			cartButtons.add(b);
		}

		setLayout(new GridBagLayout());
		GridBagConstraints c = new GridBagConstraints();

		int gridYValue = -1;

		c.fill = GridBagConstraints.HORIZONTAL;
		c.weightx = 0.5;

		//Shelf Label
		JLabel shelfLabel = new JLabel("SHELF");
		c.gridy = ++gridYValue;
		c.gridx = 2;
		c.gridwidth = 2;
		add(shelfLabel, c);

		// Shelf Buttons
		c.gridy = ++gridYValue;
		c.gridwidth = 1;
		for (int i = 0; i < shelfButtons.size(); i++)
		{
			c.gridx = i;
			add(shelfButtons.get(i), c);
		}

		//Selected Letter Label
		JLabel selectedLabel = new JLabel("selected");
		c.gridy = ++gridYValue;
		c.gridx = 0;
		c.gridwidth = 2;
		add(selectedLabel, c);

		//Selected Letter Holder Label
		selectedLetterLabel = new JLabel(" ");
		selectedLetterLabel.setOpaque(true);
		selectedLetterLabel.setBackground(Color.BLACK);
		selectedLetterLabel.setForeground(Color.GREEN);
		c.gridx = 2;
		c.gridwidth = 1;
		add(selectedLetterLabel, c);

		// Discard letter Button
		JButton discardLetter = new JButton(DISCARD_LETTER_BUTTON);
		c.gridx = 3;
		c.gridwidth = 3;
		discardLetter.addActionListener(this);
		add(discardLetter, c);

		//Cart Label
		JLabel cartLabel = new JLabel("CART");
		c.gridy = ++gridYValue;
		c.gridx = 2;
		c.gridwidth = 2;
		add(cartLabel, c);

		//Cart Buttons
		c.gridy = ++gridYValue;
		c.gridwidth = 1;
		for (int i = 0; i < cartButtons.size(); i++)
		{
			c.gridx = i;
			add(cartButtons.get(i), c);
		}

		// Collect Button
		collectCart = new JButton(COLLECT_CART_BUTTON);
		c.gridy = ++gridYValue;
		c.gridx = 0;
		c.gridwidth = 2;
		collectCart.addActionListener(this);
		collectCart.setVisible(false);
		add(collectCart, c);

		// Discard Button
		JButton discardCart = new JButton(DISCARD_CART_BUTTON);
		c.gridx = 5;
		c.gridwidth = 2;
		discardCart.addActionListener(this);
		add(discardCart, c);

		// Score Label
		JLabel scoreLabel = new JLabel("Score");
		scoreLabel.setFont(new Font("Arial", Font.BOLD, 25));
		c.gridy = ++gridYValue;
		c.gridx = 1;
		c.gridwidth = 2;
		add(scoreLabel, c);

		//Score Holder Label
		scoreValueLabel = new JLabel();
		scoreValueLabel.setFont(new Font("Arial", Font.BOLD, 25));
		c.gridx = 3;
		c.gridwidth = 2;
		scoreValueLabel.setText("0");
		add(scoreValueLabel, c);

		//Initiate shelf
		fillShelfButtons(game.actionGetShelfLetters());
		//Render GameController Window

		JFrame frame = new JFrame("LetterCart");
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		this.setOpaque(true);
		frame.setContentPane(this);
		frame.pack();
		frame.setSize(350, 210);
		frame.setVisible(true);
	}

	public void actionPerformed(ActionEvent e)
	{
		String buttonName = e.getActionCommand();
		if (buttonName.equals(DISCARD_LETTER_BUTTON))
		{
			Integer score = game.actionDiscardSelectedLetteraAndReturnCurrentScore();
			if (score != null)
			{
				scoreValueLabel.setText(score + "");
				selectedLetterLabel.setText(" ");
			}

		} else if (buttonName.equals(DISCARD_CART_BUTTON))
		{

			if (game.actionDiscardCart() != null)
			{
				Integer score = game.actionGetCurrentScore();
				scoreValueLabel.setText(score + "");
				for (JButton button : cartButtons)
					button.setText(" ");
			}

		} else if (buttonName.equals(COLLECT_CART_BUTTON))
		{

			if (game.actionCollectCart() != null)
			{
				Integer score = game.actionGetCurrentScore();
				scoreValueLabel.setText(score + "");
				for (JButton button : cartButtons)
					button.setText(" ");
			}
		} else
		{
			String buttonType = ((JButton) e.getSource()).getName().substring(0, 1);
			int buttonId = Integer.parseInt(((JButton) e.getSource()).getName().substring(1));

			if (buttonType.equals(BUTTON_TYPE_SHELF))
			{
				Character selectedLetter = game.actionSelectLetterFromShelf(buttonId);
				if (selectedLetter != null)
				{
					selectedLetterLabel.setText("" + selectedLetter);
					fillShelfButtons(game.actionGetShelfLetters());
				}
			}
			if (buttonType.equals(BUTTON_TYPE_CART))
			{
				Character selectedLetter = game.actionInsertSelectedLetterInCart(buttonId);
				if (selectedLetter != null)
				{
					cartButtons.get(buttonId).setText("" + selectedLetter);
					selectedLetterLabel.setText(" ");
					collectCart.setVisible(game.isCollectActionValid());
				}

			}

		}
	}

	private void fillShelfButtons(String letters)
	{
		char letterArray[] = letters.toCharArray();
		for (int i = 0; i < letterArray.length; i++)
		{
			shelfButtons.get(i).setText("" + letterArray[i]);
		}
	}

}
