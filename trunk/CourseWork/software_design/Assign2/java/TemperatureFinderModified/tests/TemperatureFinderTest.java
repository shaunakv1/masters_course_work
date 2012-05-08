import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import junit.framework.TestCase;
import factory.AbstractProviderFactory;
import factory.ProviderFactory;
import finder.TemperatureFinder;

public class TemperatureFinderTest extends TestCase
{
	TemperatureFinder temperatureFinder;
	List<String> providers;
	AbstractProviderFactory factory;

	@Override
	protected void setUp() throws Exception
	{
		temperatureFinder = new TemperatureFinder();
		factory = new ProviderFactory();

		Properties properties = new Properties();
		try
		{
			properties.load(new FileInputStream("providers.PROPERTIES"));
		} catch (IOException e)
		{
			fail("Failed because Properties file not Fund");
		}

		Integer numberOfProviders = Integer.parseInt(properties.getProperty("number_of_providers"));
		providers = new ArrayList<String>();
		for (int i = 1; i <= numberOfProviders; i++)
			providers.add(properties.getProperty(i + ""));
	}

	public void testCanary()
	{
		assertTrue(true);
	}

	public void testIfFetchTemperatureReturnsTemperatureInfo()
	{
		assertNotNull(temperatureFinder.fetchTemperature(23));
	}

	public void testIfValidTemperatureIsReturned()
	{
		String temperatureInfo = temperatureFinder.fetchTemperature(23);
		int temperature = Integer.parseInt(temperatureInfo.substring(temperatureInfo.indexOf("is") + 3, temperatureInfo.length()));
		assertTrue(temperature > -999);
	}

	public void testIfInformationIsReturnedInExpectedFormat()
	{
		String info = temperatureFinder.fetchTemperature(23);
		assertTrue(info.startsWith("Temperature (as reported by"));
	}

	public void testIfFetchTemperatureReturnsValidProvider()
	{
		String info = temperatureFinder.fetchTemperature(23);
		String provider = info.substring(info.indexOf("by") + 2, info.lastIndexOf(')')).trim();
		assertTrue(providers.contains(provider));
	}

	public void testIfProvider1IsUsedThenOtherProvidersAreNotUsed()
	{
		String info = temperatureFinder.fetchTemperature(23);
		String provider = info.substring(info.indexOf("by") + 2, info.lastIndexOf(')')).trim();

		if (provider.equalsIgnoreCase(providers.get(0)))
		{
			assertEquals(1, temperatureFinder.getAttempts());
		}
	}

	public void testIfProvider2IsUsedThenProvider1HasFailedAndProvider3IsNotUsed()
	{
		String info = temperatureFinder.fetchTemperature(23);
		String provider = info.substring(info.indexOf("by") + 2, info.lastIndexOf(')')).trim();

		if (provider.equalsIgnoreCase(providers.get(1)))
		{
			assertEquals(2, temperatureFinder.getAttempts());
		}
	}

	public void testIfProvider3IsUsedThenOtherProvidersHaveFailed()
	{
		String info = temperatureFinder.fetchTemperature(23);
		String provider = info.substring(info.indexOf("by") + 2, info.lastIndexOf(')')).trim();

		if (provider.equalsIgnoreCase(providers.get(2)))
		{
			assertEquals(3, temperatureFinder.getAttempts());
		}
	}

	public void testToEnsureProvider3AlwaysReturnsTemperature()
	{
		try
		{
			factory.getProvider("provider." + providers.get(2)).fetchTemperature(23);
		} catch (RuntimeException e)
		{
			fail("Failed because Provider 3 failed to return a temperature");
		}

	}

	public void testToEnsureProvider1EitherReturnsTemperatureOrThrowsExpection()
	{
		try
		{
			assertNotNull(factory.getProvider("provider." + providers.get(0)).fetchTemperature(23));
		} catch (RuntimeException e)
		{
			// :)
		}
	}

	public void testToEnsureProvider2EitherReturnsTemperatureOrThrowsExpection()
	{
		try
		{
			assertNotNull(factory.getProvider("provider." + providers.get(1)).fetchTemperature(23));
		} catch (RuntimeException e)
		{
			// :)
		}
	}

}
