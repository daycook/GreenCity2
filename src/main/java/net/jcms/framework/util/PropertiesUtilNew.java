package net.jcms.framework.util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;

@Component
@PropertySource("classpath:/config/properties/globals.properties")
public class PropertiesUtilNew {
	private static final Logger logger = LoggerFactory.getLogger(PropertiesUtilNew.class);
	
//	public static final String RELATIVE_PATH_PREFIX = PropertiesUtil.class.getResource("").getPath() + File.separator
//		    + ".." + File.separator
//		    + ".." + File.separator 
//		    + ".." + File.separator
//		    + ".." + File.separator
//		    + ".." + File.separator;
//	
//	public static final String PROPERTY_PATH = RELATIVE_PATH_PREFIX+File.separator+"config"+File.separator+"properties"+File.separator+"globals.properties";

	//static Path relativePathPreFix=null;
	// static Path propertyPath=null;
	
	private static Environment envPrp;
	/**
	 * 
	 */
	
	@Autowired
	public PropertiesUtilNew(Environment env) {
		// relativePathPreFix = Paths.get(PropertiesUtil.class.getResource("").getPath(), "..", "..", "..", "..", "..");
		// propertyPath = Paths.get(relativePathPreFix.toString(), "config", "properties", "globals.properties");
		envPrp = env;
	}
	
	
	/**
	 * @since
	 * 	0306	cs1492	웹취약점 조치
	 * @param keyName
	 * @return
	 */
	public static String getProperty(String keyName){		
		//
		
		String value = null;
		FileInputStream fis = null;
		try{
			value = envPrp.getProperty(keyName).trim();
			//Properties props = new Properties();
//			fis  = new FileInputStream(PROPERTY_PATH);
			//fis  = new FileInputStream(propertyPath.toFile());
			//props.load(new java.io.BufferedInputStream(fis));
			//value = props.getProperty(keyName).trim();
		/*}catch(FileNotFoundException fne){
			logger.debug("ERROR ::PropertiesUtil:: EXCEOTION");
		}catch(IOException ioe){
			logger.debug("ERROR ::PropertiesUtil:: EXCEOTION");*/
		}catch(Exception e){
			logger.debug("ERROR ::PropertiesUtil:: EXCEOTION");
		}finally{
			try {
				if (fis != null) fis.close();
			} catch (Exception ex) {
				logger.debug("ERROR ::PropertiesUtil:: EXCEOTION");
			}

		}
		return value;
	}
	
}
