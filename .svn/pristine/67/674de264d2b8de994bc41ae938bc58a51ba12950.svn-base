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
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.context.support.WebApplicationContextUtils;

import egovframework.rte.fdl.security.userdetails.util.EgovUserDetailsHelper;
import net.jcms.framework.security.model.User;
import net.jcms.framework.security.model.UserSearch;
import net.jcms.framework.security.service.UserService;
import net.jcms.framework.util.StrUtil;

public class SpringSecurityAjaxFilter implements Filter {
	private FilterConfig filterConfig;

	private static final Logger logger = LoggerFactory.getLogger(SpringSecurityAjaxFilter.class);
	private String ajaxHeader;
    public SpringSecurityAjaxFilter() {
    }

	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig = filterConfig;
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
	      HttpServletRequest req = (HttpServletRequest) request;
	      HttpServletResponse res = (HttpServletResponse) response;
	      if (isAjaxRequest(req)) {
	          try {
	               chain.doFilter(req, res);
	          } catch (AccessDeniedException e) {
	               res.sendError(HttpServletResponse.SC_FORBIDDEN);
	          } catch (AuthenticationException e) {
	               res.sendError(HttpServletResponse.SC_UNAUTHORIZED);
	          }
	     }else{
	          chain.doFilter(req, res);
	     }

	}

	private boolean isAjaxRequest(HttpServletRequest req) {

        return req.getHeader(ajaxHeader) != null && req.getHeader(ajaxHeader).equals(Boolean.TRUE.toString());
	}

	public void destroy() {
	}


	public String getAjaxHeader() {
		return ajaxHeader;
	}

	public void setAjaxHeader(String ajaxHeader) {
		this.ajaxHeader = ajaxHeader;
	}

	
}

