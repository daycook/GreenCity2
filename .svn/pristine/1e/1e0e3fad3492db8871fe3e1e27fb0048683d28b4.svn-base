package net.jcms.conts.menu.service;

import java.util.List;
import java.util.Map;

import net.jcms.conts.menu.model.Menu;
import net.jcms.conts.menu.model.MenuSearch;
import net.jcms.framework.base.service.BaseService;

public interface MenuService extends BaseService<Menu, MenuSearch> {
	
	int selectMaxMenuOrder(MenuSearch menuSearch);
	
	Menu selectCurrentMenu(Long siteId, String servletPath);
	
	Menu selectParentMenu(Long siteId, Menu menu);
	
	void updateOrder(Menu menu);
	
	void updateUseSt(Menu menu);

	Map<Long, List<Menu>> selectJson();
	
	List<Menu> selectJson(Long siteId);
	
	void initJson();
	
	void initJson(Long siteId);
}
