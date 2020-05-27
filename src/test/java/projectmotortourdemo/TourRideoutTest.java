package projectmotortourdemo;

import static org.junit.Assert.assertEquals;
import org.junit.Test;
import com.nuzrah.projectmotortourdemo.dao.TourRideOutDao;
import com.nuzrah.projectmotortourdemo.model.TourRideOut;

public class TourRideoutTest {
	
	@Test
	public void test() {
		
		TourRideOut output = TourRideOutDao.get(1);
		
		Object[] expectedT = {1, "Around Colombo", "This is a sample description. This is a sample description. This is a sample description. This is a sample description. This is a sample description. This is a sample description. This is a sample description. This is a sample description. This is a", 3, "Sample text. Sample text.   Sample text. Sample text.   Sample text. Sample text.   Sample text. Sample text.   Sample text. Sample text.   Sample text. Sample text.   Sample text. Sample text.   Sample text. Sample text.   Sample text. Sample text.", "John", "Doe", "ONGOING", "Mt Lavinia", "Maradana"};

		assertEquals(expectedT,output);
		
	};
	
	}




