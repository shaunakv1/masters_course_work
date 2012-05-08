package user;

import CSF.jdbc.DBConnect;
import junit.framework.TestCase;
import user.dao.UserDAO;
import user.dao.UserDaoJdbc;
import user.model.UserVO;

import java.util.ArrayList;
import java.util.List;

public class UserDaoTest extends TestCase
{
    private UserDAO userDao;
    private UserVO userVO;
    private List<UserVO> userList;
    int numberOfRecords;

    protected void setUp() throws Exception
    {
        userDao = new UserDaoJdbc();
        userVO = new UserVO();
        userList = new ArrayList<UserVO>();
        DBConnect.connect();
    }

    protected void tearDown() throws Exception
    {
        DBConnect.getConnection().rollback();
    }

    public void testCanary()
    {
        assertTrue(true);
    }

    public void testAddUser()
    {
        numberOfRecords = userDao.findAll().size();
        userVO.setName("Sameer");
        userVO.setSex("Male");
        userVO.setEmail("someEmail@someprovider.com");
        userVO.setPhoneNumber("1234567890");
        userVO.setUserName("sameer");
        userVO.setPassword("somepassword");

        userDao.addUser(userVO);

        assertEquals(numberOfRecords + 1, userDao.findAll().size());

    }

    public void testAddUserWithInsufficientDetails()
    {
        numberOfRecords = userDao.findAll().size();
        userVO.setName("Somename");
        userVO.setEmail("something");
        userVO.setUserName("username");

        userDao.addUser(userVO);
        assertEquals(numberOfRecords, userDao.findAll().size());
    }

    public void testDeleteUser()
    {
        numberOfRecords = userDao.findAll().size();
        userDao.deleteUser(new Long(41));

        assertEquals(numberOfRecords - 1, userDao.findAll().size());        
    }

    public void testDeleteInvalidUser()
    {
        numberOfRecords = userDao.findAll().size();

        userDao.deleteUser(new Long(-1));
        assertEquals(numberOfRecords, userDao.findAll().size());
    }

    public void testUpdateUser()
    {
        userVO.setName("Sameer");
        userVO.setSex("Male");
        userVO.setEmail("someEmail@someprovider.com");
        userVO.setPhoneNumber("1234567890");
        userVO.setUserName("sameer");
        userVO.setPassword("somepassword");
        userDao.addUser(userVO);

        userVO.setName("Kumar");
        userDao.updateUser(userVO);

        assertTrue(userDao.isUserTableModified());
    }

    public void testFindAUser()
    {
        userVO = userDao.findByUserId(new Long(41));
        assertTrue(userDao.isUsersFound());
    }

    public void testFindInvalidUser()
    {
        userVO = userDao.findByUserId(new Long(-1));
        assertFalse(userDao.isUsersFound());
    }

    public void testFindAllUsers()
    {
        userList = userDao.findAll();
        assertTrue(userDao.isUsersFound());
    }

    public void testFindAllUsersWithNoUsersInDatabase()
    {
        userList = userDao.findAll();
        for (UserVO user : userList)
        {
            userDao.deleteUser(user.getUserID());
        }
        assertEquals(0, userDao.findAll().size());
    }

}
