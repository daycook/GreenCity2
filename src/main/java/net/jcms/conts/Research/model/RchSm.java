package net.jcms.conts.Research.model;

import java.util.Date;

import net.jcms.framework.base.model.BaseModel;

public class RchSm extends BaseModel {
	private Integer rchsmSeq;
	private Integer rchSeq;
	private String rchsmNm;
	private Integer mbsId;
	private String rchTrg;
	private String rchColYn;
	private Date rchsmStartDt;
	private Date rchsmEndDt;
	private Integer rchsmVal;
	
	public Integer getRchsmSeq() {
		return rchsmSeq;
	}
	public void setRchsmSeq(Integer rchsmSeq) {
		this.rchsmSeq = rchsmSeq;
	}
	public Integer getRchSeq() {
		return rchSeq;
	}
	public void setRchSeq(Integer rchSeq) {
		this.rchSeq = rchSeq;
	}
	public String getRchsmNm() {
		return rchsmNm;
	}
	public void setRchsmNm(String rchsmNm) {
		this.rchsmNm = rchsmNm;
	}
	public Integer getMbsId() {
		return mbsId;
	}
	public void setMbsId(Integer mbsId) {
		this.mbsId = mbsId;
	}
	public String getRchTrg() {
		return rchTrg;
	}
	public void setRchTrg(String rchTrg) {
		this.rchTrg = rchTrg;
	}
	public String getRchColYn() {
		return rchColYn;
	}
	public void setRchColYn(String rchColYn) {
		this.rchColYn = rchColYn;
	}
	public Date getRchsmStartDt() {
		return rchsmStartDt;
	}
	public void setRchsmStartDt(Date rchsmStartDt) {
		this.rchsmStartDt = rchsmStartDt;
	}
	public Date getRchsmEndDt() {
		return rchsmEndDt;
	}
	public void setRchsmEndDt(Date rchsmEndDt) {
		this.rchsmEndDt = rchsmEndDt;
	}
	public Integer getRchsmVal() {
		return rchsmVal;
	}
	public void setRchsmVal(Integer rchsmVal) {
		this.rchsmVal = rchsmVal;
	}
	
}
