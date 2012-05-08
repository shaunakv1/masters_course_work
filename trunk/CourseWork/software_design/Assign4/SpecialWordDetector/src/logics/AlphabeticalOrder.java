package logics;

import ilogics.DetectionLogic;
import java.util.Arrays;

public class AlphabeticalOrder implements DetectionLogic
{
	public boolean isSpecial(String word)
	{
		if (word.trim().length() < 2)
			return false;
		word = word.toLowerCase();
		char[] content = word.toCharArray();
		Arrays.sort(content);
		return word.compareTo(new String(content)) == 0;
	}
}
