package net.jcms.conts.cont.model;

import net.jcms.framework.base.model.BaseModel;

public class ContBkmak extends BaseModel{

	private Long contId;
	private Long userId;
	
	public Long getContId() {
		return contId;
	}
	public void setContId(Long contId) {
		this.contId = contId;
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	
}
