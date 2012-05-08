import ilogics.DetectionLogic;
import java.util.ArrayList;
import specialworddetector.DetectorLoader;
import logics.AlphabeticalOrder;
import logics.IsWordPalindrome;
import junit.framework.TestCase;

public class DetectorLoaderTest extends TestCase
{
	public void testNoOfDetectors() throws Exception
	{
		DetectorLoader.getInstance().removeDetectors();
		DetectorLoader.getInstance().addDetectors(new IsWordPalindrome());
		DetectorLoader.getInstance().addDetectors(new AlphabeticalOrder());
		assertEquals(2, DetectorLoader.getInstance().getDetectors().size());
	}

	public void testRemoveDetectorsFromDirectory() throws Exception
	{
		DetectorLoader.getInstance().removeDetectors();
		assertEquals(0, DetectorLoader.getInstance().getDetectors().size());
	}
	
	public void testToCheckClassNamesInDirectory() throws Exception
	{
		ArrayList<DetectionLogic> classes = DetectorLoader.getInstance().getClasses("logics");

		for (DetectionLogic aClass : classes)
		{
			assertTrue(aClass.toString().contains("IsWordPalindrome")||aClass.toString().contains("AlphabeticalOrder"));
		}
	}
		
	public void testNumberOfClassesInDirectory() throws Exception
	{
		assertEquals(2, DetectorLoader.getInstance().getClasses("logics").size());
	}
}
