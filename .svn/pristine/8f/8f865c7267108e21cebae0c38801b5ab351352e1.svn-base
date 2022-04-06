package net.jcms.framework.security.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.jcms.framework.base.web.BaseController;
import net.jcms.framework.security.model.User;
import net.jcms.framework.security.service.UserService;

public class SessonCheckController extends BaseController{

	@Resource (name="userService")
	private UserService userService;
	
	@RequestMapping (value="/system/login/sessionCheck.mng", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> sessionCheck(HttpServletRequest request){
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("user");
			
			if(user == null){
				result.put("result","sessionOut");
			}else{
				result.put("result","sessionIn");
			}
			
		}catch (Exception e){
			
		}
		return result;
	}
	
}
