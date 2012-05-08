import provider.IProvider;
import factory.AbstractProviderFactory;
import factory.ProviderFactory;
import junit.framework.TestCase;


public class ProviderFactoryTest extends TestCase
{
	AbstractProviderFactory factory;
	protected void setUp() throws Exception
	{
		factory=new ProviderFactory();
	}
	
	public void testIfFactoryReturnsInstanceOfTheCorrectClass()
	{
		IProvider provider=factory.getProvider("provider.Provider3");
		assertTrue(provider.getClass().getName().equals("provider.Provider3"));
	}
}
