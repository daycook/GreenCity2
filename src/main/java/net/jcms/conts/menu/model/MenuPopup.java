package net.jcms.conts.menu.model;

import net.jcms.framework.base.model.BaseModel;

public class MenuPopup extends BaseModel{

	private Long menuId;
	private Long popupId;
	
	public Long getMenuId() {
		return menuId;
	}
	public void setMenuId(Long menuId) {
		this.menuId = menuId;
	}
	public Long getPopupId() {
		return popupId;
	}
	public void setPopupId(Long popupId) {
		this.popupId = popupId;
	}
	
}
