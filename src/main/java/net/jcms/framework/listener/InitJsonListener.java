package net.jcms.framework.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.web.context.support.WebApplicationContextUtils;

import net.jcms.conts.bod.service.BodService;
import net.jcms.conts.site.service.SiteService;
import net.jcms.framework.cd.service.CdDtlService;
import net.jcms.framework.menu.service.MenuService;

public class InitJsonListener implements ServletContextListener {
	private CdDtlService cdDtlService;
	private SiteService siteService;
	private BodService bodService;
	private net.jcms.conts.menu.service.MenuService cmsMenuService;
	
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		// cdDtlService = WebApplicationContextUtils.getRequiredWebApplicationContext(sce.getServletContext()).getBean(CdDtlService.class);
		// cdDtlService.initJson();
		
		siteService = WebApplicationContextUtils.getRequiredWebApplicationContext(
				sce.getServletContext()).getBean(SiteService.class);
		siteService.initJson();
		
		bodService =  WebApplicationContextUtils.getRequiredWebApplicationContext(
				sce.getServletContext()).getBean(BodService.class);
		bodService.initJson();
		
		cmsMenuService = WebApplicationContextUtils.getRequiredWebApplicationContext(
				sce.getServletContext()).getBean(net.jcms.conts.menu.service.MenuService.class);
		cmsMenuService.initJson();
	}
}
