package operators;

import writers.Writer;


public abstract class Operator
{
	protected Operator (Writer writer)
	{
	
	}
	
	public Operator()
	{
		
	}
	
	public abstract void write(String string);
}
