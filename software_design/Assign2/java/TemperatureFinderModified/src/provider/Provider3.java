package provider;

import com.provider3.QueryTemperature;

public class Provider3 extends QueryTemperature implements IProvider
{
  
	public Integer fetchTemperature(int cityID) throws RuntimeException
	{
		
		return new com.provider3.QueryTemperature().queryForTemperature(cityID);
	}
}
