package net.jcms.front.common.service.impl;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Service;

import net.jcms.framework.base.service.impl.BaseServiceImpl;
import net.jcms.framework.util.PropertiesUtilNew;
import net.jcms.front.common.mapper.CommonMapper;
import net.jcms.front.common.model.Common;
import net.jcms.front.common.model.CommonSearch;
import net.jcms.front.common.model.Grade;
import net.jcms.front.common.service.CommonService;

@Service(value="commonService")

public class CommonServiceImpl extends BaseServiceImpl<Common, CommonSearch, CommonMapper> implements CommonService {

	@Override
	@Resource (name="commonMapper")
	protected void setMapper (CommonMapper mapper) {
		super.setMapper (mapper);
	}
	
	
	public String excelDown(HttpServletRequest request, HttpServletResponse response, List<Map<String,Object>> dataList, String[] title, String[] cont) {
		XSSFWorkbook xlsWb = new XSSFWorkbook(); //xlsx
//		HSSFWorkbook xlsWb = new HSSFWorkbook(); //xls
		Sheet sheet1 = xlsWb.createSheet("dataTable"); //시트명 설정
				
		Row row = null;
		Cell cell = null;
		
		int rowIdx = 0;
		
		row = sheet1.createRow(rowIdx++);
		
		for(int i=0; i<title.length; i++) {
			cell = row.createCell(i);
	        cell.setCellValue(title[i]);
	        cell.setCellStyle(cellStyle(xlsWb, "head")); // 셀 스타일 적용
		}


		for(int i=0; i<dataList.size(); i++) {
			Map<String,Object> dataMap = (Map<String, Object>) dataList.get(i);
			
			row = sheet1.createRow(rowIdx++);
			int cellIdx = 0;
			
			//data 출력하기
			for(int j=0; j<cont.length; j++) {
				cell = row.createCell(cellIdx++);
				String data = "";
				if(dataMap.get(cont[j]) != null) {
					data = dataMap.get(cont[j]).toString();
				}
		        cell.setCellValue(data);
		        cell.setCellStyle(cellStyle(xlsWb, "data")); // 셀 스타일 적용
			}
		}
 
        // excel 파일 저장
		String fileName = UUID.randomUUID().toString();
        try {
        	String path = PropertiesUtilNew.getProperty("AppConf.filePath.excel"); //경로
        	
        	File Folder = new File(path);

        	// 해당 디렉토리가 없을경우 디렉토리를 생성합니다.
        	if (!Folder.exists()) {
        		try{
        		    Folder.mkdirs(); //폴더 생성합니다.
        		    System.out.println("폴더가 생성되었습니다.");
        	        } 
        	        catch(Exception e){
        		    e.getStackTrace();
        		}        
                 }else {
        		System.out.println("이미 폴더가 생성되어 있습니다.");
        	}
        	
            File xlsFile = new File(path+fileName); //저장경로 설정
            FileOutputStream fileOut = new FileOutputStream(xlsFile);
            xlsWb.write(fileOut);
            System.out.println("파일업로드 성공");
        } catch (FileNotFoundException e) {
        	System.out.println("파일업로드 에러 : "+e.getMessage());
            e.printStackTrace();
        } catch (IOException e) {
        	System.out.println("파일업로드 에러 : "+e.getMessage());
            e.printStackTrace();
        }
		return fileName;
	}
	//셀 스타일 설정하는 함수
	public static CellStyle cellStyle(XSSFWorkbook xlsWb, String kind) {
		CellStyle cellStyle = xlsWb.createCellStyle();
		
		if(kind.equals("head")) {
			cellStyle.setFillForegroundColor(IndexedColors.YELLOW.getIndex()); //노란색
		}else if(kind.equals("data")) {
			cellStyle.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex()); //회색 25%
		}
		
		return cellStyle;
	}
	
	/**
	 * 엑셀파일다운로드
	 */
	public void download(HttpServletResponse response, String fileName, String fileDownName){
		byte fileByte[];
		try {
			String path = PropertiesUtilNew.getProperty("AppConf.filePath.excel"); //경로
			fileByte = FileUtils.readFileToByteArray(new File(path+fileName));
			response.setContentType("application/octet-stream");
		    response.setContentLength(fileByte.length);
		    response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(fileDownName+".xlsx","UTF-8")+"\";");
		    response.setHeader("Content-Transfer-Encoding", "binary");
		    response.getOutputStream().write(fileByte);
		     
		    response.getOutputStream().flush();
		    response.getOutputStream().close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 지질주상도파일다운로드
	 */
	public void imgdownload(HttpServletResponse response, String fileName, String downFileName){
		byte fileByte[];
		try {
			String imgPath = PropertiesUtilNew.getProperty("AppConf.server.gbn");
			fileByte = FileUtils.readFileToByteArray(new File(imgPath+fileName));
			
			downFileName = downFileName+"."+fileName.split("\\.")[1];
			
			response.setContentType("application/octet-stream");
		    response.setContentLength(fileByte.length);
		    response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(downFileName,"UTF-8")+"\";");
		    response.setHeader("Content-Transfer-Encoding", "binary");
		    response.getOutputStream().write(fileByte);
		     
		    response.getOutputStream().flush();
		    response.getOutputStream().close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


	@Override
	public void insertGwDataOrg() {
		//원본 데이터 입력
		mapper.insertGwDataOrg();
		
		//변경 가능한 데이터 입력
		mapper.insertGwDataValue();
	}


	@Override
	public List<Map<String, Object>> getCodeList(Map<String, Object> paramMap) {
		return mapper.getCodeList(paramMap);
	}
}
