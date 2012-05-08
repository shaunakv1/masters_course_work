package operators;

public class StupidRemoverOperator extends OperatorLink
{
	public StupidRemoverOperator(Operator theNext)
	{
		super(theNext);
	}
	
	@Override
	public String operate(String string)
	{
		return string.replaceAll("stupid","s*****");
	}
	
}

