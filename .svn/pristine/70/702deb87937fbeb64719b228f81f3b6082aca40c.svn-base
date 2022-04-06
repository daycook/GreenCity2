package net.jcms.conts.menu.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.jcms.conts.menu.model.Menu;
import net.jcms.conts.menu.model.MenuSatis;
import net.jcms.conts.menu.model.MenuSatisSearch;
import net.jcms.conts.menu.model.MenuSearch;
import net.jcms.conts.menu.service.MenuSatisService;
import net.jcms.conts.menu.service.MenuService;
import net.jcms.conts.site.model.SiteSearch;
import net.jcms.conts.site.service.SiteService;
import net.jcms.framework.base.web.BaseController;
import net.jcms.framework.util.HttpUtil;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CmsMenuSatisController extends BaseController {

	@Resource (name="cmsMenuService")
	private MenuService menuService;
	
	@Resource (name="siteService")
	private SiteService siteService;
	
	@Resource (name="menuSatisService")
	private MenuSatisService menuSatisService;
	
	/**
	 * 메뉴별 만족도 화면 이동
	 * @param model
	 * @param menuConnHistSearch
	 * @return
	 */
	@RequestMapping (value="/system/satis/list.mng")
	public String list(Model model){
		
		MenuSearch menuSearch = new MenuSearch();
		
		model.addAttribute("statsList",menuService.selectList(menuSearch));
		model.addAttribute("siteList", siteService.selectJson());
		//model.addAttribute("statList", menuService.selectJson());
		return "system/satis/menuSatisList";
	} 
	
	/**
	 * 로그인 여부 확인
	 * @return
	 */
	@RequestMapping (value="/public/menuSatis/idCheck.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> idCheck(MenuSatisSearch menuSatisSearch){
		Map<String, Object> result = new HashMap<String, Object>();
		
		Long userId = getUserId();
		try {
			if(userId != null && userId > 0){
				//satisfactionSearch.setSiteId(getSiteId());
				menuSatisSearch.setRegId(getUserId());
				if(menuSatisService.count(menuSatisSearch)>0){
					result.put("exist", "exist");
				}else{
					result.put("exist", "nonExist");
				}
				result.put("result", "success");
			}else{
				result.put("result","fail");
			}
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
		}
		return result;
	}
	
	/**
	 * 만족도 update
	 * @param request
	 * @param menuSatis
	 * @return
	 */
	@RequestMapping (value="/public/menuSatis/update.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateSatis(HttpServletRequest request, MenuSatis menuSatis){
		Map<String, Object> result = new HashMap<String, Object>();
		
		try {
			menuSatis.setRegId(getUserId());
			menuSatis.setRegNm(getUserName());
			menuSatis.setRegIp(HttpUtil.getClientIp(request));
			menuSatisService.update(menuSatis);
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result; 
	}
	
	/**
	 * 만족도 insert
	 * @param request
	 * @param menuSatis
	 * @return
	 */
	@RequestMapping (value="/public/menuSatis/insert.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertSatis(HttpServletRequest request, MenuSatis menuSatis){
		Map<String, Object> result = new HashMap<String, Object>();
		
		try {
			menuSatis.setRegId(getUserId());
			menuSatis.setRegNm(getUserName());
			menuSatis.setRegIp(HttpUtil.getClientIp(request));
			menuSatisService.insert(menuSatis);
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result; 
	}
	
	/**
	 * 사이트별 조회
	 * @param request
	 * @param siteSearch
	 * @return
	 */
	@RequestMapping (value="/system/satis/view.json", method=RequestMethod.POST)
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
	
	/**
	 * 만족도 집계 조회
	 * @param menuSatisSearch
	 * @return
	 */
	@RequestMapping (value="/system/satis/list.json")
	@ResponseBody
	public Map<String, Object> list(MenuSatisSearch menuSatisSearch, Long siteId){
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			result.put("data", menuService.selectJson(siteId));
			result.put("satis", menuSatisService.selectSatisfaction(menuSatisSearch));
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	/**
	 * 만족도 의견 조회
	 * @param menuSatisSearch
	 * @return
	 */
	@RequestMapping(value="/system/satis/opinion.json")
	@ResponseBody
	public Map<String ,Object> opnionList(MenuSatisSearch menuSatisSearch){
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			//satisfactionSearch.setSiteId(getSiteId());
			result.put("data", menuSatisService.selectList(menuSatisSearch));
			result.put("result", "success");
		}catch (Exception e){
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	
}
