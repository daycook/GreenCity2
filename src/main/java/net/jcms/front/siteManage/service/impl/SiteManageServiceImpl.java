package net.jcms.front.siteManage.service.impl;

import java.io.File;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.jcms.framework.base.service.impl.BaseServiceImpl;
import net.jcms.framework.util.PropertiesUtilNew;
import net.jcms.front.siteManage.mapper.SiteManageMapper;
import net.jcms.front.siteManage.model.SiteManage;
import net.jcms.front.siteManage.model.SiteManageSearch;
import net.jcms.front.siteManage.service.SiteManageService;

@Service(value="siteManageService")
public class SiteManageServiceImpl extends BaseServiceImpl<SiteManage, SiteManageSearch, SiteManageMapper> implements SiteManageService {

	@Override
	@Resource (name="siteManageMapper")
	protected void setMapper (SiteManageMapper mapper) {
		super.setMapper (mapper);
	}

	@Override
	public List<Map<String, Object>> selectSiteManageList(Map<String, Object> paramMap) {
		return mapper.selectSiteManageList(paramMap);
	}
	
	@Override
	public int selectSiteManageListCount(Map<String, Object> paramMap) {
		return mapper.selectSiteManageListCount(paramMap);
	}

	@Override
	public Map<String, Object> selectLinkSiteInfo(Map<String, Object> paramMap) {
		return mapper.selectLinkSiteInfo(paramMap);
	}

	@Override
	public void insertSiteInfo(Map<String, Object> paramMap) {
		String siteId = mapper.createSiteId();
		paramMap.put("siteId",siteId);
		mapper.insertSiteInfo(paramMap);
		mapper.insertSiteInfoHis(paramMap);
	}

	@Override
	public Map<String, Object> selectSiteManage(Map<String, Object> paramMap) {
		return mapper.selectSiteManage(paramMap);
	}

	@Override
	public void updateSiteInfo(Map<String, Object> paramMap) {
		mapper.updateSiteInfo(paramMap);
		mapper.insertSiteInfoHis(paramMap);
	}

	@Override
	public List<Map<String, Object>> selectSiteInfoHisList(Map<String, Object> paramMap) {
		return mapper.selectSiteInfoHisList(paramMap);
	}

	@Override
	public int selectSiteChk(Map<String, Object> paramMap) {
		return mapper.selectSiteChk(paramMap);
	}

	@Override
	public Map<String, Object> selectToolInfo(Map<String, Object> paramMap, String type) {
		if(type.equals("sensor")) {
			return mapper.selectSensorInfo(paramMap);
		}else if(type.equals("rtu")) {
			return mapper.selectRtuInfo(paramMap);
		}else if(type.equals("modem")) {
			return mapper.selectModemInfo(paramMap);
		}else {
			return null;
		}
	}

	@Override
	public void insertToolInfo(Map<String, Object> paramMap) {
  		String gubun = (String)  paramMap.get("gubun");
		if(gubun.equals("sensor")) {
			 mapper.insertSensorInfo(paramMap);
		}else if(gubun.equals("rtu")) {
			mapper.insertRtuInfo(paramMap);
		}else if(gubun.equals("modem")) {
			mapper.insertModemInfo(paramMap);
		}
		
 	}
	
	@Override
	public void updateToolInfo(Map<String, Object> paramMap) {
  		String gubun = (String)  paramMap.get("gubun");
		if(gubun.equals("sensor")) {
			 mapper.updateSensorInfo(paramMap);
			 mapper.insertSensorHis(paramMap);
 		}else if(gubun.equals("rtu")) {
			mapper.updateRtuInfo(paramMap);
			mapper.insertRtuHis(paramMap);
		}else if(gubun.equals("modem")) {
			mapper.updateModemInfo(paramMap);
			mapper.insertModemHis(paramMap);
		}
		
 	}
	
	@Override
	public void deleteToolInfo(Map<String, Object> paramMap) {
  		String gubun = (String)  paramMap.get("gubun");
		if(gubun.equals("sensor")) {
			 mapper.deleteSensorInfo(paramMap);
		}else if(gubun.equals("rtu")) {
			mapper.deleteRtuInfo(paramMap);
		}else if(gubun.equals("modem")) {
			mapper.deleteModemInfo(paramMap);
		}
		
 	}

	@Override
	public List<Map<String, Object>> selectToolInfoList(Map<String, Object> paramMap) {
		String gubun = (String) paramMap.get("searchTool");
		if(gubun.equals("sensor")) {
			return mapper.selectSensorInfoList(paramMap);
		}else if(gubun.equals("rtu")) {
			return mapper.selectRtuInfoList(paramMap);
		}else if(gubun.equals("modem")) {
			return mapper.selectModemInfoList(paramMap);
		}else {
			return null;
		}
	}

	@Override
	public Map<String, Object> selectSiteImgFileUpload(MultipartHttpServletRequest multi) {
		Map<String, Object> fileMap = new HashedMap<>();

		Iterator<String> files = multi.getFileNames();
		
		String filePath = PropertiesUtilNew.getProperty("AppConf.filePath.gwimage");
		
		File FolderFront = new File(filePath);

		// ?????? ??????????????? ???????????? ??????????????? ???????????????.
		if (!FolderFront.exists()) {
			try{
				FolderFront.mkdirs(); //?????? ???????????????.
			    System.out.println("????????? ?????????????????????.");
		        } 
		        catch(Exception e){
			    e.getStackTrace();
			}        
	         }else {
			System.out.println("?????? ????????? ???????????? ????????????.");
		}
		
		/*filePath = filePath+"/35";
		
		File FolderFront2 = new File(filePath);
		// ?????? ??????????????? ???????????? ??????????????? ???????????????.
		if (!FolderFront2.exists()) {
			try{
				FolderFront2.mkdir(); //?????? ???????????????.
			    System.out.println("????????? ?????????????????????.");
		        } 
		        catch(Exception e){
			    e.getStackTrace();
			}        
	         }else {
			System.out.println("?????? ????????? ???????????? ????????????.");
		}*/
		
		String path = filePath+ '/';
		
        while(files.hasNext()){
        	String uploadFile = files.next();
            MultipartFile mFile = multi.getFile(uploadFile);
            String fileName = mFile.getOriginalFilename();
            fileMap.put(uploadFile, null);
            if(!fileName.equals("")) {
            	fileMap.put(uploadFile, fileName);
                try {
                	mFile.transferTo(new File(path+fileName));
                 } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
		return fileMap;
	}

	@Override
	public List<Map<String, Object>> selectToolHis(Map<String, Object> paramMap) {
		/*String gubun = (String)  paramMap.get("gubun");
		if(gubun.equals("sensor")) {
			 return mapper.selectToolHis(paramMap);
		}else if(gubun.equals("rtu")) {
			mapper.deleteRtuInfo(paramMap);
		}else if(gubun.equals("modem")) {
			mapper.deleteModemInfo(paramMap);
		}*/
		return mapper.selectToolHis(paramMap);
	}

	@Override
	public void insertModelInfo(Map<String, Object> paramMap) {
		mapper.insertModelInfo(paramMap);
	}

	@Override
	public List<Map<String, Object>> selectModelInfoList(Map<String, Object> paramMap) {
		return mapper.selectModelInfoList(paramMap);
	}

	@Override
	public void updateModelInfo(Map<String, Object> paramMap) {
		mapper.updateModelInfo(paramMap);
	}

	@Override
	public Map<String, Object> selectModelInfo(Map<String, Object> paramMap) {
		return mapper.selectModelInfo(paramMap);
	}

	@Override
	public void deleteSiteInfo(Map<String, Object> paramMap) {
		mapper.deleteSiteInfo(paramMap);
	}
}
