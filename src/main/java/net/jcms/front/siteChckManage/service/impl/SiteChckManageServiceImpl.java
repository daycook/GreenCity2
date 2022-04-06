package net.jcms.front.siteChckManage.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.stereotype.Service;

import net.jcms.framework.base.service.impl.BaseServiceImpl;
import net.jcms.front.siteChckManage.mapper.SiteChckManageMapper;
import net.jcms.front.siteChckManage.model.SiteChckManage;
import net.jcms.front.siteChckManage.model.SiteChckManageSearch;
import net.jcms.front.siteChckManage.service.SiteChckManageService;

@Service(value="siteChckManageService")

public class SiteChckManageServiceImpl extends BaseServiceImpl<SiteChckManage, SiteChckManageSearch, SiteChckManageMapper> implements SiteChckManageService {

	@Override
	@Resource (name="siteChckManageMapper")
	protected void setMapper (SiteChckManageMapper mapper) {
		super.setMapper (mapper);
	}

	@Override
	public List<Map<String, Object>> selectSiteChckList(Map<String, Object> paramMap) {
		return mapper.selectSiteChckList(paramMap);
	}

	@Override
	public int selectSiteChckListTotal(Map<String, Object> paramMap) {
		return mapper.selectSiteChckListTotal(paramMap);
	}

	@Override
	public Map<String, Object> selectSiteAndToolInfo(Map<String, Object> paramMap) {
		Map<String ,Object> selectSiteAndToolInfo = new HashedMap<>();
		
		Map<String, Object> siteAndToolInfo = null;
		List<Map<String ,Object>> sensorList = null;
		
		if(paramMap.get("linkYn").equals("Y")) {	
			siteAndToolInfo = mapper.selectSiteAndToolInfoLink(paramMap);
			sensorList = mapper.selectSensorListLink(paramMap);
		}else{
			siteAndToolInfo = mapper.selectSiteAndToolInfo(paramMap);
			sensorList = mapper.selectSensorList(paramMap);
		}
		
		selectSiteAndToolInfo.put("siteAndToolInfo", siteAndToolInfo);
		selectSiteAndToolInfo.put("sensorList", sensorList);
		
		return selectSiteAndToolInfo;
	}

	@Override
	public List<Map<String, Object>> selectRtuInfoList(Map<String, Object> paramMap) {
		return mapper.selectRtuInfoList(paramMap);
	}

	@Override
	public List<Map<String, Object>> selectModemInfoList(Map<String, Object> paramMap) {
		return mapper.selectModemInfoList(paramMap);
	}

	@Override
	public List<Map<String, Object>> selectSensorInfoList(Map<String, Object> paramMap) {
		return mapper.selectSensorInfoList(paramMap);
	}

	@Override
	public void chgSiteModem(Map<String, Object> paramMap) {
		mapper.chgSiteModemOld(paramMap);
		mapper.chgSiteModemNew(paramMap);
	}
	
	@Override
	public void chgSiteRtu(Map<String, Object> paramMap) {
		mapper.chgSiteRtuOld(paramMap);
		mapper.chgSiteRtuNew(paramMap);
	}
	
	@Override
	public void chgSiteSensor(Map<String, Object> paramMap) {
		mapper.chgSiteSensorOld(paramMap);
		mapper.chgSiteSensorNew(paramMap);
	}

	@Override
	public void insertSiteChekInfo(Map<String, Object> paramMap) {
		mapper.insertSiteChekInfo(paramMap);
	}

	@Override
	public void updateSiteChekInfo(Map<String, Object> paramMap) {
		mapper.updateSiteChekInfo(paramMap);
	}

	@Override
	public List<Map<String, Object>> selectSiteChekList(Map<String, Object> paramMap) {
		return mapper.selectSiteChekList(paramMap);
	}

	@Override
	public Map<String, Object> selectSiteChekInfo(Map<String, Object> paramMap) {
		return mapper.selectSiteChekInfo(paramMap);
	}
	
	@Override
	public List<Map<String, Object>> selectSiteChckStatics(Map<String, Object> paramMap) {
		return mapper.selectSiteChckStatics(paramMap);
	}
}
