package factory;

import provider.IProvider;

public interface AbstractProviderFactory
{
	public IProvider getProvider(String classPath);
	
}
