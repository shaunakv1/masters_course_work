import junit.framework.TestCase;
import operators.DuplicateRemoverOperator;
import operators.LowerCaseOperator;
import operators.Operator;
import operators.StupidRemoverOperator;
import operators.UpperCaseOperator;

import org.junit.Before;

import writers.NiceWriter;
import writers.StringWriter;

public class MixedOperatorTest extends TestCase
{
	private Operator operator;
	private StringWriter writer;

	@Before
	public void setUp() throws Exception
	{
		writer = new StringWriter();
	}

	public void testLowerWithUpper()
	{
		operator = new LowerCaseOperator(new UpperCaseOperator(new NiceWriter(writer)));
		operator.write("CHECK ME");
		assertEquals("CHECK ME", writer.getContents());
	}
	
	public void testLowerWithStupidRemover()
	{
		operator = new LowerCaseOperator(new StupidRemoverOperator(new NiceWriter(writer)));
		operator.write("Am I stupid");
		assertEquals("am i s*****", writer.getContents());
	}

	public void testUpperDuplicateRoverOperator()
	{
		operator = new UpperCaseOperator(new DuplicateRemoverOperator(new NiceWriter(writer)));
		operator.write("Am I really really stupid");
		assertEquals("AM I REALLY STUPID", writer.getContents());
	}
	public void testStupidRemoverDuplicateRemoverAndUpper()
	{
		operator = new StupidRemoverOperator(new DuplicateRemoverOperator(new UpperCaseOperator(new NiceWriter(writer))));
		operator.write("Am I really really stupid");
		assertEquals("AM I REALLY S*****", writer.getContents());
	}
	
}
