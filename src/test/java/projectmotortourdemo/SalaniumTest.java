package projectmotortourdemo;

import java.util.concurrent.TimeUnit;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

public class SalaniumTest {
	
	public static void main(String[] args) {
		 
		 /// TODO Auto-generated method stub

		//setting the driver executable
		System.setProperty("webdriver.chrome.driver", ".\\Driver\\chromedriver.exe");

		//Initiating your chromedriver
		WebDriver driver=new ChromeDriver();

		//Applied wait time
		driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
		//maximize window
		driver.manage().window().maximize();

		//open browser with desried URL
		driver.get("http://localhost:8080/projectmotortourdemo/Registration.jsp");

		//closing the browser
		driver.close();

		}
}
