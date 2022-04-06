package net.jcms.conts.menu.service;

import java.util.List;

import net.jcms.conts.menu.model.MenuConnHist;
import net.jcms.conts.menu.model.MenuConnHistSearch;
import net.jcms.framework.base.service.BaseService;

public interface MenuConnHistService extends BaseService<MenuConnHist, MenuConnHistSearch> {

	List<MenuConnHistSearch> siteStats(MenuConnHistSearch menuConnHistSearch);
	
}
