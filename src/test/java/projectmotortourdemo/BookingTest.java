package projectmotortourdemo;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import com.nuzrah.projectmotortourdemo.dao.BookingDao;
import com.nuzrah.projectmotortourdemo.model.Booking;

public class BookingTest {
	
	@Test
	public void test() {
		Booking output = BookingDao.get(1);
		
		String[] expectedT = {"1","1","Confirmed","feedback","15000","1076566525","farhaimthifari123@gmail.com"};
		
		assertEquals(expectedT,output);

	}
}
