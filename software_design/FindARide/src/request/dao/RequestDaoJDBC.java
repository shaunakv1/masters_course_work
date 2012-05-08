package request.dao;

import CSF.dbschema.RequestTable;
import CSF.jdbc.DBConnect;
import request.model.RequestVO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class RequestDaoJDBC implements RequestDAO
{
    private boolean requestTableModified;
    private boolean requestsFound;

    public boolean isRequestTableModified()
    {
        return requestTableModified;
    }

    public boolean isRequestsFound()
    {
        return requestsFound;
    }

    public List<RequestVO> findAll()
    {
        return find("SELECT * from "+ RequestTable.TABLE_NAME);
    }

    public void addRequest(RequestVO requestVO)
    {
        if(!requestDetailsSufficient(requestVO))
        {
            System.out.println("Not enough parameters");
        }
        else
        {
            Statement sql = null;
            String query =  "INSERT INTO "+ RequestTable.TABLE_NAME
                            + " VALUES("+ "'"+requestVO.getRideID()+"'"
                            + "," + "'" + requestVO.getUserID()+"'"
                            + "," + "'"+requestVO.getStatus()+"'"
                            + ")";

            try
            {
                sql= DBConnect.getConnection().createStatement();
                int val = sql.executeUpdate(query);
                System.out.println();
                System.out.println(val+"(s) row affected");
                sql.close();
            }
            catch (SQLException e)
            {
                System.err.println("Insert failed..");
                e.printStackTrace();
            }

            catch (Exception e)
            {
                e.printStackTrace();
            }
        }
    }

    private boolean requestDetailsSufficient(RequestVO requestVO)
    {
        if(requestVO.getStatus() != null && requestVO.getRideID() != null && requestVO.getUserID() != null)
            return true;
        else
            return false;
    }

    public void updateRequest(RequestVO userVO)
    {
        requestTableModified = true;
    }

    public void deleteRequest(Long userID, Long rideID)
    {
        String query = "DELETE FROM " + RequestTable.TABLE_NAME + " WHERE " + RequestTable.FIELD_USERID + "= "
                        + "'" + userID +"'" + "AND " + RequestTable.FIELD_RIDEID + "= " + "'" + rideID + "'";
        try
        {
            Statement sql = DBConnect.getConnection().createStatement();
            int delete = sql.executeUpdate(query);
            if(delete == 1)
            {
                System.out.println("Deleted row successfully");
            }
            else
            {
                System.out.println("Could not delete row");
            }
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }

    }

    private List<RequestVO> find(String query)
    {
        List<RequestVO> requestList=null;
        Statement sql = null;
        ResultSet results=null;
        try
        {
            sql = DBConnect.getConnection().createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            results = sql.executeQuery(query);

            if (results != null)
            {
                requestList = new ArrayList<RequestVO>();
                RequestVO requestVO;
                while (results.next())
                {
                    requestVO = new RequestVO();

                    if(hasField(results, RequestTable.FIELD_USERID))
                        requestVO.setUserID(results.getLong(RequestTable.FIELD_USERID));
                    if(hasField(results, RequestTable.FIELD_RIDEID))
                        requestVO.setRideID(results.getLong(RequestTable.FIELD_RIDEID));
                    if(hasField(results, RequestTable.FIELD_STATUS))
                    requestVO.setStatus(results.getInt(RequestTable.FIELD_STATUS));

                    requestList.add(requestVO);
                }
            }
            sql.close();
            results.close();
            requestsFound = true;
        }
        catch (NumberFormatException e)
        {
            e.printStackTrace();
        }
        catch (SQLException e)
        {
            e.printStackTrace();
        }

        return requestList;
    }

    private boolean hasField(ResultSet result,String columnLabel)
    {
        try
        {
            result.findColumn(columnLabel);
        }
        catch (SQLException e)
        {
            return false;
        }

        return true;
    }

}
