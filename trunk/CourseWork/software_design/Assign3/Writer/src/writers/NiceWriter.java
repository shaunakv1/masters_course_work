package writers;

import operators.Operator;

public class NiceWriter extends Operator
{
	private Writer writer;

	public NiceWriter(Writer writer)
	{
		this.writer = writer;
	}

	@Override
	public void write(String string)
	{
		writer.write(string);

	}

}
