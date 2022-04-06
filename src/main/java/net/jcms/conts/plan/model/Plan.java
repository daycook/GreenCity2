package net.jcms.conts.plan.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import net.jcms.framework.base.model.BaseModel;

public class Plan extends BaseModel {
	
	private Long planId;
	private Long siteId;
	private String planCtg;
	private String planTitle;
	private String planCont;
	private String planAddr;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startDt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endDt;
	private String fileId;
	private String imgMap;
	private int imgWidth;
	private int imgHeight;
	private String dispYn;
	private String planCtgLabel;
	
	public Long getPlanId() {
		return planId;
	}
	public void setPlanId(Long planId) {
		this.planId = planId;
	}
	public Long getSiteId() {
		return siteId;
	}
	public void setSiteId(Long siteId) {
		this.siteId = siteId;
	}
	public String getPlanCtg() {
		return planCtg;
	}
	public void setPlanCtg(String planCtg) {
		this.planCtg = planCtg;
	}
	public String getPlanTitle() {
		return planTitle;
	}
	public void setPlanTitle(String planTitle) {
		this.planTitle = planTitle;
	}
	public String getPlanCont() {
		return planCont;
	}
	public void setPlanCont(String planCont) {
		this.planCont = planCont;
	}
	public String getPlanAddr() {
		return planAddr;
	}
	public void setPlanAddr(String planAddr) {
		this.planAddr = planAddr;
	}
	public Date getStartDt() {
		return startDt;
	}
	public void setStartDt(Date startDt) {
		this.startDt = startDt;
	}
	public Date getEndDt() {
		return endDt;
	}
	public void setEndDt(Date endDt) {
		this.endDt = endDt;
	}
	public String getFileId() {
		return fileId;
	}
	public void setFileId(String fileId) {
		this.fileId = fileId;
	}
	public String getImgMap() {
		return imgMap;
	}
	public void setImgMap(String imgMap) {
		this.imgMap = imgMap;
	}
	public int getImgWidth() {
		return imgWidth;
	}
	public void setImgWidth(int imgWidth) {
		this.imgWidth = imgWidth;
	}
	public int getImgHeight() {
		return imgHeight;
	}
	public void setImgHeight(int imgHeight) {
		this.imgHeight = imgHeight;
	}
	public String getDispYn() {
		return dispYn;
	}
	public void setDispYn(String dispYn) {
		this.dispYn = dispYn;
	}
	public String getPlanCtgLabel() {
		return planCtgLabel;
	}
	public void setPlanCtgLabel(String planCtgLabel) {
		this.planCtgLabel = planCtgLabel;
	}
	
	
	
}
