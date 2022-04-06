package net.jcms.framework.security.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.jcms.framework.base.web.BaseController;
import net.jcms.framework.security.model.UserRole;
import net.jcms.framework.security.service.RoleService;
import net.jcms.framework.security.service.UserRoleService;

@Controller
public class UserRoleController extends BaseController {

	@Resource(name="userRoleService")
	private UserRoleService userRoleService;
	
	@Resource(name="roleService")
	private RoleService roleService;
	
	
	@RequestMapping(value = "/system/userRole/list.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> list(HttpServletRequest request, UserRole userRole) {
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			String sort = request.getParameter("columns[" + request.getParameter("order[0][column]") + "][name]" );
			String sortOder = request.getParameter("order[0][dir]");
			userRole.setSort(sort);
			userRole.setSortOrd(sortOder);
			userRole.setPagingYn(true);
			int totalCount = userRoleService.count(userRole);
			result.put("recordsTotal", totalCount);
			result.put("recordsFiltered", totalCount);
			
			result.put("data", userRoleService.selectRoleList(userRole));
			
			result.put("result", "success");
		} catch (Exception e){
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping(value="/system/userRole/insert.mng", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insert(HttpServletRequest request, UserRole userRole){
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			userRoleService.insert(userRole);
			
			//userRoleService.initJson();
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
		
	@RequestMapping(value="/system/userRole/update.mng", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> update(HttpServletRequest request, UserRole userRole){
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			userRoleService.update(userRole);
			
			//userRoleService.initJson();
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping(value="/system/userRole/delete.mng", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delete(HttpServletRequest request, UserRole userRole){
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			userRoleService.delete(userRole);
			
			//userRoleService.initJson();
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	
	
}
