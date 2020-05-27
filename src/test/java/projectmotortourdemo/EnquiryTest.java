package projectmotortourdemo;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import com.nuzrah.projectmotortourdemo.dao.EnquiryDao;
import com.nuzrah.projectmotortourdemo.model.Enquiry;


public class EnquiryTest {

	@Test
	public void test() {
		//Enquiry output = EnquiryDao.get(1);
		
		//String[] expectedT = {"2","Farha","Imthiyaz","BOOKING_TOURS","ffgfhdhgdfdgf","1076566525","farhaimthifari123@gmail.com"};
		
		//assertEquals(expectedT,output);
		
		//Enquiry u = new Enquiry();
		Enquiry output = EnquiryDao.get("farhaimthifari123@gmail.com");
		assertEquals("1076566525",output);

	}
	
	//assertTrue(expectedTitlesList.contains((actualTitle)));
	
}


