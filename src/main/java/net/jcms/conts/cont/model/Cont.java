package net.jcms.conts.cont.model;

import net.jcms.framework.base.model.BaseModel;

public class Cont extends BaseModel{

	private Long contId;
	private String contNm;
	
	private ContItem contItem;
	private Boolean bookmarkYn;
	
	public Long getContId() {
		return contId;
	}
	public void setContId(Long contId) {
		this.contId = contId;
	}
	public String getContNm() {
		return contNm;
	}
	public void setContNm(String contNm) {
		this.contNm = contNm;
	}
	public ContItem getContItem() {
		return contItem;
	}
	public void setContItem(ContItem contItem) {
		this.contItem = contItem;
	}
	public Boolean getBookmarkYn() {
		return bookmarkYn;
	}
	public void setBookmarkYn(Boolean bookmarkYn) {
		this.bookmarkYn = bookmarkYn;
	}
		
}
