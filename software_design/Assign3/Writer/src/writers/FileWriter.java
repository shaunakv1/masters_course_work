package writers;

import java.io.IOException;
import java.io.PrintWriter;

public class FileWriter implements Writer
{
	private String filePath;
	private PrintWriter fileWriter;
	private boolean closed;

	public FileWriter(String fileName) throws IOException
	{
		filePath = fileName;
		fileWriter = new PrintWriter(new java.io.FileWriter(filePath));
	}

	public void write(String string)
	{
		if (!closed)
		{
			fileWriter.print(string);
			fileWriter.flush();
		}
	}

	public void close()
	{
		closed = true;
	}

}
