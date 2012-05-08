package ride;

import CSF.jdbc.DBConnect;
import junit.framework.TestCase;
import org.junit.After;
import org.junit.Before;

import ride.dao.RideDAO;
import ride.dao.RideDaoJDBC;
import ride.model.RideVO;

import java.sql.SQLException;
import java.sql.Timestamp;


public class RideDaoTest extends TestCase {

    private RideDAO rideDao;
    private RideVO rideVO;

    @Before
    public void setUp() {
        rideDao = new RideDaoJDBC();
        rideVO = new RideVO();
        DBConnect.connect();
    }

    @After
    public void tearDown() throws SQLException {
        DBConnect.getConnection().rollback();
    }

    public void testCanary()
        {
            assertTrue(true);
        }

    public void testAddRide()
    {
        rideVO.setCost(0);
        rideVO.setSeats(3);
        rideVO.setSourceAddress("Stratford");
        rideVO.setStartTime(new Timestamp(230000));
        rideVO.setDestAddress("UH");

        rideDao.addRide(rideVO);

        assertTrue(rideDao.isrideTableModified());

    }

    public void testInvalidAddRideRequest()
    {
        rideVO.setSeats(3);
        rideVO.setSourceAddress("Stratford");
        rideVO.setStartTime(new Timestamp(230000));
        rideVO.setDestAddress("UH");

        rideDao.addRide(rideVO);

        assertFalse(rideDao.isrideTableModified());            
    }

    public void testDeleteRide()
    {
        rideDao.deleteRide(new Long(2));
        assertTrue(rideDao.isrideTableModified());
    }

    public void testDeleteInvalidRide()
    {
        rideDao.deleteRide(new Long(-1));
        assertFalse(rideDao.isrideTableModified());
    }
    
    public void testUpdateRide()
    {
                rideVO.setCost(0);
                rideVO.setSeats(3);
                rideVO.setSourceAddress("Stratford");
                rideVO.setStartTime(new Timestamp(230000));
                rideVO.setDestAddress("UH");

                rideDao.addRide(rideVO);
                rideVO.setSeats(4);

                rideDao.updateRide(rideVO);
                assertTrue(rideDao.isrideTableModified());
    }


    public void testFindARide()
    {
        rideVO = rideDao.findByRideId(new Long(2));
        assertTrue(rideDao.isRideFound());
    }


public void testFindInvalidRide()
    {
        rideVO = rideDao.findByRideId(new Long(-1));
        assertFalse(rideDao.isRideFound());
    }

}