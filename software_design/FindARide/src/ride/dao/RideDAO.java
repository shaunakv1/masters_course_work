package ride.dao;

import ride.model.RideVO;

import java.util.List;

public interface RideDAO
{
    public RideVO findByRideId(Long userId);

    public List<RideVO> findAll();

    public void addRide(RideVO userVO);

    public void updateRide(RideVO userVO);

    public void deleteRide(Long userID);

	public boolean isrideTableModified();

	public boolean isRideFound();


}
