package provider;

public interface IProvider
{
	public Integer fetchTemperature(int cityID) throws RuntimeException;
}
