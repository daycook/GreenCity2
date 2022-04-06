package net.jcms.framework.security.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.jcms.framework.base.web.BaseController;
import net.jcms.framework.security.model.LoginLog;
import net.jcms.framework.security.model.User;
import net.jcms.framework.security.model.UserSearch;
import net.jcms.framework.security.service.LoginLogService;
import net.jcms.framework.security.service.UserRoleService;
import net.jcms.framework.security.service.UserService;
import net.jcms.framework.util.StrUtil;

@Controller
public class UserController extends BaseController {
	@Resource (name="userService")
	private UserService userService;
	
	@Resource (name="loginLogService")
	private LoginLogService loginLogService;
	
	@Resource (name="userRoleService")
	private UserRoleService userRoleService;
	
	@RequestMapping (value="/system/user/list.mng", method=RequestMethod.GET)
	public String list() {
		return "system/user/list";
	}
	
	@RequestMapping (value="/system/user/list.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> list(HttpServletRequest request, UserSearch userSearch) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			String sort = request.getParameter("columns[" + request.getParameter("order[0][column]") + "][name]");
			String sortOder = request.getParameter("order[0][dir]");
			userSearch.setSort(sort);
			userSearch.setSortOrd(sortOder);
			userSearch.setPagingYn(true);
			
			int totalCount = userService.count(userSearch);
			result.put("recordsTotal", totalCount);
			result.put("recordsFiltered", totalCount);
			result.put("data", userService.selectList(userSearch));
			
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/login/loginForm.mng")
	public String loginForm (HttpServletRequest request, Model model) {
		model.addAttribute("path", request.getParameter("path"));
		return "system/login";
	}
	
	@RequestMapping (value="/login/login.mng", method=RequestMethod.POST)
	public String systemLogin (User user, HttpServletRequest request, HttpServletResponse response) {
		String path = request.getParameter("path");
		if(!path.equals("") && !path.equals("null") && path != null){
			return "redirect:"+request.getParameter("path");
		}
		return "redirect:/front/menu01/pro101.do";
	}
	
	@RequestMapping(value="/logout.mng")
	public String logoutPage (HttpServletRequest request, HttpServletResponse response, Model model) {
	    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null){    
	    	
	    	HttpSession session = request.getSession();
	    	LoginLog loginLog = new LoginLog();
	    	loginLog.setLoginLogId((Long) session.getAttribute("loginLogId"));
	        loginLogService.update(loginLog);
	        
	        new SecurityContextLogoutHandler().logout(request, response, auth);
	    }
	    return "redirect:/login/loginForm.mng?path="+request.getParameter("path");
	}
	
	@RequestMapping(value="/public/logout.mng")
	public String logoutCmsPage (HttpServletRequest request, HttpServletResponse response) {
	    Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	    if (auth != null){    
	    	
	    	HttpSession session = request.getSession();
	    	LoginLog loginLog = new LoginLog();
	    	loginLog.setLoginLogId((Long) session.getAttribute("loginLogId"));
	        loginLogService.update(loginLog);
	        
	        new SecurityContextLogoutHandler().logout(request, response, auth);
	    }

	    return "redirect:/main.do";
	}
	
	@RequestMapping (value="/user/selectList.json", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<User> selectListJson () {
		return userService.selectList (new UserSearch ());
	}
	
	@RequestMapping (value="/system/user/regist.mng", method=RequestMethod.GET)
	public String registUser (){
		return "system/user/regist";
	}
	
	@RequestMapping (value="/system/user/update.mng", method=RequestMethod.POST)
	public String updateUser (HttpServletRequest request, Model model, UserSearch userSearch){
		model.addAttribute("Selectuser", userService.select(userSearch) );
		return "system/user/regist";
	}
	
	
	@RequestMapping (value="/system/user/insert.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insert(HttpServletRequest request, User user){
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			user.setRegId(getUserId());
			userService.insert(user);
			
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/system/user/regist.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> regist(HttpServletRequest request, User user){
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			user.setUpdId(getUserId());
			userService.update(user);
			
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	
	@RequestMapping (value="/system/user/duplicate.json", method=RequestMethod.POST) 
	@ResponseBody
	public Map<String, String> checkIdDuplicate (UserSearch userSearch) {
		Map<String, String> result = new HashMap <String, String> ();
		if (userService.checkIdDuplicate(userSearch) > 0) {
			result.put("result", "exist");
			result.put("message", "사용 중입니다.");
		} else {
			result.put("result", "nonExist");
			result.put("message", "사용 가능합니다.");
		}
		return result;
		
	}
	
	@RequestMapping (value="/system/user/delete.json", method=RequestMethod.POST) 
	@ResponseBody
	public Map<String, String> delete (User user) {
		Map<String, String> result = new HashMap <String, String> ();
		try {
			user.setDelId(getUserId());
			userService.delete(user);
			result.put("result", "success");
		} catch (Exception e){
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/system/user/initFailCnt.json", method=RequestMethod.POST) 
	@ResponseBody
	public Map<String, String> initFailCntUpdate (User user) {
		Map<String, String> result = new HashMap <String, String> ();
		try {
			userService.updateInitUserLoginFailCnt(user);
			result.put("result", "success");
		} catch (Exception e){
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/system/user/mypage.mng", method=RequestMethod.GET)
	public String mypage(HttpServletRequest request,Model model,UserSearch userSearch) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		userSearch.setUserId(user.getUserId());
		model.addAttribute("Selectuser", userService.select(userSearch) );
		return "system/user/mypage";
	}
	
	@RequestMapping (value="/system/user/password/update.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> update(HttpServletRequest request,UserSearch userSearch) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			User temp = userService.select(userSearch);
			if(!temp.getUserPwd().equals (StrUtil.encryptSha512 (request.getParameter("nowUserPwd"), userSearch.getUserLoginId ()))){
				result.put("result", "exist");
				result.put("message", "현재 비밀번호가 틀립니다.");
			} else {
				userService.updatePwd(userSearch);
				result.put("result", "success");
			}
		} catch (Exception e) {
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/system/user/userOut.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> userOut(HttpServletRequest request,User user) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			user.setUpdId(getUserId());
			user.setUserStCd("9");
			userService.update(user);
			
			result.put("result", "success");
		} catch (Exception e) {
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/public/user/findId.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> findId(HttpServletRequest request, UserSearch userSearch) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			
			result.put("data", userService.select(userSearch));
			result.put("result", "success");
		} catch (Exception e) {
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result; 
	}

	@RequestMapping (value="/public/user/findPw.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> findPw(HttpServletRequest request, UserSearch userSearch) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			
			userService.findPw(userSearch);
			
			result.put("result", "success");
		} catch (Exception e) {
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result; 
	}
	
	@RequestMapping (value="/system/user/detailUser.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> detail(HttpServletRequest request, UserSearch userSearch){
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			result.put("data", userService.select(userSearch));
			result.put("result", "success");
		} catch (Exception e) {
			result.put("result", "fail");
		}
		return result;
	}
	
	@RequestMapping (value="/system/user/userStats.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> userStats(HttpServletRequest request, UserSearch userSearch) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			
			int totalCount = userService.count(userSearch);
			int userTotalOutCount = userService.userTotalOutCount();
			int thisWeekInUser = userService.thisWeekInUserCount();
			int thisWeekOutUser = userService.thisWeekOutUser();
			
			result.put("totalCount", totalCount);
			result.put("userTotalOutCount", userTotalOutCount);
			result.put("thisWeekInUser", thisWeekInUser);
			result.put("thisWeekOutUser", thisWeekOutUser);
			result.put("data", userService.thisWeekInUser());
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
}
