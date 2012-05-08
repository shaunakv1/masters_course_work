import writers.StringWriter;

public class StringWriterTest extends WriterTest
{

	StringWriter stringWriter;

	protected StringWriter createWriter()
	{
		stringWriter=new StringWriter();
		return stringWriter;
	}
	
	protected void verifyContents(String expected)
	{
		assertEquals(expected, stringWriter.getContents());
	}
}
