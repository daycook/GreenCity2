package net.jcms.framework.weblog.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.jcms.framework.base.web.BaseController;
import net.jcms.framework.util.StrUtil;
import net.jcms.framework.weblog.model.WebLogSearch;
import net.jcms.framework.weblog.service.WebLogService;


@Controller
public class WebLogController extends BaseController {
	
		@Resource (name="webLogService")
		private WebLogService webLogService;
		
		@RequestMapping (value="/system/webLog/list.mng")
		public String list() {
			return "system/webLog/list";
		}
		
		@RequestMapping (value="/system/webLog/list.json")
		@ResponseBody
		public Map<String, Object> list(HttpServletRequest request, WebLogSearch webLogSearch) {
			Map<String, Object> result = new HashMap<String, Object>();
			try {	
				String sort = request.getParameter("columns[" + request.getParameter("order[0][column]") + "][name]");
				String sortOder = request.getParameter("order[0][dir]");
				webLogSearch.setSort(sort);
				webLogSearch.setSortOrd(sortOder);
				webLogSearch.setPagingYn(true);
				
				int totalCount = webLogService.count(webLogSearch);
				result.put("recordsTotal", totalCount);
				result.put("recordsFiltered", totalCount);
				result.put("data", webLogService.selectList(webLogSearch));
				
				result.put("result", "success");
			} catch (Exception e) {
				e.printStackTrace();
				result.put("result", "fail");
				result.put("message", e.getMessage());
			}
			return result;
		}
		
		@RequestMapping (value="/system/webLog/selectOne.json")
		@ResponseBody
		public Map<String, Object> selectOne(HttpServletRequest request, WebLogSearch webLogSearch) {
			Map<String, Object> result = new HashMap<String, Object>();
			try {	
				result.put("data", webLogService.select(webLogSearch));
				result.put("result", "success");
			} catch (Exception e) {
				e.printStackTrace();
				result.put("result", "fail");
				result.put("message", e.getMessage());
			}
			return result;
		}
		
}
