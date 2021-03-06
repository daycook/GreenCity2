package net.jcms.front.siteManage.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.jcms.framework.base.service.BaseService;
import net.jcms.front.siteManage.model.SiteManage;
import net.jcms.front.siteManage.model.SiteManageSearch;

public interface SiteManageService extends BaseService<SiteManage, SiteManageSearch> {

	List<Map<String, Object>> selectSiteManageList(Map<String, Object> paramMap);
	int selectSiteManageListCount(Map<String, Object> paramMap);

	Map<String, Object> selectLinkSiteInfo(Map<String, Object> paramMap);

	void insertSiteInfo(Map<String, Object> paramMap);

	Map<String, Object> selectSiteManage(Map<String, Object> paramMap);

	void updateSiteInfo(Map<String, Object> paramMap);

	List<Map<String, Object>> selectSiteInfoHisList(Map<String, Object> paramMap);
	int selectSiteChk(Map<String, Object> paramMap);
	Map<String, Object> selectToolInfo(Map<String, Object> paramMap, String type);
	void insertToolInfo(Map<String, Object> paramMap);
	void updateToolInfo(Map<String, Object> paramMap);
	void deleteToolInfo(Map<String, Object> paramMap);
	List<Map<String, Object>> selectToolInfoList(Map<String, Object> paramMap);
	Map<String, Object> selectSiteImgFileUpload(MultipartHttpServletRequest multi);
	List<Map<String, Object>> selectToolHis(Map<String, Object> paramMap);
	void insertModelInfo(Map<String, Object> paramMap);
	List<Map<String, Object>> selectModelInfoList(Map<String, Object> paramMap);
	void updateModelInfo(Map<String, Object> paramMap);
	Map<String, Object> selectModelInfo(Map<String, Object> paramMap);
	void deleteSiteInfo(Map<String, Object> paramMap);

}
