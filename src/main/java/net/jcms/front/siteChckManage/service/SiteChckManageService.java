package net.jcms.front.siteChckManage.service;

import java.util.List;
import java.util.Map;

import net.jcms.framework.base.service.BaseService;
import net.jcms.front.siteChckManage.model.SiteChckManage;
import net.jcms.front.siteChckManage.model.SiteChckManageSearch;

public interface SiteChckManageService extends BaseService<SiteChckManage, SiteChckManageSearch> {

	List<Map<String, Object>> selectSiteChckList(Map<String, Object> paramMap);

	int selectSiteChckListTotal(Map<String, Object> paramMap);

	Map<String, Object> selectSiteAndToolInfo(Map<String, Object> paramMap);

	List<Map<String, Object>> selectRtuInfoList(Map<String, Object> paramMap);

	List<Map<String, Object>> selectModemInfoList(Map<String, Object> paramMap);

	List<Map<String, Object>> selectSensorInfoList(Map<String, Object> paramMap);

	void chgSiteModem(Map<String, Object> paramMap);

	void chgSiteRtu(Map<String, Object> paramMap);

	void chgSiteSensor(Map<String, Object> paramMap);

	void insertSiteChekInfo(Map<String, Object> paramMap);

	void updateSiteChekInfo(Map<String, Object> paramMap);

	List<Map<String, Object>> selectSiteChekList(Map<String, Object> paramMap);

	Map<String, Object> selectSiteChekInfo(Map<String, Object> paramMap);

	List<Map<String, Object>> selectSiteChckStatics(Map<String, Object> paramMap);
	
}
