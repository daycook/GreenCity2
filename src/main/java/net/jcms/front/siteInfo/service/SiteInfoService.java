package net.jcms.front.siteInfo.service;

import java.util.List;
import java.util.Map;

import net.jcms.framework.base.service.BaseService;
import net.jcms.front.siteInfo.model.SiteInfo;
import net.jcms.front.siteInfo.model.SiteInfoSearch;

public interface SiteInfoService extends BaseService<SiteInfo, SiteInfoSearch> {

	List<Map<String, Object>> selectSiteInfoList(Map<String, Object> paramMap);

	int selectSiteInfoListCount(Map<String, Object> paramMap);

	Map<String, Object> selectSiteInfo(Map<String, Object> paramMap);

	Map<String, Object> selectSiteInfoAndData(Map<String, Object> paramMap);

	List<Map<String, Object>> selectSiteInfoAllList(Map<String, Object> paramMap);

	List<Map<String, Object>> selectErrSiteList(Map<String, Object> paramMap);

}
