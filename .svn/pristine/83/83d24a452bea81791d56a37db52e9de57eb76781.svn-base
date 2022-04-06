package net.jcms.conts.menu.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.jcms.conts.bod.model.BodSearch;
import net.jcms.conts.bod.service.BodService;
import net.jcms.conts.cont.model.ContSearch;
import net.jcms.conts.cont.service.ContService;
import net.jcms.conts.menu.model.Menu;
import net.jcms.conts.menu.model.MenuContSearch;
import net.jcms.conts.menu.model.MenuPopup;
import net.jcms.conts.menu.model.MenuPopupSearch;
import net.jcms.conts.menu.model.MenuSearch;
import net.jcms.conts.menu.service.MenuContService;
import net.jcms.conts.menu.service.MenuPopupService;
import net.jcms.conts.menu.service.MenuService;
import net.jcms.conts.popup.model.Popup;
import net.jcms.conts.popup.model.PopupSearch;
import net.jcms.conts.popup.service.PopupService;
import net.jcms.conts.site.model.SiteSearch;
import net.jcms.conts.site.service.SiteService;
import net.jcms.framework.base.web.BaseController;

@Controller
public class CmsMenuController extends BaseController {
	
	@Resource (name="contService")
	private ContService contService;
	
	@Resource (name="cmsMenuService")
	private MenuService menuService;
	
	@Resource (name="cmsMenuContService")
	private MenuContService menuContService;
	
	@Resource (name="siteService")
	private SiteService siteService;
	
	@Resource (name="cmsMenuPopupService")
	private MenuPopupService menuPopupService;
	
	@Resource (name="popupService")
	private PopupService popupService;
	
	@Resource (name="bodService")
	private BodService bodService;
	
	@RequestMapping (value="/system/cmsMenu/list.mng", method=RequestMethod.GET)
	public String list(Model model, String siteId) {
		model.addAttribute("siteId", siteId);
		model.addAttribute("bodList", bodService.selectJson());
		model.addAttribute("contList", contService.selectList(new ContSearch()));
		model.addAttribute("popupList", popupService.selectList(new PopupSearch()));
		model.addAttribute("siteList", siteService.selectJson());
		return "system/cmsMenu/list";
	}
	
	@RequestMapping (value="/system/cmsMenu/list.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> list(HttpServletRequest request, Long siteId) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {

			result.put("data", menuService.selectJson(siteId));
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/system/cmsMenu/view.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> detail(HttpServletRequest request, MenuSearch menuSearch) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			result.put("data", menuService.select(menuSearch));
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/system/cmsMenu/insert.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insert(HttpServletRequest request, Menu menu) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			MenuSearch menuSearch = new MenuSearch();
			menuSearch.setSiteId(menu.getSiteId());
			menuSearch.setMenuUrl(menu.getMenuUrl());
			int count = menuService.count(menuSearch);
			if(count > 0) { //해당 사이트에 같은 URL이 존재할 경우
				result.put("result", "fail");
				result.put("message", "해당 사이트에 이미 등록되어있는 URL입니다.");
			}else {
				//메뉴순서를 마지막 순서로 지정
				menuSearch = new MenuSearch();
				menuSearch.setUpperMenuId(menu.getUpperMenuId());
				menu.setMenuOrd(menuService.selectMaxMenuOrder(menuSearch));
				
				menu.setRegId(getUserId());
 				menuService.insert(menu);
				
				menuService.initJson(menu.getSiteId());
				result.put("result", "success");
			}
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/system/cmsMenu/update.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> update(HttpServletRequest request, Menu menu) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			menu.setUpdId(getUserId());
			menuService.update(menu);
			
			menuService.initJson(menu.getSiteId());
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/system/cmsMenu/updateUseSt.json")
	@ResponseBody
	public Map<String, Object> updateUseSt(HttpServletRequest request, @RequestParam(required = true) Long menuId) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			MenuSearch menuSearch = new MenuSearch();
			menuSearch.setMenuId(menuId);
			Menu menu = menuService.select(menuSearch);
			if("Y".equals(menu.getUseSt())) {
				menu.setUseSt("N");
			}else{
				menu.setUseSt("Y");
			}
			menuService.updateUseSt(menu);
			
			menuService.initJson(menu.getSiteId());
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/system/cmsMenu/delete.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delete(HttpServletRequest request, Menu menu, Long siteId) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			MenuSearch menuSearch = new MenuSearch();
			menuSearch.setUpperMenuId(menu.getMenuId());
			int count = menuService.count(menuSearch);
			if(count > 0) {
				result.put("message", "하위 메뉴가 존재하지 않을 경우에만 삭제 가능합니다.");
				result.put("result", "alreay");
			}else {
				menu.setDelId(getUserId());
				menuService.delete(menu);
				
				if(siteId != null) {
					menuService.initJson(siteId);
				}
				result.put("result", "success");
			}
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}

	@RequestMapping (value="/system/cmsMenu/changeOrder.mng", method=RequestMethod.GET)
	public String changeOrder(Model model, String siteId) {
		model.addAttribute("siteId", siteId);
		return "system/cmsMenu/changeOrder";
	}
	
	@RequestMapping (value={"/system/cmsMenu/changeOrder.json"})
	@ResponseBody
	public Map<String, Object> changeOrder(HttpServletRequest request, Long siteId) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			Map<String, String[]> orderMap = request.getParameterMap();
			
			Menu menu;
			String parent = null;
			Map<Integer, String> depthMap = new HashMap<Integer, String>();
			for(String key : orderMap.keySet()) {
				if(!"siteId".equals(key)) {
					String value = orderMap.get(key)[0];
					parent = value;
					
					int cnt = 0;
					for(int i=0; i<key.length(); i++) {
						if(key.charAt(i) == '[') cnt++;
					}
					
					String order = null;
					int startIndex = 0, endIndex = 0;
					switch (cnt) {
					case 2:
						order = key.substring(key.indexOf("[")+1, key.indexOf("]"));
						parent = null;
						
						depthMap = new HashMap<Integer, String>();
						depthMap.put(cnt/2, value);
						break;
					default :
						for(int i=0; i<cnt-1; i++) startIndex = key.indexOf("[", startIndex+1);
						endIndex = key.indexOf("]", startIndex);
						order = key.substring(startIndex+1, endIndex);
						startIndex = 0; 
						endIndex = 0;

						parent = depthMap.get(cnt/2-1);
						depthMap.put(cnt/2, value);
						break;
					}
					
					menu = new Menu();
					menu.setMenuId(Long.parseLong(value));
					if(parent != null) {
						menu.setUpperMenuId(Long.parseLong(parent));
					}
					menu.setMenuOrd(Integer.parseInt(order));
					menuService.updateOrder(menu);
				}
	        }
			
			if(siteId != null) {
				menuService.initJson(siteId);
			}
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value={"/public/cmsMenu/popupList.json", "/system/cmsMenu/popupList.json"}, method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> popupList(MenuPopupSearch menuPopupSearch) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			List<MenuPopup> menuPopupList = menuPopupService.selectList(menuPopupSearch);
			
			List<Popup> popupList = new ArrayList<Popup>();
			PopupSearch popupSearch = new PopupSearch();
			if(menuPopupList.size() > 0) {
				List<Long> popupIdList = new ArrayList<Long>();
				for(MenuPopup menuPopup : menuPopupList) {
					popupIdList.add(menuPopup.getPopupId());
				}
				popupSearch.setPopupIdIn(popupIdList);
				popupList = popupService.selectList(popupSearch);
			}
			result.put("data", popupList);
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/system/cmsMenu/popupUpdate.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> popupInsert(HttpServletRequest request, Long siteId) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			long menuId = Long.parseLong(request.getParameter("menuId"));
			String[] popupIdList = request.getParameterValues("popupId");
			long[] popupIdArray;
			if(popupIdList == null) {
				popupIdArray = new long[0];
			}else {
				popupIdArray = new long[popupIdList.length];
				for(int i=0; i<popupIdList.length; i++) {
					popupIdArray[i] = Long.parseLong(popupIdList[i]);
				}
			}
			menuPopupService.insert(menuId, popupIdArray);
			
			if(siteId != null) {
				menuService.initJson(siteId);
			}
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}

	@RequestMapping (value={"/system/cmsMenu/contList.json"}, method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> contList(MenuContSearch menuContSearch) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			result.put("data", menuContService.selectList(menuContSearch));
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value={"/system/cmsMenu/contUpdate.json"}, method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> contUpdate(Long menuId, Long[] contIdList) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			menuContService.insert(menuId, contIdList);
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
}
