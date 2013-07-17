

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class GetProperties {
	
	private String getProperties(String filepath){
		String resultStr = "";
		try {
			InputStream in = new FileInputStream(new File(filepath));
			Properties p = new Properties();
			p.load(in);
			resultStr += p.values();
			resultStr += p.keys();
			resultStr += p.keySet();
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return resultStr;
	}
	
	
	public static void main(String[] args){
		String fp = "bin/conf.properties";
		String ppp = new GetProperties().getProperties(fp);
		System.out.print(ppp);
	}
	

}
