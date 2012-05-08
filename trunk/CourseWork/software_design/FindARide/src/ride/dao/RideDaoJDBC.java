package ride.dao;

import CSF.dbschema.RideTable;
import CSF.jdbc.DBConnect;
import ride.model.RideVO;
import user.model.UserVO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class RideDaoJDBC implements RideDAO
{
    private boolean rideTableModified;
    private boolean rideFound;

    public boolean isrideTableModified()
    {
        return rideTableModified;
    }

    public RideVO findByRideId(Long rideId)
    {
        List<RideVO> rideList=find("SELECT * from "+RideTable.TABLE_NAME+" where "+RideTable.FIELD_RIDEID+" ="+rideId);
		if(rideList.size()>0)
            return rideList.get(0);
		else
        {
            rideFound = false;
            return null;
        }
    }

    public boolean isRideFound()
    {
        return rideFound;
    }


    public List<RideVO> findAll()
    {
        return find("SELECT * from "+ RideTable.TABLE_NAME);
    }

    public void addRide(RideVO rideVO)
    {
        if(!rideDetailsSufficient(rideVO))
        {

            rideTableModified = false;
        }
        else
        {

        Statement sql = null;
        String query=    "INSERT INTO " + RideTable.TABLE_NAME
                         +" ("
                         + RideTable.FIELD_SOURCEADDR+","
                         + RideTable.FIELD_DESTADDR+","
                         + RideTable.FIELD_STARTTIME+","
                         + RideTable.FIELD_COST+","
                         + RideTable.FIELD_SEATS
                         +") "
                         +"VALUES("
                         + "'"+rideVO.getSourceAddress()+"'"
                         + "," + "'"+rideVO.getDestAddress()+"'"
                         + "," + "'"+rideVO.getStartTime()+"'"
                         + "," + "'"+rideVO.getCost()+"'"
                         + "," + "'"+rideVO.getSeats() + "'"
                         + ")";
		 System.out.println();

         try
         {
             sql= DBConnect.getConnection().createStatement();
             int val = sql.executeUpdate(query);
             System.out.println();
             System.out.println(val+"(s) row affected");
             sql.close();
             rideTableModified = true;
         }
         catch (SQLException e)
         {
             System.out.println("Insert failed");
             rideTableModified = false;
             e.printStackTrace();
         }

         catch (Exception e)
         {
             e.printStackTrace();
         }
        }
    }

    private boolean rideDetailsSufficient(RideVO rideVO)
    {
        if( rideVO.getSourceAddress() != null && rideVO.getDestAddress() != null
                && rideVO.getStartTime() != null && rideVO.getCost() != null
                && rideVO.getSeats() != null)
            return true;
        else
            return false;
    }


    public void updateRide(RideVO rideVO)
    {
        rideTableModified = true;
    }


    public void deleteRide(Long rideID)
    {
        String query = "DELETE from " + RideTable.TABLE_NAME + " where " + RideTable.FIELD_RIDEID + "= " + "'"
                        + rideID + "'";

        try
        {
            Statement sql = DBConnect.getConnection().createStatement();
            int delete = sql.executeUpdate(query);
            if(delete == 1)
            {
                rideTableModified = true;
                System.out.println("Deleted row successfully");
            }
            else
            {
                rideTableModified = false;
                System.out.println("Could not delete row");
            }
        }
        catch (SQLException e)
        {
            rideTableModified = false;
        }

    }

    private List<RideVO> find(String query)
	{
		List<RideVO> rideList=null;
		Statement sql = null;
		ResultSet results=null;
		try
		{
			sql = DBConnect.getConnection().createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			results = sql.executeQuery(query);

			if (results != null)
			{
				rideList = new ArrayList<RideVO>();
				RideVO rideVO;
				while (results.next())
				{
					rideVO = new RideVO();

					if(hasField(results, RideTable.FIELD_USERID))rideVO.setUserID(results.getLong(RideTable.FIELD_USERID));
					if(hasField(results, RideTable.FIELD_RIDEID))rideVO.setRideID(results.getLong(RideTable.FIELD_RIDEID));
					if(hasField(results, RideTable.FIELD_SOURCEADDR))rideVO.setSourceAddress(results.getString(RideTable.FIELD_SOURCEADDR));
					if(hasField(results, RideTable.FIELD_DESTADDR))rideVO.setDestAddress(results.getString(RideTable.FIELD_DESTADDR));
					if(hasField(results, RideTable.FIELD_STARTTIME))rideVO.setStartTime(results.getTimestamp(RideTable.FIELD_STARTTIME));
					if(hasField(results, RideTable.FIELD_COST))rideVO.setCost(results.getInt(RideTable.FIELD_COST));
					if(hasField(results, RideTable.FIELD_COST))rideVO.setSeats(results.getInt(RideTable.FIELD_SEATS));
					rideList.add(rideVO);
				}
			}
			sql.close();
	         rideFound = true;
			results.close();
		} catch (NumberFormatException e)
		{
            rideFound = false;
			e.printStackTrace();
		} catch (SQLException e)
		{
            rideFound = false;
			e.printStackTrace();
		}


		return rideList;
	}
	private boolean hasField(ResultSet result,String columnLabel)
	{
		try
		{
			result.findColumn(columnLabel);
		} catch (SQLException e)
		{
			return false;
		}

		return true;
	}

}


