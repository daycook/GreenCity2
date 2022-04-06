package net.jcms.conts.Research.model;

import java.sql.Date;

import net.jcms.framework.base.model.BaseModel;

public class ResearchAnswer extends BaseModel {
	private Long rchsmSeq;
	private Long ransSeq;
	private Date ransDt;
	
	public Long getRansSeq() {
		return ransSeq;
	}
	public void setRansSeq(Long ransSeq) {
		this.ransSeq = ransSeq;
	}
	public Date getRansDt() {
		return ransDt;
	}
	public void setRansDt(Date ransDt) {
		this.ransDt = ransDt;
	}
	public Long getRchsmSeq() {
		return rchsmSeq;
	}
	public void setRchsmSeq(Long rchsmSeq) {
		this.rchsmSeq = rchsmSeq;
	}
}