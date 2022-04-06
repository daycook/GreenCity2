package net.jcms.conts.banner.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.jcms.conts.banner.model.Banner;
import net.jcms.conts.banner.model.BannerSearch;
import net.jcms.conts.banner.service.BannerService;
import net.jcms.conts.site.model.SiteSearch;
import net.jcms.conts.site.service.SiteService;
import net.jcms.framework.base.web.BaseController;
import net.jcms.framework.file.service.FileService;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BannerController extends BaseController {
	
	@Value("#{prop['AppConf.filePath.popup']}") 
	private String filePath;
	 
	@Resource (name="fileService")
	private FileService fileService;
	
	@Resource (name="bannerService")
	private BannerService bannerService;
	
	@Resource (name="siteService")
	private SiteService siteService;
	
	@RequestMapping (value="/system/banner/list.mng", method=RequestMethod.GET)
	public String list(Model model) {
		model.addAttribute("siteList", siteService.selectJson());
		
		return "system/banner/list";
	}
	
	@RequestMapping (value="/system/banner/list.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> list(HttpServletRequest request, BannerSearch bannerSearch) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			String sort = request.getParameter("columns[" + request.getParameter("order[0][column]") + "][name]");
			String sortOder = request.getParameter("order[0][dir]");
			bannerSearch.setSort(sort);
			bannerSearch.setSortOrd(sortOder);
			bannerSearch.setPagingYn(true);
			
			int totalCount = bannerService.count(bannerSearch);
			result.put("recordsTotal", totalCount);
			result.put("recordsFiltered", totalCount);
			result.put("data", bannerService.selectList(bannerSearch));
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/system/banner/view.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> detail(HttpServletRequest request, BannerSearch bannerSearch) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			result.put("data", bannerService.select(bannerSearch));
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/system/banner/insert.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insert(HttpServletRequest request, Banner banner, Long itemId) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			banner.setRegId(getUserId());
			bannerService.insert(banner, itemId);
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/system/banner/update.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> update(HttpServletRequest request, Banner banner, Long itemId) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			banner.setUpdId(getUserId());
			bannerService.update(banner, itemId);
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/system/banner/delete.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delete (HttpServletRequest request, BannerSearch bannerSearch) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			bannerSearch.setDelId(getUserId());
			bannerService.delete(bannerSearch);
			result.put("result", "success");
		} catch (Exception e) {
			result.put("result", "fail");
			result.put("massge", e.getMessage());
		}
		
		return result;
	}
	
	@RequestMapping (value="/public/banner/list.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> bannerList(HttpServletRequest request, BannerSearch bannerSearch){
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			result.put("data", bannerService.selectList(bannerSearch));
			result.put("result", "success");
		} catch (Exception e) {
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
}
