import junit.framework.TestCase;
import operators.Operator;
import operators.UpperCaseOperator;

import org.junit.Before;

import writers.NiceWriter;
import writers.StringWriter;

public class UpperCaseOperatorTest extends TestCase
{
	private Operator operator;
	private StringWriter writer;

	@Before
	public void setUp() throws Exception
	{
		writer=new StringWriter();
		operator = new UpperCaseOperator(new NiceWriter(writer));
	}
	
	public void testLowerToUpper()
	{
		operator.write("check me");
		assertEquals("CHECK ME", writer.getContents());
	}
	
	public void testUpperToUpper()
	{
		operator.write("CHECK ME");
		assertEquals("CHECK ME", writer.getContents());
	}
	
	public void testMixedToUpper()
	{
		operator.write("ChecK Me");
		assertEquals("CHECK ME", writer.getContents());
	}
}
