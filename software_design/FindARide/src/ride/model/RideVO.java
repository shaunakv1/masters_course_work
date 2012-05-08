package ride.model;

import java.sql.Timestamp;

public class RideVO
{
	private Long rideID; 
	private Long userID;        
	private String sourceAddress;         
	private String destAddress;         
	private Timestamp startTime;          
	private Integer cost;         
	private Integer seats;
	
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
	public String getSourceAddress()
	{
		return sourceAddress;
	}
	public void setSourceAddress(String sourceAddress)
	{
		this.sourceAddress = sourceAddress;
	}
	public String getDestAddress()
	{
		return destAddress;
	}
	public void setDestAddress(String destAddress)
	{
		this.destAddress = destAddress;
	}
	public Timestamp getStartTime()
	{
		return startTime;
	}
	public void setStartTime(Timestamp startTime)
	{
		this.startTime = startTime;
	}
	public Integer getCost()
	{
		return cost;
	}
	public void setCost(Integer cost)
	{
		this.cost = cost;
	}
	public Integer getSeats()
	{
		return seats;
	}
	public void setSeats(Integer seats)
	{
		this.seats = seats;
	}          
	@Override 
	public String toString()
	{
		StringBuffer sb= new StringBuffer();
		sb.append("-------------");
		sb.append("\n rideID :" + rideID);
		sb.append("\n userID :" + userID);
		sb.append("\n sourceAddress :" + sourceAddress);
		sb.append("\n destAddress :" + destAddress);
		sb.append("\n startTime: " + startTime);
		sb.append("\n cost :" + cost);
		sb.append("\n seats :" + seats);
		return sb.toString();
	}          
}
