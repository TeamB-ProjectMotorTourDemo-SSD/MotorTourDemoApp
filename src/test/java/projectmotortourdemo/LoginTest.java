package projectmotortourdemo;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import com.nuzrah.projectmotortourdemo.dao.UserDao;
import com.nuzrah.projectmotortourdemo.model.User;

public class LoginTest {
	
	@Test
	public void test() {
		User u = new User();
		boolean output = UserDao.validate(u);
		assertEquals(false,output);
	}
	
}


