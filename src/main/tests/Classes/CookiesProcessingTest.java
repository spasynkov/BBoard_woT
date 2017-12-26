package Classes;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.junit.Assert;
import org.junit.Test;
import org.mockito.Mockito;

public class CookiesProcessingTest {

	@Test
	public void checkThatGetCookieMathodWasCalledOnlyOnce() {

		HttpServletRequest a = Mockito.mock(HttpServletRequest.class );


		Cookie [] q = new Cookie[]{ Mockito.mock(Cookie.class),
				Mockito.mock(Cookie.class), Mockito.mock(Cookie.class)};

		Mockito.when(a.getCookies()).thenReturn(q);

		CookiesProcessing.getCookie(a,CookiesProcessing.CookieName.WOT_USERNAME);

		Mockito.verify(a,Mockito.times(1)).getCookies();
	}


	@Test
	public void checkThatEmtyStringRetern(){

		Cookie q = new Cookie("vasuy","loh");

		HttpServletRequest a = Mockito.mock(HttpServletRequest.class );

		Cookie [] z = new Cookie[]{Mockito.mock(Cookie.class),q};
		Mockito.when(a.getCookies()).thenReturn(z);

		Assert.assertEquals("",CookiesProcessing.getCookie(a,CookiesProcessing.CookieName.WOT_USER_ID));

	}

	@Test
	public void checkAtRealParametrsAndValues(){
		HttpServletRequest a = Mockito.mock(HttpServletRequest.class );

		for (CookiesProcessing.CookieName i : CookiesProcessing.CookieName.values()){
			Cookie q = new Cookie(i.name(),i.name()+"test");

			Cookie [] z = new Cookie[]{Mockito.mock(Cookie.class),q};
			Mockito.when(a.getCookies()).thenReturn(z);
			Assert.assertEquals(i.name()+"test",CookiesProcessing.getCookie(a,i));
		}





	}




}