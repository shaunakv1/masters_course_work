package request.model;

public class RequestVO
{
	private Long rideID;         
	private Long userID;         
	private Integer status;
	
	public Long getRideID()
	{
		return rideID;
	}
	public void setRideID(Long rideID)
	{
		this.rideID = rideID;
	}
	public Long getUserID()
	{
		return userID;
	}
	public void setUserID(Long userID)
	{
		this.userID = userID;
	}
	public Integer getStatus()
	{
		return status;
	}
	public void setStatus(Integer status)
	{
		this.status = status;
	}   
	
	@Override
	public String toString()
	{
		StringBuffer sb= new StringBuffer();
		sb.append("-------------");
		sb.append("\n rideID :" + rideID);
		sb.append("\n userID :" + userID);
		sb.append("\n status :" + status);
		
		return sb.toString();
	}
}
