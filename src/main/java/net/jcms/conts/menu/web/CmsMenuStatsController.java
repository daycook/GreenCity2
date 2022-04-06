package net.jcms.conts.menu.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.jcms.conts.menu.model.Menu;
import net.jcms.conts.menu.model.MenuConnHistSearch;
import net.jcms.conts.menu.model.MenuSearch;
import net.jcms.conts.menu.service.MenuConnHistService;
import net.jcms.conts.menu.service.MenuService;
import net.jcms.conts.site.model.SiteSearch;
import net.jcms.conts.site.service.SiteService;
import net.jcms.framework.base.web.BaseController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CmsMenuStatsController extends BaseController {

	@Resource (name="cmsMenuConnHistService")
	private MenuConnHistService cmsMenuConnHistService;
	
	@Resource (name="cmsMenuService")
	private MenuService menuService;
	
	@Resource (name="siteService")
	private SiteService siteService;
	
	@RequestMapping (value="/system/stats/list.mng", method=RequestMethod.GET)
	public String list(Model model){
		
		MenuSearch menuSearch = new MenuSearch();
		
		//model.addAttribute("statsList",menuService.selectJson());
		model.addAttribute("siteList", siteService.selectJson());
		model.addAttribute("statsList",menuService.selectList(menuSearch));
		return "system/stats/menuStatsList";
	}

	@RequestMapping (value="/system/menuStats/view.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> detail(HttpServletRequest request, SiteSearch siteSearch) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			result.put("data", siteService.select(siteSearch));
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/system/menuStats/list.json",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> list(HttpServletRequest request,MenuConnHistSearch menuConnHistSearch,Long siteId){
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			result.put("data", menuService.selectJson(siteId));
			result.put("stats", cmsMenuConnHistService.selectList(menuConnHistSearch));
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/system/siteStats/list.mng", method=RequestMethod.GET)
	public String siteList(Model model){
		
		MenuSearch menuSearch = new MenuSearch();
		SiteSearch siteSearch = new SiteSearch();
		
		//model.addAttribute("statsList",menuService.selectJson());
		model.addAttribute("siteList", siteService.selectJson());
		
		model.addAttribute("statsList",menuService.selectList(menuSearch));
		
		return "system/stats/siteStatsList";
	}
	
	@RequestMapping (value="/system/siteStats/list.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> siteList(HttpServletRequest request, MenuConnHistSearch menuConnHistSearch){
		Map<String , Object> result = new HashMap<String, Object>();
		try {
			result.put("data", cmsMenuConnHistService.siteStats(menuConnHistSearch));
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
}
