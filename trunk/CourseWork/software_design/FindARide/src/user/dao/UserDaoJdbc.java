package user.dao;

import CSF.dbschema.UserTable;
import CSF.jdbc.DBConnect;
import user.model.UserVO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserDaoJdbc implements UserDAO
{
    private boolean userTableModified;
    private boolean usersFound;

    public boolean isUserTableModified()
    {
        return userTableModified;
    }

    public boolean isUsersFound()
    {
        return usersFound;
    }

    public void addUser(UserVO userVO)
	{
        if(!userDetailsSufficient(userVO))
        {
            System.out.println("Enter all the details");
        }
        else
        {
            Statement sql = null;
            String query = "INSERT INTO "+UserTable.TABLE_NAME
                            +" ("+UserTable.FIELD_NAME+","
                            + UserTable.FIELD_SEX+","
                            + UserTable.FIELD_EMAIL+","
                            + UserTable.FIELD_PHNO+","
                            + UserTable.FIELD_USERNAME+","
                            + UserTable.FIELD_PASSWORD
                            +") "
                            +"VALUES("
                            + "'"+userVO.getName()+"'"
                            + "," + "'"+userVO.getSex()+"'"
                            + "," + "'"+userVO.getEmail()+"'"
                            + "," + "'"+userVO.getPhoneNumber()+"'"
                            + "," + "'"+userVO.getUserName()+"'"
                            + "," + "'"+userVO.getPassword()+"'"
                            + ")";

            try
            {
                sql= DBConnect.getConnection().createStatement();
                int val = sql.executeUpdate(query);
                System.out.println();
                System.out.println(val+" row(s) affected");
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

    private boolean userDetailsSufficient(UserVO userVO)
    {
        if(userVO.getName() != null && userVO.getSex() != null && userVO.getEmail() != null
                && userVO.getPhoneNumber() != null && userVO.getUserName() != null
                && userVO.getPassword() != null)
            return true;
        else
            return false;
    }

    public void deleteUser(Long userID)
	{
		String query = "DELETE from " + UserTable.TABLE_NAME + " where " + UserTable.FIELD_USERID + "= "
                        + "'" + userID + "'";

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
        }

	}

	public List<UserVO> findAll()
	{
		return find("SELECT * from " + UserTable.TABLE_NAME);
	}

	public UserVO findByUserId(Long userId)
	{
		List<UserVO> userList = find("SELECT * from " + UserTable.TABLE_NAME + " where " + UserTable.FIELD_USERID + " =" + userId);
		if (userList.size() > 0)
			return userList.get(0);
		else
        {
            usersFound = false;
            return null;
        }
	}

	public void updateUser(UserVO userVO)
	{
        userTableModified = true;
	}

	private List<UserVO> find(String query)
	{
		List<UserVO> userList = null;
		Statement sql = null;
		ResultSet results = null;
		try
		{
			sql = DBConnect.getConnection().createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			results = sql.executeQuery(query);

			if (results != null)
			{
				userList = new ArrayList<UserVO>();
				UserVO userVO;
				while (results.next())
				{
					userVO = new UserVO();

					if (hasField(results, UserTable.FIELD_USERID))
						userVO.setUserID(new Long(results.getString(UserTable.FIELD_USERID)));
					if (hasField(results, UserTable.FIELD_NAME))
						userVO.setName(results.getString(UserTable.FIELD_NAME));
					if (hasField(results, UserTable.FIELD_SEX))
						userVO.setSex(results.getString(UserTable.FIELD_SEX));
					if (hasField(results, UserTable.FIELD_PHNO))
						userVO.setPhoneNumber(results.getString(UserTable.FIELD_PHNO));
					if (hasField(results, UserTable.FIELD_EMAIL))
						userVO.setEmail(results.getString(UserTable.FIELD_EMAIL));
					if (hasField(results, UserTable.FIELD_USERNAME))
						userVO.setUserName(results.getString(UserTable.FIELD_USERNAME));
					if (hasField(results, UserTable.FIELD_PASSWORD))
						userVO.setPassword(results.getString(UserTable.FIELD_PASSWORD));
					userList.add(userVO);
				}
			}
			sql.close();
			results.close();
            usersFound = true;
		}

        catch (NumberFormatException e)
		{
            usersFound = false;
			e.printStackTrace();
		}

        catch (SQLException e)
		{
			e.printStackTrace();
		}

		return userList;
	}

	private boolean hasField(ResultSet result, String columnLabel)
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

	public static void main(String[] args)
	{
		DBConnect.connect();

		List<UserVO> list = new UserDaoJdbc().findAll();
		for (UserVO user : list)
		{
			System.out.println(user);
		}
	}

}
