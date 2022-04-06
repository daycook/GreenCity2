package net.jcms.conts.menu.service;

import net.jcms.conts.menu.model.MenuPopup;
import net.jcms.conts.menu.model.MenuPopupSearch;
import net.jcms.framework.base.service.BaseService;

public interface MenuPopupService extends BaseService<MenuPopup, MenuPopupSearch> {
	
	public void insert(long menuId, long[] popupIdList);
	
}
