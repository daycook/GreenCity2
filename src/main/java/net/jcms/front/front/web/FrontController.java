package net.jcms.front.front.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.jcms.framework.base.web.BaseController;
import net.jcms.front.front.model.FrontSearch;
import net.jcms.front.front.service.FrontService;

@Controller
public class FrontController extends BaseController {
	
	@Resource (name="frontService")
	private FrontService frontService;
	
	@RequestMapping (value="/front/front/data.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> data(HttpServletRequest request, FrontSearch frontSearch) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			int data = frontService.testData(frontSearch);
			result.put("data", data);
			result.put("result", "success");
		} catch (Exception e) {
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
}
