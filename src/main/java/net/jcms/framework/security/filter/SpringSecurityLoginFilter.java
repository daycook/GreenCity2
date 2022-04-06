package net.jcms.framework.security.filter;

import java.io.IOException;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.context.support.WebApplicationContextUtils;

import egovframework.rte.fdl.security.userdetails.util.EgovUserDetailsHelper;
import net.jcms.framework.menu.service.MenuService;
import net.jcms.framework.security.model.User;
import net.jcms.framework.security.model.UserRole;
import net.jcms.framework.security.service.UserRoleService;
import net.jcms.framework.security.service.UserService;

@WebFilter("/LoginFilter")
public class SpringSecurityLoginFilter implements Filter {
	private FilterConfig filterConfig;

	private static final Logger logger = LoggerFactory.getLogger(SpringSecurityLoginFilter.class);

    public SpringSecurityLoginFilter() {
    }

	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig = filterConfig;
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// 로그인 URL
		logger.debug ("------------------------- starting SpringSecurityLoginFilter-----------------------------");
		
		String loginURL = filterConfig.getInitParameter("loginURL");
		loginURL = loginURL.replaceAll("\r", "").replaceAll("\n", "");
		String loginProcessURL = filterConfig.getInitParameter("loginProcessURL");
		loginProcessURL = loginProcessURL.replaceAll("\r", "").replaceAll("\n", "");

		
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		HttpServletResponse httpResponse = (HttpServletResponse)response;
		HttpSession session = httpRequest.getSession();
		String requestURL = httpRequest.getRequestURI();
		
		if (EgovUserDetailsHelper.getAuthenticatedUser() == null || requestURL.contains(loginProcessURL)) {
			logger.debug ("------------------------- processing login SpringSecurityLoginFilter-----------------------------");

			try {
				ApplicationContext act = WebApplicationContextUtils.getRequiredWebApplicationContext(filterConfig.getServletContext());
				
				UserService userService = (UserService) act.getBean ("userService");
				User user = new User ();
				user.setUserLoginId (request.getParameter ("userLoginId"));
				user.setUserPwd (request.getParameter ("userPwd"));
				user = userService.login (user);
				
				UsernamePasswordAuthenticationFilter springSecurity = null;
				 
				@SuppressWarnings("rawtypes")
				Map beans = act.getBeansOfType(UsernamePasswordAuthenticationFilter.class);
				if (beans.size() > 0) {
					springSecurity = (UsernamePasswordAuthenticationFilter)beans.values().toArray()[0];
				} else {
					logger.debug ("------------------------- fail to get authenticationProcssingFilter SpringSecurityLoginFilter-----------------------------");
					throw new IllegalStateException("No AuthenticationProcessingFilter");
				}
				
				if(user == null) { //로그인 실패
					springSecurity.doFilter (new RequestWrapperForSecurity(httpRequest, null, null), response, chain);
					return;
				}else {
					session.setAttribute ("user", user);
					UserRoleService userRoleService = (UserRoleService) act.getBean ("userRoleService");
					UserRole userRole = new UserRole();
					userRole.setUserId(user.getUserId());
					userRole = userRoleService.select(userRole);
					session.setAttribute ("userRole" , userRole.getRoleAuth());
					
					MenuService menuService = (MenuService) act.getBean ("menuService");
					menuService.selectRoleMenuList(user.getUserId(),true);
					
					springSecurity.doFilter (new RequestWrapperForSecurity(httpRequest, user.getUserLoginId(), user.getUserPwd ()), response, chain);
				}
			} catch (Exception ex) {
				RequestDispatcher dispatcher = httpRequest.getRequestDispatcher(loginURL);
				dispatcher.forward(httpRequest, httpResponse);
			}
		}
		
		chain.doFilter (request, response);
	}

	public void destroy() {
	}

}

class RequestWrapperForSecurity extends HttpServletRequestWrapper {
	private String username = null;
	private String password = null;

	public RequestWrapperForSecurity(HttpServletRequest request, String username, String password) {
		super(request);

		this.username = username;
		this.password = password;
	}

	@Override
	public String getRequestURI() {
		return ((HttpServletRequest) super.getRequest()).getContextPath() + "/j_spring_security_check";
	}

	@Override
	public String getParameter(String name) {
		if (name.equals("j_username")) {
			return username;
		}

		if (name.equals("j_password")) {
			return password;
		}

		return super.getParameter(name);
	}
}
