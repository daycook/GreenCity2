package net.jcms.front.siteManage.mapper;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import net.jcms.framework.base.mapper.BaseMapper;
import net.jcms.front.siteManage.model.SiteManage;
import net.jcms.front.siteManage.model.SiteManageSearch;

@Mapper (value="siteManageMapper")
public interface SiteManageMapper extends BaseMapper<SiteManage, SiteManageSearch> {

	List<Map<String, Object>> selectSiteManageList(Map<String, Object> paramMap);

	Map<String, Object> selectLinkSiteInfo(Map<String, Object> paramMap);

	void insertSiteInfo(Map<String, Object> paramMap);

	Map<String, Object> selectSiteManage(Map<String, Object> paramMap);

	void updateSiteInfo(Map<String, Object> paramMap);

	String createSiteId();

	void insertSiteInfoHis(Map<String, Object> paramMap);

	List<Map<String, Object>> selectSiteInfoHisList(Map<String, Object> paramMap);

	int selectSiteManageListCount(Map<String, Object> paramMap);

	int selectSiteChk(Map<String, Object> paramMap);

	Map<String, Object> selectSensorInfo(Map<String, Object> paramMap);

	Map<String, Object> selectRtuInfo(Map<String, Object> paramMap);

	Map<String, Object> selectModemInfo(Map<String, Object> paramMap);

	void insertSensorInfo(Map<String, Object> paramMap);
	void insertRtuInfo(Map<String, Object> paramMap);
	void insertModemInfo(Map<String, Object> paramMap);

	void updateSensorInfo(Map<String, Object> paramMap);
	void updateRtuInfo(Map<String, Object> paramMap);
	void updateModemInfo(Map<String, Object> paramMap);
	
	void deleteSensorInfo(Map<String, Object> paramMap);
	void deleteRtuInfo(Map<String, Object> paramMap);
	void deleteModemInfo(Map<String, Object> paramMap);
	
	List<Map<String, Object>> selectSensorInfoList(Map<String, Object> paramMap);

	List<Map<String, Object>> selectRtuInfoList(Map<String, Object> paramMap);

	List<Map<String, Object>> selectModemInfoList(Map<String, Object> paramMap);

	void insertSensorHis(Map<String, Object> paramMap);
	void insertRtuHis(Map<String, Object> paramMap);
	void insertModemHis(Map<String, Object> paramMap);

	List<Map<String, Object>> selectToolHis(Map<String, Object> paramMap);

	void insertModelInfo(Map<String, Object> paramMap);

	List<Map<String, Object>> selectModelInfoList(Map<String, Object> paramMap);

	void updateModelInfo(Map<String, Object> paramMap);

	Map<String, Object> selectModelInfo(Map<String, Object> paramMap);

	void deleteSiteInfo(Map<String, Object> paramMap);
}
