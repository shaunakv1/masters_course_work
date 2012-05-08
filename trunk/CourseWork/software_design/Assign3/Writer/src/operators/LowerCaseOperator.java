package operators;


public class LowerCaseOperator extends OperatorLink
{
	public LowerCaseOperator(Operator theNext)
	{
		super(theNext);
	}

	@Override
	public String operate(String string)
	{
		return string.toLowerCase();
	}

}
