package factory;

import provider.IProvider;

public class ProviderFactory implements AbstractProviderFactory
{
	public IProvider getProvider(String classPath)
	{
	 try
		{
		  return (IProvider)Class.forName(classPath).newInstance();
		} catch (Exception e)
		{
		 e.printStackTrace();
		} 
        return null;
	}
}
