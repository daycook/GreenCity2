package net.jcms.front.siteInfo.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.stereotype.Service;

import net.jcms.framework.base.service.impl.BaseServiceImpl;
import net.jcms.front.siteInfo.mapper.SiteInfoMapper;
import net.jcms.front.siteInfo.model.SiteInfo;
import net.jcms.front.siteInfo.model.SiteInfoSearch;
import net.jcms.front.siteInfo.service.SiteInfoService;

@Service(value="siteInfoService")
public class SiteInfoServiceImpl extends BaseServiceImpl<SiteInfo, SiteInfoSearch, SiteInfoMapper> implements SiteInfoService {

	@Override
	@Resource (name="siteInfoMapper")
	protected void setMapper (SiteInfoMapper mapper) {
		super.setMapper (mapper);
	}

	@Override
	public List<Map<String, Object>> selectSiteInfoList(Map<String, Object> paramMap) {
		List<Map<String, Object>> list = mapper.selectSiteInfoList(paramMap);
		
		//도분초를 위경도로 변환하는 소스
		int leng = list.size();
		Map<String ,Object> dataMap = new HashedMap<>();
		for(int i=0; i<leng; i++) {
			dataMap = list.get(i);
			
			String siteLa = (String) dataMap.get("siteLa");
			String siteLo = (String) dataMap.get("siteLo");
			if(siteLa != null && siteLo != null) {
				String[] las = siteLa.split(" ");
				String[] los = siteLo.split(" ");
				if(las.length == 3 && los.length == 3){
					Double la0 = Double.parseDouble(las[0]);
					Double la1 = Double.parseDouble(las[1]);
					Double la2 = Double.parseDouble(las[2]);
					Double la = la0+(la1/60)+(la2/3600);
					
					Double lo0 = Double.parseDouble(los[0]);
					Double lo1 = Double.parseDouble(los[1]);
					Double lo2 = Double.parseDouble(los[2]);
					Double lo = lo0+(lo1/60)+(lo2/3600);
					
					list.get(i).put("la", la);
					list.get(i).put("lo", lo);
				}else if(las.length == 1 && los.length == 1){
					list.get(i).put("la", siteLa);
					list.get(i).put("lo", siteLo);
				}else {
					list.get(i).put("la", null);
					list.get(i).put("lo", null);
				}
			}else {
				list.get(i).put("la", null);
				list.get(i).put("lo", null);
			}
		}	
		return list;
	}

	@Override
	public int selectSiteInfoListCount(Map<String, Object> paramMap) {
		return mapper.selectSiteInfoListCount(paramMap);
	}
	
	@Override
	public Map<String, Object> selectSiteInfo(Map<String, Object> paramMap) {
		Map<String, Object> dataMap = mapper.selectSiteInfo(paramMap);
		
		if(dataMap != null) {
			String siteLa = (String) dataMap.get("siteLa");
			String siteLo = (String) dataMap.get("siteLo");
			
			if(siteLa != null && siteLo != null) {
				String[] las = siteLa.split(" ");
				String[] los = siteLo.split(" ");
				if(las.length == 3 && los.length == 3){
					Double la0 = Double.parseDouble(las[0]);
					Double la1 = Double.parseDouble(las[1]);
					Double la2 = Double.parseDouble(las[2]);
					Double la = la0+(la1/60)+(la2/3600);
					
					Double lo0 = Double.parseDouble(los[0]);
					Double lo1 = Double.parseDouble(los[1]);
					Double lo2 = Double.parseDouble(los[2]);
					Double lo = lo0+(lo1/60)+(lo2/3600);
					
					dataMap.put("la", la);
					dataMap.put("lo", lo);
				}else if(las.length == 1 && los.length == 1){
					dataMap.put("la", siteLa);
					dataMap.put("lo", siteLo);
				}else {
					dataMap.put("la", null);
					dataMap.put("lo", null);
				}
			}else {
				dataMap.put("la", null);
				dataMap.put("lo", null);
			}
		}
		return dataMap;
	}

	@Override
	public Map<String, Object> selectSiteInfoAndData(Map<String, Object> paramMap) {
		Map<String, Object> dataMap = mapper.selectSiteInfoAndData(paramMap);
		return dataMap;
	}

	@Override
	public List<Map<String, Object>> selectSiteInfoAllList(Map<String, Object> paramMap) {
		return mapper.selectSiteInfoAllList(paramMap);
	}
	
	@Override
	public List<Map<String, Object>> selectErrSiteList(Map<String, Object> paramMap) {
		return mapper.selectErrSiteList(paramMap);
	}
	
}
