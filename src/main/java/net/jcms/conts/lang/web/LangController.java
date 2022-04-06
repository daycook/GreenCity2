package net.jcms.conts.lang.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.jcms.conts.lang.service.LangService;
import net.jcms.conts.lang.model.Lang;
import net.jcms.conts.lang.model.LangSearch;
import net.jcms.framework.base.web.BaseController;

@Controller
public class LangController extends BaseController {
	
	@Resource (name="langService")
	private LangService langService;
	
	@RequestMapping (value="/system/lang/list.mng", method=RequestMethod.GET)
	public String list() {
		return "system/lang/list";
	}
	
	@RequestMapping (value="/system/lang/list.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> list(HttpServletRequest request, LangSearch langSearch) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			String sort = request.getParameter("columns[" + request.getParameter("order[0][column]") + "][name]");
			String sortOder = request.getParameter("order[0][dir]");
			langSearch.setSort(sort);
			langSearch.setSortOrd(sortOder);
			langSearch.setPagingYn(true);
			
			int totalCount = langService.count(langSearch);
			result.put("recordsTotal", totalCount);
			result.put("recordsFiltered", totalCount);
			
			result.put("data", langService.selectList(langSearch));
			
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/system/lang/view.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> detail(HttpServletRequest request, LangSearch langSearch) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			result.put("data", langService.select(langSearch));
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/system/lang/insert.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insert(HttpServletRequest request, Lang lang) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			lang.setRegId(getUserId());
			langService.insert(lang);
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/system/lang/update.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> update(HttpServletRequest request, Lang lang) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			lang.setUpdId(getUserId());
			langService.update(lang);
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/system/lang/delete.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delete(HttpServletRequest request, Lang lang) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			lang.setDelId(getUserId());
			langService.delete(lang);
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	@RequestMapping (value="/system/lang/duplecheck.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> checkIdDuplicate(HttpServletRequest request, Lang lang) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			//System.out.println("lang:::" +lang.getDispNm());
			result.put("data", langService.checkIdDuplicate(lang));
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
}
