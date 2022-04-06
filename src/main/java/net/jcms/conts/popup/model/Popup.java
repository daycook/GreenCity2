package net.jcms.conts.popup.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import net.jcms.framework.base.model.BaseModel;

public class Popup extends BaseModel{
	
	private Long popupId;
	private String popupNm;
	private String popupTp;
	private Integer width;
	private Integer height;
	private Long fileId;
	private String imgMap;
	private String alt;
	private String linkUrl;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date startDt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date endDt;
	private Boolean useSt;
	
	private String popupTpNm;
	private String popupTpLabel;
	
	public String getPopupTpNm() {
		return popupTpNm;
	}

	public void setPopupTpNm(String popupTpNm) {
		this.popupTpNm = popupTpNm;
	}

	public void setPopupTpLabel(String popupTpLabel) {
		this.popupTpLabel = popupTpLabel;
	}

	public String getPopupTpLabel() {
		return popupTpLabel;
	}

	public Long getPopupId() {
		return popupId;
	}

	public void setPopupId(Long popupId) {
		this.popupId = popupId;
	}

	public String getPopupNm() {
		return popupNm;
	}

	public void setPopupNm(String popupNm) {
		this.popupNm = popupNm;
	}

	public String getPopupTp() {
		return popupTp;
	}

	public void setPopupTp(String popupTp) {
		this.popupTp = popupTp;
	}

	public Integer getWidth() {
		return width;
	}

	public void setWidth(Integer width) {
		this.width = width;
	}

	public Integer getHeight() {
		return height;
	}

	public void setHeight(Integer height) {
		this.height = height;
	}

	public Long getFileId() {
		return fileId;
	}

	public void setFileId(Long fileId) {
		this.fileId = fileId;
	}

	public String getImgMap() {
		return imgMap;
	}

	public void setImgMap(String imgMap) {
		this.imgMap = imgMap;
	}

	public String getAlt() {
		return alt;
	}

	public void setAlt(String alt) {
		this.alt = alt;
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

	public Boolean getUseSt() {
		return useSt;
	}

	public void setUseSt(Boolean useSt) {
		this.useSt = useSt;
	}
	
}
