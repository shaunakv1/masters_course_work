package operators;

import java.util.StringTokenizer;

public class DuplicateRemoverOperator extends OperatorLink
{
	public DuplicateRemoverOperator(Operator theNext)
	{
		super(theNext);
	}

	@Override
	public String operate(String string)
	{
		StringTokenizer st = new StringTokenizer(string);
		String token1 = null, token2 = null;
		String processedString = string;

		if (st.hasMoreTokens())
			token1 = st.nextToken();

		while (st.hasMoreTokens())
		{
			token2 = st.nextToken();
			if (token1.equals(token2))
			{
				processedString = processedString.replaceFirst(token1+" ", "");
			}
			token1 = new String(token2);
		}

		return processedString;

	}

}
