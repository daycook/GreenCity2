package net.jcms.front.siteInfo.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.jcms.framework.base.web.BaseController;
import net.jcms.front.common.web.CommonController;
import net.jcms.front.siteInfo.service.SiteInfoService;

@Controller
public class SiteInfoController extends BaseController {
	
	@Resource (name="siteInfoService")
	private SiteInfoService siteInfoService;
	
	@Autowired
	private CommonController commonController;
	
	@RequestMapping (value="/front/siteInfo/selectSiteInfoList.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectSiteInfoList(HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> paramMap = commonController.getParameterMap(request);
		try {
			int total = siteInfoService.selectSiteInfoListCount(paramMap);
			
			result.put("total", total);
			
			List<Map<String, Object>> siteInfoList= siteInfoService.selectSiteInfoList(paramMap);
			result.put("siteInfoList", siteInfoList);
			result.put("result", "success");
		}catch (Exception e) {
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	
	@RequestMapping (value="/front/siteInfo/selectSiteInfo.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectSiteInfo(HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> paramMap = commonController.getParameterMap(request);
		try {
			Map<String, Object> siteInfo= siteInfoService.selectSiteInfo(paramMap);
			result.put("siteInfo", siteInfo);
			result.put("result", "success");
		} catch (Exception e) {
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/front/siteInfo/selectSiteInfoAndData.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectSiteInfoAndData(HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> paramMap = commonController.getParameterMap(request);
		try {
			Map<String, Object> siteInfo= siteInfoService.selectSiteInfoAndData(paramMap);
			result.put("siteInfo", siteInfo);
			result.put("result", "success");
		} catch (Exception e) {
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/front/siteInfo/selectSiteInfoAllList.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectSiteInfoAllList(HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> paramMap = commonController.getParameterMap(request);
		try {
			List<Map<String, Object>> list= siteInfoService.selectSiteInfoAllList(paramMap);
			result.put("list", list);
			result.put("result", "success");
		} catch (Exception e) {
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	
	@RequestMapping (value="/front/siteInfo/selectErrSiteList.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectErrSiteList(HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> paramMap = commonController.getParameterMap(request);
		try {
			
			List<Map<String, Object>> selectErrSiteList= siteInfoService.selectErrSiteList(paramMap);
			result.put("selectErrSiteList", selectErrSiteList);
			result.put("result", "success");
		}catch (Exception e) {
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
}
