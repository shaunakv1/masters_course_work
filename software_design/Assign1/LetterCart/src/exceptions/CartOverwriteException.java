package exceptions;

public class CartOverwriteException extends RuntimeException
{
	private static final long serialVersionUID = 1L;

	public CartOverwriteException(String message)
	{
		super(message);
	}

}
