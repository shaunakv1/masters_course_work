package model;

public class ScoreKeeper
{
	private  int score=0;
	
	public void updateScore(int scoreChange)
	{
		score+=scoreChange;
	}
	public int getScore()
	{
		return score;
	}
	
}
