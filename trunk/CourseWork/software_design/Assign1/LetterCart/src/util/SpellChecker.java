package util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

import com.swabunga.spell.engine.SpellDictionary;
import com.swabunga.spell.engine.SpellDictionaryHashMap;

public class SpellChecker
{
	public static boolean isCorrect(String word)
	{
		word=word.trim();
		String dictFile = "dict/english.0";
		SpellDictionary dictionary = null;
		com.swabunga.spell.event.SpellChecker spellCheck = null;
		try
		{
		 dictionary = new SpellDictionaryHashMap(new File(dictFile));
		} catch (FileNotFoundException e)
		{
			e.printStackTrace();
		} catch (IOException e)
		{
			e.printStackTrace();
		}
		
		spellCheck = new com.swabunga.spell.event.SpellChecker(dictionary);
		return spellCheck.isCorrect(word);
	}
	
	public static boolean isPalindrome(String word)
	{
		word=word.trim();
		if(word.length()<2)return false;
		
		String reverse=new StringBuilder(word).reverse().toString();
		return word.toString().equalsIgnoreCase(reverse);
	}
	
}
