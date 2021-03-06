package net.jcms.front.siteManage.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.jcms.framework.base.web.BaseController;
import net.jcms.front.common.service.CommonService;
import net.jcms.front.common.web.CommonController;
import net.jcms.front.siteManage.service.SiteManageService;

@Controller
public class SiteManageController extends BaseController {
	
	@Resource (name="siteManageService")
	private SiteManageService siteManageService;
	
	@Autowired
	private CommonController commonController;
	
	@Resource (name="commonService")
	private CommonService commonService;
	
	@RequestMapping (value="/front/siteManage/selectSiteInfoList.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectSiteInfoList(HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> paramMap = commonController.getParameterMap(request);
		try {
			int total = siteManageService.selectSiteManageListCount(paramMap);
			List<Map<String, Object>> siteInfoList= siteManageService.selectSiteManageList(paramMap);
			
			result.put("total", total);
			result.put("siteInfoList", siteInfoList);
			result.put("result", "success");
		} catch (Exception e) {
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/front/siteManage/insertSiteInfo.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertSiteInfo(HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> paramMap = commonController.getParameterMap(request);
		
		try {
			int siteChk= siteManageService.selectSiteChk(paramMap);
			if(siteChk > 0) {
				result.put("chk", "1");
			}else {
				siteManageService.insertSiteInfo(paramMap);
				result.put("chk", "0");
			}
			result.put("result", "success");
		} catch (Exception e) {
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	} 
	
	@RequestMapping (value="/front/siteManage/selectSiteImgFileUpload.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectSiteImgFileUpload(HttpServletRequest request, MultipartHttpServletRequest multi) {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> paramMap = commonController.getParameterMap(request);
		
		try {
			Map<String, Object> imgFileId= siteManageService.selectSiteImgFileUpload(multi);
			result.put("imgFileId", imgFileId);
			result.put("result", "success");
		} catch (Exception e) {
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	} 
	
	@RequestMapping (value="/front/siteManage/imgFiledownload.do")
	public void imgFiledownload(HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> paramMap = commonController.getParameterMap(request);
		
		try {
			Map<String, Object> siteInfo= siteManageService.selectSiteManage(paramMap);
			commonService.imgdownload(response, (String)siteInfo.get("siteGcol"), (String)siteInfo.get("siteName")+" ???????????????");
		} catch (Exception e) {
		}
	}
	
	@RequestMapping (value="/front/siteManage/updateSiteInfo.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateSiteInfo(HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> paramMap = commonController.getParameterMap(request);
		try {
			siteManageService.updateSiteInfo(paramMap);
			result.put("result", "success");
		} catch (Exception e) {
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/front/siteManage/deleteSiteInfo.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteSiteInfo(HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> paramMap = commonController.getParameterMap(request);
		try {
			siteManageService.deleteSiteInfo(paramMap);
			result.put("result", "success");
		} catch (Exception e) {
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/front/siteManage/selectLinkSiteInfo.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectSiteInfo(HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> paramMap = commonController.getParameterMap(request);
		try {
			paramMap.put("siteRpmsno", paramMap.get("oldSiteSn"));
			int siteChk= siteManageService.selectSiteChk(paramMap);
			if(siteChk > 0) {
				result.put("chk", "1");
			}else {
				Map<String, Object> siteInfo= siteManageService.selectLinkSiteInfo(paramMap);
				result.put("siteInfo", siteInfo);
				result.put("chk", "0");
			}
			result.put("result", "success");
		} catch (Exception e) {
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/front/siteManage/selectSiteInfo.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectSiteManage(HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> paramMap = commonController.getParameterMap(request);
		try {
			Map<String, Object> siteInfo= siteManageService.selectSiteManage(paramMap);
			result.put("siteInfo", siteInfo);
			result.put("result", "success");
		} catch (Exception e) {
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/front/siteManage/selectSiteInfoHisList.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectSiteInfoHisList(HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> paramMap = commonController.getParameterMap(request);
		try {
			List<Map<String, Object>> siteInfoHisList= siteManageService.selectSiteInfoHisList(paramMap);
			result.put("siteInfoHisList", siteInfoHisList);
			result.put("result", "success");
		} catch (Exception e) {
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}

	//??????????????????
	
	//?????? ????????? ??????
	@RequestMapping (value="/front/siteManage/selectToolInfoList.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectToolInfoList(HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> paramMap = commonController.getParameterMap(request);
		try {
			List<Map<String, Object>> list= siteManageService.selectToolInfoList(paramMap);
			
			result.put("list", list);
			result.put("result", "success");
		} catch (Exception e) {
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	//?????? ??????
	@RequestMapping (value="/front/siteManage/insertToolInfo.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertToolInfo(HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> paramMap = commonController.getParameterMap(request);
		try {
			siteManageService.insertToolInfo(paramMap);
 			result.put("result", "success");
		} catch (Exception e) {
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
  		return result;
	}
	
	//?????? ??????
	@RequestMapping (value="/front/siteManage/updateToolInfo.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateToolInfo(HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> paramMap = commonController.getParameterMap(request);
		try {
			siteManageService.updateToolInfo(paramMap);
			result.put("result", "success");
		} catch (Exception e) {
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
 		return result;
	}
	
	//?????? ??????
	@RequestMapping (value="/front/siteManage/deleteToolInfo.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteToolInfo(HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> paramMap = commonController.getParameterMap(request);
		try {
			siteManageService.deleteToolInfo(paramMap);
			result.put("result", "success");
		} catch (Exception e) {
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
 		return result;
	}
	
	//?????? ?????? ??????
	@RequestMapping (value="/front/siteManage/selectSensorInfo.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectSensorInfo(HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> paramMap = commonController.getParameterMap(request);
		try {
			Map<String, Object> data = siteManageService.selectToolInfo(paramMap, "sensor");
			result.put("data", data);
			result.put("result", "success");
		} catch (Exception e) {
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	//RTU ?????? ??????
	@RequestMapping (value="/front/siteManage/selectRtuInfo.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectRtuInfo(HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> paramMap = commonController.getParameterMap(request);
		try {
			Map<String, Object> data = siteManageService.selectToolInfo(paramMap, "rtu");
			result.put("data", data);
			result.put("result", "success");
		} catch (Exception e) {
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	//?????? ?????? ??????
	@RequestMapping (value="/front/siteManage/selectModemInfo.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectModemInfo(HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> paramMap = commonController.getParameterMap(request);
		try {
			Map<String, Object> data = siteManageService.selectToolInfo(paramMap, "modem");
			result.put("data", data);
			result.put("result", "success");
		} catch (Exception e) {
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	//?????? ?????? ??????
	@RequestMapping (value="/front/siteManage/selectToolHis.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectToolHis(HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> paramMap = commonController.getParameterMap(request);
		try {
			List<Map<String,Object>> list = siteManageService.selectToolHis(paramMap);
			
			result.put("list", list);
			result.put("result", "success");
		} catch (Exception e) {
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
 		return result;
	}
	
	@RequestMapping (value="/front/siteManage/selectModelInfoList.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectModelInfoList(HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> paramMap = commonController.getParameterMap(request);
		try {
			List<Map<String, Object>> list = siteManageService.selectModelInfoList(paramMap);
			result.put("list", list);
			result.put("result", "success");
		} catch (Exception e) {
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
 		return result;
	}
	
	@RequestMapping (value="/front/siteManage/selectModelInfo.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> selectModelInfo(HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> paramMap = commonController.getParameterMap(request);
		try {
			Map<String, Object> data = siteManageService.selectModelInfo(paramMap);
			result.put("data", data);
			result.put("result", "success");
		} catch (Exception e) {
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
 		return result;
	}
	
	@RequestMapping (value="/front/siteManage/updateModelInfo.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateModelInfo(HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> paramMap = commonController.getParameterMap(request);
		try {
			siteManageService.updateModelInfo(paramMap);
			result.put("result", "success");
		} catch (Exception e) {
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
 		return result;
	}
	
	@RequestMapping (value="/front/siteManage/insertModelInfo.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertModelInfo(HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> paramMap = commonController.getParameterMap(request);
		try {
			siteManageService.insertModelInfo(paramMap);
			result.put("result", "success");
		} catch (Exception e) {
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
 		return result;
	}
}
