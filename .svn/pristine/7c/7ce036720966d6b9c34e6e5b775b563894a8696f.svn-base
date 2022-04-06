package net.jcms.conts.site.model;

import net.jcms.conts.lang.model.Lang;
import net.jcms.framework.base.model.BaseModel;

public class Site extends BaseModel{
	
	private Long siteId;
	private Long langId;
	private String siteNm;
	private String domain;
	private String startUrl;
	private String copyright;

	private Lang lang;
	
	public Lang getLang() {
		if(lang != null) return lang;
		else return new Lang();
	}
	
	public String getCopyright() {
		return copyright;
	}
	public void setCopyright(String copyright) {
		this.copyright = copyright;
	}
	public void setLang(Lang lang) {
		this.lang = lang;
	}
	public Long getSiteId() {
		return siteId;
	}
	public void setSiteId(Long siteId) {
		this.siteId = siteId;
	}
	public Long getLangId() {
		return langId;
	}
	public void setLangId(Long langId) {
		this.langId = langId;
	}
	public String getSiteNm() {
		return siteNm;
	}
	public void setSiteNm(String siteNm) {
		this.siteNm = siteNm;
	}
	public String getDomain() {
		return domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
	}
	public String getStartUrl() {
		return startUrl;
	}
	public void setStartUrl(String startUrl) {
		this.startUrl = startUrl;
	}
}
