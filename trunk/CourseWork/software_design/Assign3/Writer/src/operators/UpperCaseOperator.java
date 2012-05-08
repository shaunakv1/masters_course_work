package operators;

public class UpperCaseOperator extends OperatorLink
{
	public UpperCaseOperator(Operator theNext)
	{
		super(theNext);
	}

	@Override
	public String operate(String string)
	{
		return string.toUpperCase();
	}

}
