import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import writers.FileWriter;

public class FileWriterTest extends WriterTest
{

	String filePath = "./build/" + "testfile.txt";

	FileWriter fileWriter;

	protected FileWriter createWriter() throws IOException
	{
		fileWriter=new FileWriter(filePath);
		return fileWriter;
	}

	protected void verifyContents(String expected) throws IOException
	{
		byte[] buffer = new byte[(int) new File(filePath).length()];

		FileInputStream f = new FileInputStream(filePath);
		f.read(buffer);
	    assertEquals(expected, new String(buffer));
	}

	public void testIfPreexistingFileIsOverwritten() throws IOException
	{
		fileWriter.write("test");
		fileWriter.close();
		fileWriter = new FileWriter(filePath);
		verifyContents("");
	}
}
