package net.jcms.framework.menu.web;
 
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.jcms.framework.base.web.BaseController;
import net.jcms.framework.menu.model.MenuRole;
import net.jcms.framework.menu.model.MenuRoleSearch;
import net.jcms.framework.menu.service.MenuRoleService;
import net.jcms.framework.menu.service.MenuService;

@Controller
public class MenuRoleController extends BaseController{
 
	@Resource(name="menuService")
	private MenuService menuService;
	 
	@Resource(name="menuRoleService")
	private MenuRoleService menuRoleService;
	
	@RequestMapping(value = "/system/menuRole/list.json")
	@ResponseBody
	public Map<String, Object> menuList(HttpServletRequest request, String roleAuth) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			MenuRoleSearch menuRoleSearch = new MenuRoleSearch();
			menuRoleSearch.setRoleAuth(roleAuth);
			
			result.put ("data", menuRoleService.selectList(menuRoleSearch));
			result.put ("result", "success");
		}catch (Exception e) {
			e.printStackTrace();
			result.put ("result", "fail");
			result.put ("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping(value = "/system/menuRole/update.json")
	@ResponseBody
	public Map<String, Object> update(HttpServletRequest request) throws Exception{
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			String roleAuth = request.getParameter("roleAuth");
			MenuRole menuRole = new MenuRole();
			menuRole.setRoleAuth(roleAuth);
			menuRoleService.delete(menuRole);

			String[] checkIdList = request.getParameterValues("checkIdList[]");
			if(checkIdList != null){
				for(String checkId : checkIdList) {
					//최상위 메뉴만 있고 자식메뉴는 없을 때 처리 방안
					if(!"#".equals(checkId)){
						menuRole.setMenuId(Long.parseLong(checkId));
						menuRoleService.insert(menuRole);
					}
				}
			}

			
			//menuRoleService.initJson();
			menuService.initRoleMenuList();
			result.put ("result", "success");
		}catch (Exception e) {
			e.printStackTrace();
			result.put ("result", "fail");
			result.put ("message", e.getMessage());
		}
		return result;
	}
	
}
