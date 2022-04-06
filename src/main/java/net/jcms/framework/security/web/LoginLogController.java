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
import net.jcms.framework.security.model.LoginLogSearch;
import net.jcms.framework.security.service.LoginLogService;


@Controller
public class LoginLogController extends BaseController {
	
		@Resource (name="loginLogService")
		private LoginLogService loginLogService;

		@RequestMapping (value="/system/scur/loginLogList.mng", method=RequestMethod.GET)
		public String list() {
			return "system/scur/loginLogList";
		}
		
		@RequestMapping (value="/system/scur/loginLogList.json", method=RequestMethod.POST)
		@ResponseBody
		public Map<String, Object> list(HttpServletRequest request, LoginLogSearch loginLogSearch) {
			Map<String, Object> result = new HashMap<String, Object>();
			try {	
				String sort = request.getParameter("columns[" + request.getParameter("order[0][column]") + "][name]");
				String sortOder = request.getParameter("order[0][dir]");
				loginLogSearch.setSort(sort);
				loginLogSearch.setSortOrd(sortOder);
				loginLogSearch.setPagingYn(true);
				
				int totalCount = loginLogService.count(loginLogSearch);
				result.put("recordsTotal", totalCount);
				result.put("recordsFiltered", totalCount);
				result.put("data", loginLogService.selectList(loginLogSearch));
				
				result.put("result", "success");
			} catch (Exception e) {
				e.printStackTrace();
				result.put("result", "fail");
				result.put("message", e.getMessage());
			}
			return result;
		}
}
