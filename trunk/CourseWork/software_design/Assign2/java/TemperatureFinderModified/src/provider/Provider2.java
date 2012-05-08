package provider;

import com.provider2.TemperatureFinder;

public class Provider2 extends TemperatureFinder implements  IProvider
{

	public Integer fetchTemperature(int cityID) throws RuntimeException
	{
		return new com.provider2.TemperatureFinder().findTemperature(cityID);
	}

}
