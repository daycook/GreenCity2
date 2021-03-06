package net.jcms.framework.util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

public class PropertiesUtil {
	
	public static final String RELATIVE_PATH_PREFIX = PropertiesUtil.class.getResource("").getPath() + System.getProperty("file.separator")
		    + ".." + System.getProperty("file.separator")
		    + ".." + System.getProperty("file.separator") 
		    + ".." + System.getProperty("file.separator")
		    + ".." + System.getProperty("file.separator")
		    + ".." + System.getProperty("file.separator");
	
	public static final String PROPERTY_PATH = RELATIVE_PATH_PREFIX+System.getProperty("file.separator")+"config"+System.getProperty("file.separator")+"properties"+System.getProperty("file.separator")+"globals.properties";

	public static String getProperty(String keyName){
		String value = null;
		FileInputStream fis = null;
		try{
			Properties props = new Properties();
			fis  = new FileInputStream("../config/properties/globals.properties");
			props.load(new java.io.BufferedInputStream(fis));
			value = props.getProperty(keyName).trim();
		}catch(FileNotFoundException fne){
			fne.printStackTrace();
		}catch(IOException ioe){
			ioe.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try {
				if (fis != null) fis.close();
			} catch (Exception ex) {
				ex.printStackTrace();
			}

		}
		return value;
	}
	
}
