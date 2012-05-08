package writers;

public class StringWriter implements Writer
{
	private StringBuilder writtenString= new StringBuilder();
	private boolean closed;

	public void write(String string)
	{
		if (!closed)
		{
			writtenString.append(string);
		}
	}

	public String getContents()
	{
		return writtenString.toString();
	}

	public void close()
	{
		closed = true;
	}
}
