package net.jcms.conts.menu.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.jcms.conts.menu.mapper.MenuPopupMapper;
import net.jcms.conts.menu.model.MenuPopup;
import net.jcms.conts.menu.model.MenuPopupSearch;
import net.jcms.conts.menu.service.MenuPopupService;
import net.jcms.framework.base.service.impl.BaseServiceImpl;

@Service(value="cmsMenuPopupService")
public class MenuPopupServiceImpl extends BaseServiceImpl<MenuPopup, MenuPopupSearch, MenuPopupMapper> implements MenuPopupService {

	@Override
	@Resource (name="cmsMenuPopupMapper")
	protected void setMapper (MenuPopupMapper mapper) {
		super.setMapper (mapper);
	}

	@Override
	public void insert(long menuId, long[] popupIdList) {
		MenuPopup menuPopup = new MenuPopup();
		menuPopup.setMenuId(menuId);
		super.delete(menuPopup);
		if(popupIdList != null) {
			for(long popupId : popupIdList) {
				menuPopup.setPopupId(popupId);
				super.insert(menuPopup);
			}
		}
	}
	
}
