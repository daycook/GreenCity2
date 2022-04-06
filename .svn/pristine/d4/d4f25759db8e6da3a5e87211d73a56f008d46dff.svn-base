package net.jcms.conts.site.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;



import net.jcms.conts.lang.model.LangSearch;
import net.jcms.conts.lang.service.LangService;
import net.jcms.conts.site.model.Site;
import net.jcms.conts.site.model.SiteSearch;
import net.jcms.conts.site.service.SiteService;
import net.jcms.framework.base.web.BaseController;
import net.jcms.framework.util.HttpUtil;
import net.jcms.framework.util.StrUtil;

@Controller
public class SiteController extends BaseController {
	
	@Resource (name="langService")
	private LangService langService;
	
	@Resource (name="siteService")
	private SiteService siteService;
	
	@RequestMapping (value="/system/site/list.mng", method=RequestMethod.GET)
	public String list(Model model) {
		LangSearch langSearch = new LangSearch();
		model.addAttribute("langList", langService.selectList(langSearch));
		return "system/site/list";
	}
	
	@RequestMapping (value="/system/site/list.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> list(HttpServletRequest request, SiteSearch siteSearch, Boolean pagingYn) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			String sort = request.getParameter("columns[" + request.getParameter("order[0][column]") + "][name]");
			String sortOder = request.getParameter("order[0][dir]");
			
			if (sort == null) sort = "";
			if (sortOder == null) sortOder = "";
			if (siteSearch == null) siteSearch = new SiteSearch();
			if (pagingYn == null) pagingYn = Boolean.FALSE;
			
			siteSearch.setSort(sort);
			siteSearch.setSortOrd(sortOder);
			siteSearch.setPagingYn(pagingYn);

			int totalCount = siteService.count(siteSearch);
			result.put("recordsTotal", totalCount);
			result.put("recordsFiltered", totalCount);
			result.put("domain", HttpUtil.getDomain(request));
			result.put("data", siteService.selectList(siteSearch));
			result.put("result", "success");
		} catch (Exception e) {
			//e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/system/site/view.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> detail(HttpServletRequest request, SiteSearch siteSearch) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			if (siteSearch != null) {
				result.put("data", siteService.select(siteSearch));
				result.put("result", "success");
			}
			else {
				result.put("result", "fail");
				result.put("message", "siteSearch is null");
			}
		} catch (Exception e) {
			//e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/system/site/insert.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insert(HttpServletRequest request, Site site) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			//도메인, 시작URL 중복 방지
			int cnt = 0;
			SiteSearch siteSearch = new SiteSearch();
			
			if (site != null) {
				siteSearch.setDomain(site.getDomain());
				List<Site> siteList = siteService.selectList(siteSearch);
				for(Site st : siteList) {
					if((StrUtil.isEmpty(site.getStartUrl()) && StrUtil.isEmpty(st.getStartUrl()))
							|| (!StrUtil.isEmpty(site.getStartUrl()) && site.getStartUrl().equals(st.getStartUrl()))) { //시작 URL이 수정되었으면 기존에 존재하는 URL인지 검사한다.
						cnt ++;
						break;
					}
				}
				if(cnt > 0) {
					result.put("result", "fail");
					result.put("message", "시작 URL이 이미 존재합니다.");
					return result;
				}
				
				site.setRegId(getUserId());
				siteService.insert(site);
				
				siteService.initJson();
				result.put("result", "success");
			} else {
				result.put("result", "fail");
				result.put("message", "site is null");
			}
		} catch (Exception e) {
			//e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/system/site/update.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> update(HttpServletRequest request, Site site) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			//도메인, 시작URL 중복 방지
			int cnt = 0;
			SiteSearch siteSearch = new SiteSearch();
			
			if (site != null) {
				siteSearch.setDomain(site.getDomain());
				List<Site> currentSiteList = siteService.selectList(siteSearch);
				for(Site currentSite : currentSiteList) {
					if(!currentSite.getSiteId().equals(site.getSiteId())) {
						if((StrUtil.isEmpty(site.getStartUrl()) && StrUtil.isEmpty(currentSite.getStartUrl()))
								|| (!StrUtil.isEmpty(site.getStartUrl()) && site.getStartUrl().equals(currentSite.getStartUrl()))) { //시작 URL이 수정되었으면 기존에 존재하는 URL인지 검사한다.
							cnt ++;
							break;
						}
					}
				}
				if(cnt > 0) {
					result.put("result", "fail");
					result.put("message", "시작 URL이 이미 존재합니다.");
					return result;
				}
				
				site.setUpdId(getUserId());
				siteService.update(site);
				
				siteService.initJson();
				result.put("result", "success");
			} else {
				result.put("result", "fail");
				result.put("message", "site is null");
			}
			
		} catch (Exception e) {
			//e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}

	@RequestMapping (value="/system/site/delete.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delete(HttpServletRequest request, Site site) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			//도메인, 시작URL 중복 방지
			siteService.delete(site);
			
			siteService.initJson();
			result.put("result", "success");
		} catch (Exception e) {
			//e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
}
