package net.jcms.conts.Research.model;

import net.jcms.framework.base.model.BaseModel;

public class QstSm extends BaseModel{
	
	private Long rchsmSeq;
	private Long qstSeq;
	private Long qitSeq;
	private Integer qstsmVal;
	public Long getRchsmSeq() {
		return rchsmSeq;
	}
	public void setRchsmSeq(Long rchsmSeq) {
		this.rchsmSeq = rchsmSeq;
	}
	public Long getQstSeq() {
		return qstSeq;
	}
	public void setQstSeq(Long qstSeq) {
		this.qstSeq = qstSeq;
	}
	public Long getQitSeq() {
		return qitSeq;
	}
	public void setQitSeq(Long qitSeq) {
		this.qitSeq = qitSeq;
	}
	public Integer getQstsmVal() {
		return qstsmVal;
	}
	public void setQstsmVal(Integer qstsmVal) {
		this.qstsmVal = qstsmVal;
	}
	@Override
	public String toString() {
		return "QstSm [rchsmSeq=" + rchsmSeq + ", qstSeq=" + qstSeq + ", qitSeq=" + qitSeq + ", qstsmVal=" + qstsmVal
				+ "]";
	}

	
	
}
