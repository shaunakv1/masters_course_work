import junit.framework.TestCase;
import operators.LowerCaseOperator;
import operators.Operator;

import org.junit.Before;

import writers.NiceWriter;
import writers.StringWriter;

public class LowerCaseOperatorTest extends TestCase
{
	private Operator operator;
	private StringWriter writer;

	@Before
	public void setUp() throws Exception
	{
		writer=new StringWriter();
		operator = new LowerCaseOperator(new NiceWriter(writer));
	}
	
	public void testUpperToLower()
	{
		operator.write("CHECK ME");
		assertEquals("check me", writer.getContents());
	}
	
	public void testLowerToLower()
	{
		operator.write("check me");
		assertEquals("check me", writer.getContents());
	}
	
	public void testMixedToLower()
	{
		operator.write("ChecK Me");
		assertEquals("check me", writer.getContents());
	}
}
