package net.jcms.framework.cd.model;

import net.jcms.framework.base.model.BaseModel;

public class CdCls extends BaseModel{
	private String cdClsId;
	private String cdClsNm;
	private String cdClsDesc;
	private String useSt;
	
	
	public String getCdClsId() {
		return cdClsId;
	}
	public void setCdClsId(String cdClsId) {
		this.cdClsId = cdClsId;
	}
	public String getCdClsNm() {
		return cdClsNm;
	}
	public void setCdClsNm(String cdClsNm) {
		this.cdClsNm = cdClsNm;
	}
	public String getCdClsDesc() {
		return cdClsDesc;
	}
	public void setCdClsDesc(String cdClsDesc) {
		this.cdClsDesc = cdClsDesc;
	}
	public String getUseSt() {
		return useSt;
	}
	public void setUseSt(String useSt) {
		this.useSt = useSt;
	}
	
}
