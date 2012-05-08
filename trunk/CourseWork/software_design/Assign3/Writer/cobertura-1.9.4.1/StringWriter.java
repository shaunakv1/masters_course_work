package writers;

public class StringWriter
{
	String writtenString ="";
	boolean closed = false;

	public void write(String string)
	{
		if (!isClosed())
		{
			writtenString += string;
		}
	}

	public String getWrittenString()
	{
		return writtenString;
	}

	public void close()
	{
		closed = true;
	}

	public boolean isClosed()
	{
		return closed;
	}

}
