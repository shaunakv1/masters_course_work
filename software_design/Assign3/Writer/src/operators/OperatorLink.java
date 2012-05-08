package operators;

public abstract class OperatorLink extends Operator
{
	private Operator next;

	protected OperatorLink(Operator theNext)
	{
		next = theNext;
	}

	public OperatorLink()
	{
		
	}
	
	public void write(String string)
	{
		string=operate(string);
		next.write(string);
	}
	 
	protected abstract String operate(String s);
	
}