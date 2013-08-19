//Test.java

public class Test {


	public static void main(String[] args) {

		System.out.println("hello world!");

		try{
			int[] aArr={1,2};
			System.out.println(aArr[2]);
		}catch (Exception e){
			System.out.println(e); 
			System.exit(-1);
		}
		
	}

}