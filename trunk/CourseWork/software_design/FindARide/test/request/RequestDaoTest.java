package request;

import CSF.jdbc.DBConnect;
import junit.framework.TestCase;
import request.dao.RequestDAO;
import request.dao.RequestDaoJDBC;
import request.model.RequestVO;

import java.util.List;

public class RequestDaoTest extends TestCase
{
    private RequestVO requestVO;
    private RequestDAO requestDao;
    int numberOfRecords;

    protected void setUp() throws Exception
    {
        requestVO = new RequestVO();
        requestDao = new RequestDaoJDBC();
        DBConnect.connect();
    }

    protected void tearDown() throws Exception
    {
        DBConnect.getConnection().rollback();
    }

    public void testAddRequest()
    {
        numberOfRecords = requestDao.findAll().size();

        requestVO.setRideID(new Long(0));
        requestVO.setUserID(new Long(0));
        requestVO.setStatus(0);

        requestDao.addRequest(requestVO);

        assertEquals(numberOfRecords + 1, requestDao.findAll().size());
    }

    public void testAddRequestWithInsufficientDetails()
    {
        numberOfRecords = requestDao.findAll().size();

        requestVO.setRideID(new Long(0));
        requestVO.setUserID(new Long(1));

        requestDao.addRequest(requestVO);

        assertEquals(numberOfRecords, requestDao.findAll().size());
    }

    public void testDeleteRequest()
    {
        requestVO.setRideID(new Long(0));
        requestVO.setUserID(new Long(0));
        requestVO.setStatus(0);
        requestDao.addRequest(requestVO);

        numberOfRecords = requestDao.findAll().size();

        requestDao.deleteRequest(new Long(0), new Long(0));

        assertEquals(numberOfRecords - 1, requestDao.findAll().size());
    }

    public void testDeleteInvalidRequest()
    {
        numberOfRecords = requestDao.findAll().size();

        requestDao.deleteRequest(new Long(-1), new Long(-1));
        assertEquals(numberOfRecords, requestDao.findAll().size());
    }

    public void testUpdateRequest()
    {
        requestVO.setRideID(new Long(0));
        requestVO.setUserID(new Long(0));
        requestVO.setStatus(0);
        requestDao.addRequest(requestVO);

        requestVO.setStatus(3);
        requestDao.updateRequest(requestVO);
        assertTrue(requestDao.isRequestTableModified());
    }

    public void testFindAllRequests()
    {
        List<RequestVO> requestList = requestDao.findAll();
        assertTrue(requestDao.isRequestsFound());
    }

    public void testFindAllUsersWithNoUsersInDatabase()
    {
        List<RequestVO> requestList = requestDao.findAll();
        for (RequestVO request : requestList)
        {
            requestDao.deleteRequest(request.getUserID(), request.getRideID());
        }
        assertEquals(0, requestDao.findAll().size());
    }

}
