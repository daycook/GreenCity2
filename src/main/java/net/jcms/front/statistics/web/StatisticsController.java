package net.jcms.front.statistics.web;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.jcms.framework.base.web.BaseController;
import net.jcms.front.common.service.CommonService;
import net.jcms.front.common.web.CommonController;
import net.jcms.front.statistics.service.StatisticsService;

@Controller
public class StatisticsController extends BaseController {
	@Resource (name="commonService")
	private CommonService commonService;
	
	
	@Resource (name="statisticsService")
	private StatisticsService statisticsService;
	
	@Autowired
	private CommonController commonController;
	
	@RequestMapping("front/statistics/selectRealTimeDataList.json")
	@ResponseBody
	public Map<String, Object>selectRealTimeDataList(HttpServletRequest request){
		Map<String, Object> result = new HashedMap<>();
		Map<String, Object> paramMap = commonController.getParameterMap(request);
		List<Map<String,Object>> realTimeDataList = statisticsService.selectRealTimeDataList(paramMap);
		result.put("realTimeDataList", realTimeDataList);
		return result;
	}
	
	@RequestMapping("front/statistics/selectRealTimeDataListExcel.json")
	@ResponseBody
	public Map<String,Object> selectRealTimeDataListExcel(HttpServletRequest request, HttpServletResponse respons){
		Map<String, Object> result = new HashedMap<>();
		Map<String, Object> paramMap = commonController.getParameterMap(request);
		List<Map<String,Object>> realTimeDataList = statisticsService.selectRealTimeDataList(paramMap);
		
		String[] title = {"????????????","????????????","????????????","??????_TOC","????????????", "??????EL","??????GL","??????","??????","???????????????","?????????","NO3", "NH4", "PH","NH3","?????????"};
		String[] cont = {"siteName","mSn","siteDph","siteAltoc","chDataTime", "el","gl","pressr","temp","ec","batt", "no3", "nh4", "ph","nh3","wBaro"};
		
		String fileName = commonService.excelDown(request, respons, realTimeDataList, title, cont);
		
		result.put("fileName", fileName);
		return result;
	}
	
	
	//pro302 ??????????????????
	@RequestMapping("front/statistics/selectRealTimeDataListExcel2.json")
	@ResponseBody
	public Map<String,Object> selectRealTimeDataListExcel2(HttpServletRequest request, HttpServletResponse respons){
		Map<String, Object> result = new HashedMap<>();
		Map<String, Object> paramMap = commonController.getParameterMap(request);
		List<Map<String,Object>> DataList = statisticsService.selectAvgList(paramMap);
		
		String[] title = {"??????","??????","??????EL","??????GL","??????","??????","???????????????","?????????","NO3", "NH4", "PH","NH3","?????????"};
		String[] cont = {"time","sensor","el","gl","pressr","temp","ec","batt", "no3", "nh4", "ph","nh3","wBaro"};
		
		String fileName = commonService.excelDown(request, respons, DataList, title, cont);
		
		result.put("fileName", fileName);
		return result;
	}
	
	
	@RequestMapping("front/statistics/selectRealTimeDataListExcelDown.do")
	public void selectRealTimeDataListExcelDown(HttpServletRequest request, HttpServletResponse respons){
		commonService.download(respons, request.getParameter("excelFileName"), request.getParameter("excelFileDownName"));
	}
	
	
	//???????????? selectbox ???????????? ????????????
	@RequestMapping("front/statistics/selectObsvname.json")
	@ResponseBody
	public Map<String, Object>selectObsvname(HttpServletRequest request){
		Map<String, Object> result = new HashedMap<>();
		List<Map<String,Object>> resultlist = statisticsService.selectObsvname();
		result.put("resultlist", resultlist);
		return result;
	}
	
	
	//???????????? ?????? ????????????
	@RequestMapping("front/statistics/selectSensorList.json")
	@ResponseBody
	public Map<String, Object>selectSensorList(HttpServletRequest request){
		Map<String, Object> result = new HashedMap<>();
		Map<String, Object> paramMap = commonController.getParameterMap(request);
		List<Map<String,Object>> resultlist = statisticsService.selectSensorNm(paramMap);
		result.put("resultlist", resultlist);
		return result;
	}
	
	//???????????? ??????(?????????)
	@RequestMapping("front/statistics/selectAvgList.json")
	@ResponseBody
	public Map<String, Object>selectAvgList(HttpServletRequest request){
		Map<String, Object> result = new HashedMap<>();
		Map<String, Object> paramMap = commonController.getParameterMap(request);
		
		List<Map<String,Object>> DataList = statisticsService.selectAvgList(paramMap);
		int Count = statisticsService.selectAvgListCnt(paramMap);
		
		result.put("DataList", DataList);
		result.put("Count", Count);
		
		return result;
	}
	
	//???????????? ??????(????????????)
	@RequestMapping("front/statistics/selectGraphList.json")
	@ResponseBody
	public Map<String, Object>selectGraphList(HttpServletRequest request){
		Map<String, Object> result = new HashedMap<>();
		Map<String, Object> paramMap = commonController.getParameterMap(request);
		List<Map<String,Object>> resultlist = statisticsService.selectGraphList(paramMap);
		result.put("resultlist", resultlist);
		return result;
	}
	
	
	
	
	//pro401
	//?????????, ?????? ??? ????????? ????????????
	@RequestMapping("front/statistics/selectUpdateList.json")
	@ResponseBody
	public Map<String, Object>selectUpdateList(HttpServletRequest request){
		Map<String, Object> result = new HashedMap<>();
		Map<String, Object> paramMap = commonController.getParameterMap(request);
		List<Map<String,Object>> resultlist = statisticsService.selectUpdateList(paramMap);
		result.put("resultlist", resultlist);
		return result;
	}
	
	
	//????????? ?????????
	@RequestMapping("front/statistics/resetList.json")
	@ResponseBody
	public Map<String, Object>resetList(HttpServletRequest request){
		Map<String, Object> result = new HashedMap<>();
		Map<String, Object> paramMap = commonController.getParameterMap(request);
		statisticsService.resetList(paramMap);
		result.put("result", "success");
		return result;
	}
	
	
	//????????? ??????
	@RequestMapping("front/statistics/changeYnList.json")
	@ResponseBody
	public Map<String, Object>changeYnList(HttpServletRequest request){
		Map<String, Object> result = new HashedMap<>();
		Map<String, Object> paramMap = commonController.getParameterMap(request);
		List<Map<String,Object>> resultlist = statisticsService.changeYnList(paramMap);
		result.put("resultlist", resultlist);
		return result;
	}
	
	@RequestMapping("front/statistics/updateList.json")
	@ResponseBody
	public Map<String, Object>updateList(HttpServletRequest request){
		Map<String, Object> result = new HashedMap<>();
		Map<String, Object> paramMap = commonController.getParameterMap(request);
		statisticsService.updateList(paramMap);
		result.put("result", "success");
		return result;
	}
	
	
	//????????? ??????
	@RequestMapping("front/statistics/deleteList.json")
	@ResponseBody
	public Map<String, Object>deleteList(HttpServletRequest request){
		Map<String, Object> result = new HashedMap<>();
		Map<String, Object> paramMap = commonController.getParameterMap(request);
		statisticsService.deleteList(paramMap);
		result.put("result", "success");
		return result;
	}
	
	//????????? ????????????
	@RequestMapping("front/statistics/groupUpdateList.json")
	@ResponseBody
	public Map<String, Object>groupUpdateList(HttpServletRequest request, @RequestParam(value="arrayCheck[]") String[] arrayCheck){
		Map<String, Object> result = new HashedMap<>();
		Map<String, Object> paramMap = commonController.getParameterMap(request);
		paramMap.put("arrayCheck", arrayCheck);
		statisticsService.groupUpdateList(paramMap);
		result.put("result", "success");
		return result;
	}
	
	//????????? ???????????????
	@RequestMapping("front/statistics/groupResetList.json")
	@ResponseBody
	public Map<String, Object>groupResetList(HttpServletRequest request, @RequestParam(value="arrayCheck[]") String[] arrayCheck){
		Map<String, Object> result = new HashedMap<>();
		Map<String, Object> paramMap = commonController.getParameterMap(request);
		paramMap.put("arrayCheck", arrayCheck);
		statisticsService.groupResetList(paramMap);
		result.put("result", "success");
		return result;
	}
	
	//????????? ????????????
	@RequestMapping("front/statistics/groupDeleteList.json")
	@ResponseBody
	public Map<String, Object>groupDeleteList(HttpServletRequest request, @RequestParam(value="arrayCheck[]") String[] arrayCheck){
		Map<String, Object> result = new HashedMap<>();
		Map<String, Object> paramMap = commonController.getParameterMap(request);
		paramMap.put("arrayCheck", arrayCheck);
		statisticsService.groupDeleteList(paramMap);
		result.put("result", "success");
		return result;
	}
	
	@RequestMapping (value="/front/statistics/selectMapChartGwDataList.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectMapChartGwDataList(HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> paramMap = commonController.getParameterMap(request);
		try {
			Map<String, Object> seqSiteData= statisticsService.selectSeqSiteData(paramMap);
			if(seqSiteData == null) {
				paramMap.put("seqSiteId", 0);
				seqSiteData= statisticsService.selectSeqSiteData(paramMap);
			}
			paramMap.put("siteId", seqSiteData.get("siteId"));
			List<Map<String, Object>> list= statisticsService.selectMapChartGwDataList(paramMap);
			Map<String, Object> maxMinData= statisticsService.selectMapChartGwDataMaxMin(paramMap);
			
			String siteLa = (String) seqSiteData.get("siteLa");
			String siteLo = (String) seqSiteData.get("siteLo");
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
					
					seqSiteData.put("la", la);
					seqSiteData.put("lo", lo);
				}else if(las.length == 1 && los.length == 1){
					seqSiteData.put("la", siteLa);
					seqSiteData.put("lo", siteLo);
				}else {
					seqSiteData.put("la", null);
					seqSiteData.put("lo", null);
				}
			}else {
				seqSiteData.put("la", null);
				seqSiteData.put("lo", null);
			}
			
			Map<String, Object> situationData= statisticsService.selectSituationDataGrp(paramMap);
			
			Map<String, Object> pumpData= statisticsService.selectPumpUseData(paramMap);
			
			result.put("seqSiteData", seqSiteData);
			result.put("list", list);
			result.put("maxMinData", maxMinData);
			
			result.put("situationData", situationData);
			result.put("pumpData", pumpData);
			
			result.put("result", "success");
		} catch (Exception e) {
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
}
