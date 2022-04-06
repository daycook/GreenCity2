package net.jcms.conts.bod.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.jcms.conts.bod.model.BodCmnt;
import net.jcms.conts.bod.model.BodCmntSearch;
import net.jcms.conts.bod.service.BodCmntService;
import net.jcms.framework.base.web.BaseController;

@Controller
public class BodCmntController extends BaseController {
	
	@Resource (name="bodCmntService")
	private BodCmntService bodCmntService;
	
	@RequestMapping (value="/public/bodCmnt/insert.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insert(HttpServletRequest request, BodCmnt bodCmnt) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			bodCmnt.setRegId(getUserId());
			bodCmnt.setUpdId(getUserId());
			bodCmntService.insert(bodCmnt);
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}

	@RequestMapping (value="/public/bodCmnt/list.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> list(HttpServletRequest request, BodCmntSearch bodCmntSearch) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			result.put("data", bodCmntService.selectList(bodCmntSearch));
			
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/public/bodCmnt/delete.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delete(HttpServletRequest request, BodCmnt bodCmnt) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			bodCmnt.setRegId(getUserId());
			bodCmnt.setUpdId(getUserId());
			bodCmntService.delete(bodCmnt);
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/public/bodCmnt/update.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> update(HttpServletRequest request, BodCmnt bodCmnt) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			bodCmnt.setRegId(getUserId());
			bodCmnt.setUpdId(getUserId());
			bodCmntService.update(bodCmnt);
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
}
