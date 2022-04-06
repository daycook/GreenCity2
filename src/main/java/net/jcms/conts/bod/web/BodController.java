package net.jcms.conts.bod.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.jcms.conts.bod.model.Bod;
import net.jcms.conts.bod.model.BodRole;
import net.jcms.conts.bod.model.BodSearch;
import net.jcms.conts.bod.service.BodRoleService;
import net.jcms.conts.bod.service.BodService;
import net.jcms.framework.base.web.BaseController;
import net.jcms.framework.security.model.Role;
import net.jcms.framework.security.service.RoleService;

@Controller
public class BodController extends BaseController {
	
	@Resource (name="bodService")
	private BodService bodService;
	
	@Resource(name="roleService")
	private RoleService roleService;
	
	@Resource (name="bodRoleService")
	private BodRoleService bodRoleService;
	
	@RequestMapping (value="/system/bod/list.mng", method=RequestMethod.GET)
	public String list(Model model, BodSearch bodSearch) {
		return "system/bod/list";
	}
	
	@RequestMapping (value="/system/bod/list.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> list(HttpServletRequest request, BodSearch bodSearch, Boolean pagingYn) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			String sort = request.getParameter("columns[" + request.getParameter("order[0][column]") + "][name]");
			String sortOder = request.getParameter("order[0][dir]");
			bodSearch.setSort(sort);
			bodSearch.setSortOrd(sortOder);
			bodSearch.setPagingYn(pagingYn);
			
			int totalCount = bodService.count(bodSearch);
			result.put("recordsTotal", totalCount);
			result.put("recordsFiltered", totalCount);
			
			result.put("data", bodService.selectList(bodSearch));
			
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/system/bod/view.mng", method=RequestMethod.GET)
	public String view(Model model, BodSearch bodSearch, BodRole bodRoleSearch) {
		Bod bod = bodService.select(bodSearch);
		model.addAttribute("bod", bod);
		
		Role role = new Role();
		model.addAttribute("roleList", bodService.selectRoleList(role));
		return "system/bod/view";
	}

	@RequestMapping (value="/system/bod/insert.mng", method=RequestMethod.GET)
	public String insert(Model model, BodSearch bodSearch) {
		Role role = new Role();
		model.addAttribute("roleList", bodService.selectRoleList(role));
		return "system/bod/insert";
	}
	
	@RequestMapping (value="/system/bod/insert.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insert(HttpServletRequest request, Bod bod) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			String[] writeRole = request.getParameterValues("writeRole");
			String[] notiRole = request.getParameterValues("notiRole");
			String[] scrtRole = request.getParameterValues("scrtRole");
			String[] answRole = request.getParameterValues("answRole");
			
			bod.setRegId(getUserId());
			bodService.insert(bod, writeRole, notiRole, scrtRole, answRole);
			
			bodService.initJson();
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/system/bod/update.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> update(HttpServletRequest request, Bod bod) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			String[] writeRole = request.getParameterValues("writeRole");
			String[] notiRole = request.getParameterValues("notiRole");
			String[] scrtRole = request.getParameterValues("scrtRole");
			String[] answRole = request.getParameterValues("answRole");
			
			bod.setUpdId(getUserId());
			bodService.update(bod, writeRole, notiRole, scrtRole, answRole);
			
			bodService.initJson();
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/system/bod/delete.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delete(HttpServletRequest request, Bod bod) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			
			bod.setDelId(getUserId());
			bodService.delete(bod);
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
}
