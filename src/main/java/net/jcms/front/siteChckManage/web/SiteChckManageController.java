package net.jcms.front.siteChckManage.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.jcms.framework.base.web.BaseController;
import net.jcms.front.common.service.CommonService;
import net.jcms.front.common.web.CommonController;
import net.jcms.front.siteChckManage.service.SiteChckManageService;

@Controller
public class SiteChckManageController extends BaseController {
	@Resource (name="siteChckManageService")
	private SiteChckManageService siteChckManageService;
	
	@Autowired
	private CommonController commonController;
	
	@RequestMapping(value="/front/siteChckManage/selectSiteChckList.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> selectSiteChckList(HttpServletRequest request){
		Map<String,Object> resultMap = new HashedMap<>();
		Map<String,Object> paramMap = commonController.getParameterMap(request);
		try{
			List<Map<String,Object>> siteChckList = siteChckManageService.selectSiteChckList(paramMap);
			int siteChckListTotal = siteChckManageService.selectSiteChckListTotal(paramMap);
			resultMap.put("siteChckList", siteChckList);
			resultMap.put("total", siteChckListTotal);
			resultMap.put("result", "success");
		}catch (Exception e) {
			resultMap.put("result", "fail");
			resultMap.put("err", e.getMessage());
		}
		
		
		
		return resultMap;
	}
	
	@RequestMapping(value="/front/siteChckManage/selectSiteAndToolInfo.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> selectSiteAndToolInfo(HttpServletRequest request){
		Map<String,Object> resultMap = new HashedMap<>();
		Map<String,Object> paramMap = commonController.getParameterMap(request);
		try{
			Map<String,Object> siteAndToolInfo = siteChckManageService.selectSiteAndToolInfo(paramMap);
			
			Map<String,Object> data = (Map<String, Object>) siteAndToolInfo.get("siteAndToolInfo");
			List<Map<String,Object>> list = (List<Map<String, Object>>) siteAndToolInfo.get("sensorList");
			
			resultMap.put("data", data);
			resultMap.put("list", list);
			
			resultMap.put("result", "success");
		}catch (Exception e) {
			resultMap.put("result", "fail");
			resultMap.put("err", e.getMessage());
		}
		
		
		
		return resultMap;
	}
	
	@RequestMapping(value="/front/siteChckManage/selectRtuInfoList.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> selectRtuInfoList(HttpServletRequest request){
		Map<String,Object> resultMap = new HashedMap<>();
		Map<String,Object> paramMap = commonController.getParameterMap(request);
		try{
			List<Map<String,Object>> rtuInfoList = siteChckManageService.selectRtuInfoList(paramMap);
			
			resultMap.put("list", rtuInfoList);
			
			resultMap.put("result", "success");
		}catch (Exception e) {
			resultMap.put("result", "fail");
			resultMap.put("err", e.getMessage());
		}
		
		
		
		return resultMap;
	}
	
	@RequestMapping(value="/front/siteChckManage/selectModemInfoList.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> selectModemInfoList(HttpServletRequest request){
		Map<String,Object> resultMap = new HashedMap<>();
		Map<String,Object> paramMap = commonController.getParameterMap(request);
		try{
			List<Map<String,Object>> modemInfoList = siteChckManageService.selectModemInfoList(paramMap);
			
			resultMap.put("list", modemInfoList);
			
			resultMap.put("result", "success");
		}catch (Exception e) {
			resultMap.put("result", "fail");
			resultMap.put("err", e.getMessage());
		}
		
		
		
		return resultMap;
	}
	
	@RequestMapping(value="/front/siteChckManage/selectSensorInfoList.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> selectSensorInfoList(HttpServletRequest request){
		Map<String,Object> resultMap = new HashedMap<>();
		Map<String,Object> paramMap = commonController.getParameterMap(request);
		try{
			List<Map<String,Object>> sensorInfoList = siteChckManageService.selectSensorInfoList(paramMap);
			
			resultMap.put("list", sensorInfoList);
			
			resultMap.put("result", "success");
		}catch (Exception e) {
			resultMap.put("result", "fail");
			resultMap.put("err", e.getMessage());
		}
		
		
		
		return resultMap;
	}
	
	@RequestMapping(value="/front/siteChckManage/chgSiteRtu.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> chgSiteRtu(HttpServletRequest request){
		Map<String,Object> resultMap = new HashedMap<>();
		Map<String,Object> paramMap = commonController.getParameterMap(request);
		try{
			siteChckManageService.chgSiteRtu(paramMap);
			
			resultMap.put("result", "success");
		}catch (Exception e) {
			resultMap.put("result", "fail");
			resultMap.put("err", e.getMessage());
		}
		
		
		
		return resultMap;
	}
	
	@RequestMapping(value="/front/siteChckManage/chgSiteModem.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> chgSiteModem(HttpServletRequest request){
		Map<String,Object> resultMap = new HashedMap<>();
		Map<String,Object> paramMap = commonController.getParameterMap(request);
		try{
			siteChckManageService.chgSiteModem(paramMap);
			
			resultMap.put("result", "success");
		}catch (Exception e) {
			resultMap.put("result", "fail");
			resultMap.put("err", e.getMessage());
		}
		
		
		
		return resultMap;
	}
	
	@RequestMapping(value="/front/siteChckManage/chgSiteSensor.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> chgSiteSensor(HttpServletRequest request){
		Map<String,Object> resultMap = new HashedMap<>();
		Map<String,Object> paramMap = commonController.getParameterMap(request);
		try{
			siteChckManageService.chgSiteSensor(paramMap);
			
			resultMap.put("result", "success");
		}catch (Exception e) {
			resultMap.put("result", "fail");
			resultMap.put("err", e.getMessage());
		}
		return resultMap;
	}
	
	@RequestMapping(value="/front/siteChckManage/selectSiteChekList.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> selectSiteChekList(HttpServletRequest request){
		Map<String,Object> resultMap = new HashedMap<>();
		Map<String,Object> paramMap = commonController.getParameterMap(request);
		try{
			List<Map<String,Object>>siteChekList = siteChckManageService.selectSiteChekList(paramMap);
			
			resultMap.put("list", siteChekList);
			
			resultMap.put("result", "success");
		}catch (Exception e) {
			resultMap.put("resu lt", "fail");
			resultMap.put("err", e.getMessage());
		}
		return resultMap;
	}
	
	@RequestMapping(value="/front/siteChckManage/selectSiteChekInfo.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> selectSiteChekInfo(HttpServletRequest request){
		Map<String,Object> resultMap = new HashedMap<>();
		Map<String,Object> paramMap = commonController.getParameterMap(request);
		try{
			Map<String,Object>siteChekInfo = siteChckManageService.selectSiteChekInfo(paramMap);
			
			resultMap.put("data", siteChekInfo);
			
			resultMap.put("result", "success");
		}catch (Exception e) {
			resultMap.put("resu lt", "fail");
			resultMap.put("err", e.getMessage());
		}
		return resultMap;
	}
	
	
	
	@RequestMapping(value="/front/siteChckManage/insertSiteChekInfo.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> insertSiteChekInfo(HttpServletRequest request){
		Map<String,Object> resultMap = new HashedMap<>();
		Map<String,Object> paramMap = commonController.getParameterMap(request);
		try{
			siteChckManageService.insertSiteChekInfo(paramMap);
			
			resultMap.put("result", "success");
		}catch (Exception e) {
			resultMap.put("resu lt", "fail");
			resultMap.put("err", e.getMessage());
		}
		return resultMap;
	}
	
	@RequestMapping(value="/front/siteChckManage/updateSiteChekInfo.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> updateSiteChekInfo(HttpServletRequest request){
		Map<String,Object> resultMap = new HashedMap<>();
 		Map<String,Object> paramMap = commonController.getParameterMap(request);
		try{
			siteChckManageService.updateSiteChekInfo(paramMap);
			
			resultMap.put("result", "success");
		}catch (Exception e) {
			resultMap.put("result", "fail");
			resultMap.put("err", e.getMessage());
		}
		return resultMap;
	}
	
	@RequestMapping(value="/front/siteChckManage/selectSiteChckStatics.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> selectSiteChckStatics(HttpServletRequest request){
		Map<String,Object> resultMap = new HashedMap<>();
 		Map<String,Object> paramMap = commonController.getParameterMap(request);
		try{
			List<Map<String,Object>> list = siteChckManageService.selectSiteChckStatics(paramMap);
			
			resultMap.put("list", list);
			
			resultMap.put("result", "success");
		}catch (Exception e) {
			resultMap.put("result", "fail");
			resultMap.put("err", e.getMessage());
		}
		return resultMap;
	}
}


