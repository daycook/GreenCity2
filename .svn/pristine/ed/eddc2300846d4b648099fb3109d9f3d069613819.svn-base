package net.jcms.conts.menu.service;

import java.util.List;

import net.jcms.conts.menu.model.MenuCont;
import net.jcms.conts.menu.model.MenuContSearch;
import net.jcms.framework.base.service.BaseService;

public interface MenuContService extends BaseService<MenuCont, MenuContSearch> {
	
	List<MenuCont> selectList(MenuContSearch menuContSearch, Long langId);
	
	public void insert(Long menuId, Long[] contIdList);
	
}
