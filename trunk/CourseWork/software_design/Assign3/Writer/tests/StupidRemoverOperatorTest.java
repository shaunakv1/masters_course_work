import junit.framework.TestCase;
import operators.Operator;
import operators.StupidRemoverOperator;

import org.junit.Before;

import writers.NiceWriter;
import writers.StringWriter;

public class StupidRemoverOperatorTest extends TestCase
{
	private Operator operator;
	private StringWriter writer;

	@Before
	public void setUp() throws Exception
	{
		writer=new StringWriter();
		operator = new StupidRemoverOperator(new NiceWriter(writer));
	}
	
	public void testRemoveStupid()
	{
		operator.write("check stupid");
		assertEquals("check s*****", writer.getContents());
	}
	
	public void testMixedCaseStupid()
	{
		operator.write("check Stupid");
		assertEquals("check Stupid", writer.getContents());
	}
	
	public void testNoStupidPresent()
	{
		operator.write("check");
		assertEquals("check", writer.getContents());
	}
}
