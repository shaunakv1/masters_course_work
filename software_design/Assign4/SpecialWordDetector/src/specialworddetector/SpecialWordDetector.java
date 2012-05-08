package specialworddetector;

import ilogics.DetectionLogic;
import java.util.ArrayList;
import java.util.List;

public class SpecialWordDetector
{
	List<DetectionLogic> detectorClasses = new ArrayList<DetectionLogic>();

	public SpecialWordDetector() throws Exception
	{
		detectorClasses = new ArrayList<DetectionLogic>(DetectorLoader.getInstance().getDetectors());
	}

	public boolean isWordSpecial(String word)
	{
		for (DetectionLogic detector : detectorClasses)
		{
			if (detector.isSpecial(word))
				return true;
		}
		return false;
	}

}
