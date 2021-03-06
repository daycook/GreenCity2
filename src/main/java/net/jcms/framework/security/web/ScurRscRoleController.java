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
import net.jcms.framework.security.model.ScurRscRole;
import net.jcms.framework.security.service.ScurRscRoleService;

@Controller
public class ScurRscRoleController extends BaseController {

	@Resource (name="scurRscRoleService")
	private ScurRscRoleService scurRscRoleService;
	
	@RequestMapping(value="/system/scurRscRole/list.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> list(HttpServletRequest request, ScurRscRole scurRscRole){
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			String sort = request.getParameter("columns[" + request.getParameter("order[0][column]") + "][name]" );
			String sortOder = request.getParameter("order[0][dir]");
			scurRscRole.setSort(sort);
			scurRscRole.setSortOrd(sortOder);
			scurRscRole.setPagingYn(true);
			
			int totalCount = scurRscRoleService.count(scurRscRole);
			result.put("recordsTotal", totalCount);
			result.put("recordsFiltered", totalCount);
			
			result.put("data", scurRscRoleService.selectList(scurRscRole));
			
			result.put("result", "success");
		} catch (Exception e){
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/system/scurRscRole/insert.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insert(HttpServletRequest request, ScurRscRole scurRscRole) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			scurRscRole.setRegId(getUserId());
			scurRscRoleService.insert(scurRscRole);
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/system/scurRscRole/delete.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delete(HttpServletRequest request, ScurRscRole scurRscRole) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			scurRscRoleService.delete(scurRscRole);
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
}