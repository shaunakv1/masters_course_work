import java.io.IOException;

import writers.Writer;
import junit.framework.TestCase;

public abstract class WriterTest extends TestCase
{
	Writer writer;

	protected void setUp() throws Exception
	{
		writer=createWriter();
	}

	protected abstract Writer createWriter() throws IOException;

	protected abstract  void verifyContents(String expected) throws IOException;

	public void testCanary()
	{
		assertTrue(true);
	}

	public void testCreateStringWriter() throws IOException
	{
		verifyContents("");
	}

	public void testWrite() throws IOException
	{
		writer.write("test");
		verifyContents("test");
	}

	public void testMultipleWrites() throws IOException
	{
		writer.write("test");
		writer.write("test");

		verifyContents("testtest");
	}

	public void testWriteBeforeClose() throws IOException
	{
		writer.write("test");
		writer.write("test");
		writer.close();
		verifyContents("testtest");
	}

	public void testCloseAndWrite() throws IOException
	{
		writer.write("test");
		writer.close();
		writer.write("test again");
		verifyContents("test");

	}

}
