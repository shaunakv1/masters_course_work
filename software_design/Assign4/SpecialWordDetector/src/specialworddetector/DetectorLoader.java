package specialworddetector;

import ilogics.DetectionLogic;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class DetectorLoader
{
	private static DetectorLoader theInstance;
	List<DetectionLogic> list = new ArrayList<DetectionLogic>();

	private DetectorLoader() throws Exception
	{
		list = getClasses("logics");
	}

	public static DetectorLoader getInstance() throws Exception
	{
		if (theInstance == null)
		{
			theInstance = new DetectorLoader();
		}
		return theInstance;
	}

	public void addDetectors(DetectionLogic logic)
	{
		list.add(logic);
	}

	public void removeDetectors()
	{
		list.clear();
	}

	public List<DetectionLogic> getDetectors()
	{
		return list;
	}

	public ArrayList<DetectionLogic> getClasses(String detectorClassesPackage)throws Exception
	{
		ArrayList<DetectionLogic> classes = new ArrayList<DetectionLogic>();
		File directory = new File(Thread.currentThread().getContextClassLoader().getResource(detectorClassesPackage).getFile());
		for (String file : directory.list())
		{
		 classes.add((DetectionLogic) Class.forName(detectorClassesPackage + '.'+ file.substring(0, file.length() - 6)).newInstance());
		}
		return classes;
	}
}
