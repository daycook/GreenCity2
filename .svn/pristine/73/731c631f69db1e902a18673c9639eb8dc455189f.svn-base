package net.jcms.conts.cont.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.jcms.conts.cont.model.ContItemHistSearch;
import net.jcms.conts.cont.service.ContBkmakService;
import net.jcms.conts.cont.service.ContItemHistService;
import net.jcms.conts.cont.service.ContItemService;
import net.jcms.conts.cont.service.ContService;
import net.jcms.conts.lang.service.LangService;
import net.jcms.framework.base.web.BaseController;

@Controller
public class ContItemController extends BaseController {
	
	@Resource (name="contService")
	private ContService contService;
	
	@Resource (name="contItemService")
	private ContItemService contItemService;
	
	@Resource (name="contItemHistService")
	private ContItemHistService contItemHistService;
	
	@Resource (name="contBkmakService")
	private ContBkmakService contBkmakService;
	
	@RequestMapping (value="/system/contItemHist/list.json")
	@ResponseBody
	public Map<String, Object> list(HttpServletRequest request, ContItemHistSearch contItemHistSearch) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			
			String sort = request.getParameter("columns[" + request.getParameter("order[0][column]") + "][name]");
			String sortOder = request.getParameter("order[0][dir]");
			contItemHistSearch.setSort(sort);
			contItemHistSearch.setSortOrd(sortOder);
			contItemHistSearch.setPagingYn(true);
			
			int totalCount = contItemHistService.count(contItemHistSearch);
			result.put("recordsTotal", totalCount);
			result.put("recordsFiltered", totalCount);
			result.put("data", contItemHistService.selectList(contItemHistSearch));
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
}
