package net.jcms.framework.security.handler;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.omg.PortableInterceptor.SYSTEM_EXCEPTION;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import net.jcms.framework.security.model.LoginLog;
import net.jcms.framework.security.model.User;
import net.jcms.framework.security.model.UserSearch;
import net.jcms.framework.security.service.LoginLogService;
import net.jcms.framework.security.service.UserService;
import net.jcms.framework.util.HttpUtil;


@Component("loginSuccessHadler")
public class LoginSucessHandler implements AuthenticationSuccessHandler{
	
	@Resource (name="userService")
	private UserService userService;
	
	@Resource (name="loginLogService")
	private LoginLogService loginLogService;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		UserSearch userSearch = new UserSearch();
		userSearch.setUserLoginId(request.getParameter("userLoginId"));
		User user = userService.select(userSearch);
		
		LoginLog loginLog = new LoginLog();
		//loginLog.setUserId(user.getUserId());
		loginLog.getUser().setUserId(user.getUserId());
		loginLog.setLoginIp(HttpUtil.getClientIp(request));
        loginLogService.insert(loginLog);
        
        HttpSession session = request.getSession();
        
        session.setAttribute("loginLogId", loginLog.getLoginLogId());
		session.setAttribute("failCnt", 0);
		
		// 오라클은 주석 처리해야 실행 updateInitUserLoginFailCnt 확인
        user.setFailCnt(0);
        userService.updateInitUserLoginFailCnt(user);
        
	}
}
