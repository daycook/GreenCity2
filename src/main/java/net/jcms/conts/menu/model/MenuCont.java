package net.jcms.conts.menu.model;

import net.jcms.conts.cont.model.Cont;

public class MenuCont {

	private Long menuId;
	private Long contId;
	
	private Cont cont;
	
	public Cont getCont() {
		return cont;
	}
	public void setCont(Cont cont) {
		this.cont = cont;
	}
	public Long getMenuId() {
		return menuId;
	}
	public void setMenuId(Long menuId) {
		this.menuId = menuId;
	}
	public Long getContId() {
		return contId;
	}
	public void setContId(Long contId) {
		this.contId = contId;
	}
	
}
