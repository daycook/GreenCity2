package net.jcms.framework.menu.web;
 
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
import org.springframework.web.bind.annotation.ResponseBody;

import net.jcms.framework.base.web.BaseController;
import net.jcms.framework.menu.model.Menu;
import net.jcms.framework.menu.model.MenuSearch;
import net.jcms.framework.menu.service.MenuService;
import net.jcms.framework.pgm.model.PgmSearch;
import net.jcms.framework.pgm.service.PgmService;

@Controller
public class MenuController extends BaseController {
	 
	@Resource (name="pgmService")
	private PgmService pgmService;
	
	@Resource (name="menuService")
	private MenuService menuService;
	
	@RequestMapping (value="/system/menu/list.mng", method=RequestMethod.GET)
	public String list(Model model) {
		//model.addAttribute("pgmList", pgmService.selectJson());
		PgmSearch pgmSearch = new PgmSearch();
		model.addAttribute("pgmList", pgmService.selectList(pgmSearch));
		return "system/menu/list";
	}

	@RequestMapping (value="/system/menu/list.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> list(HttpServletRequest request, MenuSearch menuSearch) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			//result.put("data", menuService.selectJson());
			result.put("data", menuService.selectList(menuSearch));
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping(value = "/system/menu/jstreeList.json")
	@ResponseBody
	public Map<String, Object> jstreeList(HttpServletRequest request, String roleAuth) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			List<Map<String, Object>> data = new ArrayList<Map<String, Object>>();
			//List<Menu> menuList = menuService.selectJson();
			MenuSearch menuSearch = new MenuSearch();
			List<Menu> menuList = menuService.selectList(menuSearch);
			
			for(Menu menu : menuList) {
				data = setChildList("#", menu, data);
			}
			
			result.put ("data", data);
			result.put ("result", "success");
		}catch (Exception e) {
			e.printStackTrace();
			result.put ("result", "fail");
			result.put ("message", e.getMessage());
		}
		return result;
	}
	public List<Map<String, Object>> setChildList(String parentId, Menu menu, List<Map<String, Object>> data) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("parent", parentId);
		if(menu.getChildList() != null) {
			for(Menu childMenu : menu.getChildList()) {
				data = setChildList(String.valueOf(menu.getMenuId()), childMenu, data);
			}
		}
		map.put("id", menu.getMenuId());
		map.put("text", menu.getMenuNm());
		Map<String, Object> status = new HashMap<String, Object>();
		status.put("opened", true);
		map.put("state", status);
		
		data.add(map);
		return data;
	}
	
	@RequestMapping (value="/system/menu/view.json", method=RequestMethod.POST)
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
	
	@RequestMapping (value="/system/menu/insert.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insert(HttpServletRequest request, Menu menu) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			//??????????????? ????????? ????????? ??????
			MenuSearch menuSearch = new MenuSearch();
			menuSearch.setUpperMenuId(menu.getUpperMenuId());
			menu.setMenuOrd(menuService.selectMaxMenuOrder(menuSearch));
			
			menu.setRegId(getUserId());
			menuService.insert(menu);
			
			//menuService.initJson();
			menuService.initRoleMenuList();
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/system/menu/update.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> update(HttpServletRequest request, Menu menu) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			menu.setUpdId(getUserId());
			menuService.update(menu);
			
			//menuService.initJson();
			menuService.initRoleMenuList();
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/system/menu/delete.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delete(HttpServletRequest request, Menu menu) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			MenuSearch menuSearch = new MenuSearch();
			menuSearch.setUpperMenuId(menu.getMenuId());
			int count = menuService.count(menuSearch);
			if(count > 0) {
				result.put("message", "?????? ????????? ???????????? ?????? ???????????? ?????? ???????????????.");
				result.put("result", "alreay");
			}else {
				menu.setDelId(getUserId());
				menuService.delete(menu);
				
				//menuService.initJson();
				menuService.initRoleMenuList();
				result.put("result", "success");
			}
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/system/menu/changeOrder.mng", method=RequestMethod.GET)
	public String changeOrder(Model model) {
		return "system/menu/changeOrder";
	}
	
	@RequestMapping (value={"/system/menu/changeOrder.json"})
	@ResponseBody
	public Map<String, Object> changeOrder(HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			Map<String, String[]> orderMap = request.getParameterMap();
			
			Menu menu;
			String parent = null;
			Map<Integer, String> depthMap = new HashMap<Integer, String>();
			for(String key : orderMap.keySet()) {
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
			
			//menuService.initJson();
			menuService.initRoleMenuList();
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
}
