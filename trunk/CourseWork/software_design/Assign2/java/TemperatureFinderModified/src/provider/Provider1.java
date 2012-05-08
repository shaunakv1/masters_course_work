package provider;

import com.provider1.TemperatureProvider;

public class Provider1 extends TemperatureProvider implements IProvider 
{

	public Integer fetchTemperature(int cityID)throws RuntimeException
	{
		return new com.provider1.TemperatureProvider().getTemperature(cityID);
	}

}
