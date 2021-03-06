package net.jcms.front.common.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.jcms.framework.base.web.BaseController;
import net.jcms.framework.util.PropertiesUtil;
import net.jcms.framework.util.PropertiesUtilNew;
import net.jcms.front.common.service.CommonService;
import net.jcms.front.front.model.FrontSearch;

@Controller
public class CommonController extends BaseController {
	
	@Resource (name="commonService")
	private CommonService commonService;
	
	@RequestMapping (value="/front/common/getCodeList.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> data(HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> paramMap = getParameterMap(request);
		
		try {
			List<Map<String,Object>> codeList = commonService.getCodeList(paramMap);
			result.put("list", codeList);
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		
		return result;
	}
	
	
	/* 넘어온 모든 parameter값 Map형식으로 저장 */
	public Map<String, Object> getParameterMap(HttpServletRequest request){

		Map<String, Object> parameterMap = new HashMap<String, Object>();

		Long id = getUserId();
		
		parameterMap.put("userId", id);
		
		String ip = request.getHeader("X-Forwarded-For");
	    if (ip == null) ip = request.getRemoteAddr();
	    
	    parameterMap.put("userIp", ip);
		
		Enumeration enums = request.getParameterNames();
		while(enums.hasMoreElements()){
		String paramName = (String)enums.nextElement();
		String[] parameters = request.getParameterValues(paramName);

		// Parameter가 배열일 경우
		if(parameters.length > 1){
		parameterMap.put(paramName, parameters);
		// Parameter가 배열이 아닌 경우
		}else{
		parameterMap.put(paramName, parameters[0]);
		}
		}
		return parameterMap;
	}
	
	/**
	 * 사진 뷰어
	 * @param fileName
	 * @param request
	 * @return
	 */
	@RequestMapping (value="/front/common/display.do", method=RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(@RequestParam("name") String fileName,HttpServletRequest request) {
		String path = PropertiesUtilNew.getProperty("AppConf.filePath.gwimage");
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		try{
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			in = new FileInputStream(path+fileName);
			MediaType mType = null;
			if(formatName.toUpperCase().equals("PNG")){
				mType = MediaType.IMAGE_PNG;
			}else if(formatName.toUpperCase().equals("JPG")){
				mType = MediaType.IMAGE_JPEG;
			}else if(formatName.toUpperCase().equals("GIF")){
				mType = MediaType.IMAGE_GIF;
			}
			HttpHeaders headers = new HttpHeaders();
			
			if(mType != null){
				headers.setContentType(mType);
			}else{
				fileName = fileName.substring(fileName.indexOf("_")+1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1")+"\"");  
			}
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch(FileNotFoundException e) {
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} catch (UnsupportedEncodingException e) {
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} catch (IOException e) {
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}finally {
			try {
				if(in != null){
					in.close();
				}
			} catch (IOException e) {
				entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
			}
		}
		return entity;
	}
	
	@Scheduled(cron = "0 0/20 * * * ?")
	public void insertGwDataOrg(){
		try {
			String serverGbn = PropertiesUtilNew.getProperty("AppConf.server.gbn");
			if(serverGbn.equals("oper")) {
				commonService.insertGwDataOrg();
			}
		}catch (Exception e) {
			log(e.getMessage());
		}
	}
	
	@RequestMapping (value="/front/common/log.do")
    public void log(String msg){
        SimpleDateFormat ymdFmt = new SimpleDateFormat ("yyyyMMdd");
        SimpleDateFormat ymdhmsFmt = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");

        String ymd= ymdFmt.format(new Date());
        String ymdhms = ymdhmsFmt.format(new Date());
        
        String txt = ymdhms+"\r"+msg+"\r\r" ;
         
        String path = "D://dataInsertLog/"+ymd+".log" ;
         
         
        try{
             
            // 파일 객체 생성
            File file = new File(path) ;
             
            // true 지정시 파일의 기존 내용에 이어서 작성
            FileWriter fw = new FileWriter(file, true) ;
             
            // 파일안에 문자열 쓰기
            fw.write(txt);
            fw.flush();
 
            // 객체 닫기
            fw.close();
             
             
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
