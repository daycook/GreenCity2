package net.jcms.front.siteChckManage.mapper;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import net.jcms.framework.base.mapper.BaseMapper;
import net.jcms.front.siteChckManage.model.SiteChckManage;
import net.jcms.front.siteChckManage.model.SiteChckManageSearch;

@Mapper (value="siteChckManageMapper")
public interface SiteChckManageMapper extends BaseMapper<SiteChckManage, SiteChckManageSearch> {

	List<Map<String, Object>> selectSiteChckList(Map<String, Object> paramMap);

	int selectSiteChckListTotal(Map<String, Object> paramMap);

	List<Map<String, Object>> selectSensorList(Map<String, Object> paramMap);

	Map<String, Object> selectSiteAndToolInfo(Map<String, Object> paramMap);

	Map<String, Object> selectSiteAndToolInfoLink(Map<String, Object> paramMap);

	List<Map<String, Object>> selectSensorListLink(Map<String, Object> paramMap);

	List<Map<String, Object>> selectRtuInfoList(Map<String, Object> paramMap);

	List<Map<String, Object>> selectModemInfoList(Map<String, Object> paramMap);

	List<Map<String, Object>> selectSensorInfoList(Map<String, Object> paramMap);

	void chgSiteModemOld(Map<String, Object> paramMap);

	void chgSiteModemNew(Map<String, Object> paramMap);

	void chgSiteRtuOld(Map<String, Object> paramMap);

	void chgSiteRtuNew(Map<String, Object> paramMap);

	void chgSiteSensorOld(Map<String, Object> paramMap);

	void chgSiteSensorNew(Map<String, Object> paramMap);

	void insertSiteChekInfo(Map<String, Object> paramMap);

	void updateSiteChekInfo(Map<String, Object> paramMap);

	List<Map<String, Object>> selectSiteChekList(Map<String, Object> paramMap);

	Map<String, Object> selectSiteChekInfo(Map<String, Object> paramMap);

	List<Map<String, Object>> selectSiteChckStatics(Map<String, Object> paramMap);

}
