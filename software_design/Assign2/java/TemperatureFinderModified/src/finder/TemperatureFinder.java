package finder;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import factory.AbstractProviderFactory;
import factory.ProviderFactory;

public class TemperatureFinder
{
	List<String> providers;
	
	public TemperatureFinder()
	{
		Properties properties = new Properties();
		try
		{
			properties.load(new FileInputStream("providers.PROPERTIES"));
		} catch (IOException e)
		{
			System.err.println("Properties File Not Found..");
		}

		Integer numberOfProviders = Integer.parseInt(properties.getProperty("number_of_providers"));
		providers = new ArrayList<String>();
				
		for (int i = 1; i <= numberOfProviders; i++)
			providers.add(properties.getProperty(i + ""));

	}
	public String fetchTemperature(int cityID)
	{
		AbstractProviderFactory factory = new ProviderFactory();
		Integer temperature = -999;
		String providerName = null;

		for (String provider : providers)
		{
			try
			{
				attempts++;
				temperature = factory.getProvider("provider."+provider).fetchTemperature(cityID);
				providerName = provider;
				break;
			} catch (RuntimeException e)
			{
				continue;
			}
		}
		
		return String.format("Temperature (as reported by %s) is %s", providerName, temperature.toString());
	}

	//Code below is for aid of automated testing
	Integer attempts=0;
	public int getAttempts()
	{
		return attempts;
	}
	
}