package net.jcms.conts.Research.model;

import net.jcms.framework.base.model.BaseModel;

public class Research extends BaseModel {
	private Long rchSeq;
	private Integer mbsId;
	private String rchNm;
	private String rchDef;
	
	public Long getRchSeq() {
		return rchSeq;
	}
	public void setRchSeq(Long rchSeq) {
		this.rchSeq = rchSeq;
	}
	public int getMbsId() {
		return mbsId;
	}
	public void setMbsId(int mbsId) {
		this.mbsId = mbsId;
	}
	public String getRchNm() {
		return rchNm;
	}
	public void setRchNm(String rchNm) {
		this.rchNm = rchNm;
	}
	public String getRchDef() {
		return rchDef;
	}
	public void setRchDef(String rchDef) {
		this.rchDef = rchDef;
	}	
}
