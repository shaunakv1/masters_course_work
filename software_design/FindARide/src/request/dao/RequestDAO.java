package request.dao;

import request.model.RequestVO;

import java.util.List;

public interface RequestDAO
{
    public List<RequestVO> findAll();

    public void addRequest(RequestVO userVO);

    public void updateRequest(RequestVO userVO);

    public void deleteRequest(Long userID, Long rideID);

	public boolean isRequestTableModified();

	public boolean isRequestsFound();
}
