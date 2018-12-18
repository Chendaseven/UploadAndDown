import org.junit.Test;

public class test {
	@Test
	public void test1() {
		int x=1;
		float y=0;
		for(int i=0;i<38;i++) {
			if(((38-x)%x)==0) {
				System.out.println(x);
				
			}
			//y=(38-x)/x;
			x++;
		}
		//(38-x)/x
	}
}
