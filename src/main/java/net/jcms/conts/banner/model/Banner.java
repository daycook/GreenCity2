package net.jcms.conts.banner.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import net.jcms.framework.base.model.BaseModel;

public class Banner extends BaseModel{
	
	private Long bannerId;
	private String bannerTp;
	private String bannerNm;
	private String bannerAlt;
	private String linkUrl;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startDt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endDt;
	
	private Long fileId;
	private Long siteId;
	private Boolean useSt;

	private String bannerTpNm;
	private String bannerTpLabel;
	
	public Long getBannerId() {
		return bannerId;
	}
	public void setBannerId(Long bannerId) {
		this.bannerId = bannerId;
	}
	public String getBannerTp() {
		return bannerTp;
	}
	public void setBannerTp(String bannerTp) {
		this.bannerTp = bannerTp;
	}
	public String getBannerNm() {
		return bannerNm;
	}
	public void setBannerNm(String bannerNm) {
		this.bannerNm = bannerNm;
	}
	public String getBannerAlt() {
		return bannerAlt;
	}
	public void setBannerAlt(String bannerAlt) {
		this.bannerAlt = bannerAlt;
	}
	public String getLinkUrl() {
		return linkUrl;
	}
	public void setLinkUrl(String linkUrl) {
		this.linkUrl = linkUrl;
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
	
	public Long getFileId() {
		return fileId;
	}
	public void setFileId(Long fileId) {
		this.fileId = fileId;
	}
	
	public Long getSiteId() {
		return siteId;
	}
	public void setSiteId(Long siteId) {
		this.siteId = siteId;
	}
	public Boolean getUseSt() {
		return useSt;
	}
	public void setUseSt(Boolean useSt) {
		this.useSt = useSt;
	}
	public String getBannerTpNm() {
		return bannerTpNm;
	}
	public void setBannerTpNm(String bannerTpNm) {
		this.bannerTpNm = bannerTpNm;
	}
	public String getBannerTpLabel() {
		return bannerTpLabel;
	}
	public void setBannerTpLabel(String bannerTpLabel) {
		this.bannerTpLabel = bannerTpLabel;
	}
}
