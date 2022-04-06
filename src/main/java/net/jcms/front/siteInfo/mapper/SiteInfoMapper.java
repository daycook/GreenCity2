package net.jcms.front.siteInfo.mapper;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import net.jcms.framework.base.mapper.BaseMapper;
import net.jcms.front.siteInfo.model.SiteInfo;
import net.jcms.front.siteInfo.model.SiteInfoSearch;

@Mapper (value="siteInfoMapper")
public interface SiteInfoMapper extends BaseMapper<SiteInfo, SiteInfoSearch> {

	List<Map<String, Object>> selectSiteInfoList(Map<String, Object> paramMap);

	int selectSiteInfoListCount(Map<String, Object> paramMap);

	Map<String, Object> selectSiteInfo(Map<String, Object> paramMap);

	Map<String, Object> selectSiteInfoAndData(Map<String, Object> paramMap);

	List<Map<String, Object>> selectSiteInfoAllList(Map<String, Object> paramMap);

	List<Map<String, Object>> selectErrSiteList(Map<String, Object> paramMap);

}
