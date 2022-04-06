package net.jcms.conts.plan.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.jcms.conts.plan.model.Plan;
import net.jcms.conts.plan.model.PlanSearch;
import net.jcms.conts.plan.service.PlanService;
import net.jcms.conts.site.service.SiteService;
import net.jcms.framework.base.web.BaseController;
import net.jcms.framework.file.model.FileInfo;
import net.jcms.framework.file.service.FileService;
import net.jcms.framework.util.StrUtil;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class PlanController extends BaseController{

	@Value("#{prop['AppConf.filePath.popup']}") 
	private String filePath;
	
	@Resource (name="planService")
	private PlanService planService;
	
	@Resource (name="fileService")
	private FileService fileService;
	
	@Resource (name="siteService")
	private SiteService siteService;
	
	@RequestMapping (value="/system/plan/list.mng", method=RequestMethod.GET)
	public String list(Model model){
		
		model.addAttribute("siteList", siteService.selectJson());
		
		return "system/plan/list";
	}
	
	@RequestMapping (value="/system/plan/list.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String , Object> list(HttpServletRequest request,PlanSearch planSearch){
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			String sort = request.getParameter("columns[" + request.getParameter("order[0][column]") + "][name]");
			String sortOder = request.getParameter("order[0][dir]");
			planSearch.setSort(sort);
			planSearch.setSortOrd(sortOder);
			planSearch.setPagingYn(true);
			
			int totalCount = planService.count(planSearch);
			result.put("recordsTotal", totalCount);
			result.put("recordsFiltered", totalCount);
			
			result.put("data", planService.selectList(planSearch));
			result.put("result", "success");
		}catch (Exception e){
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result; 
	}
	
	@RequestMapping(value="/system/plan/view.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> view(HttpServletRequest request,PlanSearch planSearch) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			
			result.put("data", planService.select(planSearch));
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/system/plan/insert.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insert(HttpServletRequest request,Plan plan ) {
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			
			plan.setRegId(getUserId());
			planService.insert(plan);
			result.put("result", "success");
		}catch (Exception e){
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		
		return result;
	}
	
	@RequestMapping (value="/system/plan/update.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> update(HttpServletRequest request,Plan plan){
		Map<String,Object> result = new HashMap<String,Object>();
		try{
			
			plan.setUpdId(getUserId());
			planService.update(plan);
			result.put("result", "success");
		}catch (Exception e){
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message",e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/system/plan/delete.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> delete(HttpServletRequest request,Plan plan) {
		Map<String , Object> result = new HashMap<String, Object>();
		try{
			
			plan.setDelId(getUserId());
			planService.delete(plan);
			result.put("result", "success");
		}catch (Exception e){
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
}
