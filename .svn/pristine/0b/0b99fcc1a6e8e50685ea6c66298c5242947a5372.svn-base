package net.jcms.conts.menu.model;

import java.util.List;

import net.jcms.conts.site.model.Site;
import net.jcms.framework.base.model.BaseModel;
import net.jcms.framework.cd.model.CdDtl;
import net.jcms.framework.menu.model.MenuRole;

public class Menu extends BaseModel{

	private Long menuId;
	private Long siteId;
	private String menuNm;
	private Long upperMenuId;
	private String menuUrl;
	private String menuUrl2;
	private Integer menuOrd;
	private String menuDesc;
	private String menuTp;
	private String linkUrl;
	private String linkType;
	private String contDispType;
	private Long bodId;
	private String useSt;

	private Site site;
	private Menu upperMenu;
	private List<Menu> childList;
	private CdDtl menuTpCd;

	private Long fileId;
	List<MenuRole> menuRoleList;
	
	public CdDtl getMenuTpCd() {
		return menuTpCd;
	}
	public void setMenuTpCd(CdDtl menuTpCd) {
		this.menuTpCd = menuTpCd;
	}
	public String getUseSt() {
		return useSt;
	}
	public void setUseSt(String useSt) {
		this.useSt = useSt;
	}
	public Long getMenuId() {
		return menuId;
	}
	public void setMenuId(Long menuId) {
		this.menuId = menuId;
	}
	public Long getSiteId() {
		return siteId;
	}
	public void setSiteId(Long siteId) {
		this.siteId = siteId;
	}
	public String getMenuNm() {
		return menuNm;
	}
	public void setMenuNm(String menuNm) {
		this.menuNm = menuNm;
	}
	public Long getUpperMenuId() {
		return upperMenuId;
	}
	public void setUpperMenuId(Long upperMenuId) {
		this.upperMenuId = upperMenuId;
	}
	public String getMenuUrl() {
		return menuUrl;
	}
	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}
	
	public String getMenuUrl2() {
		return menuUrl2;
	}
	public void setMenuUrl2(String menuUrl2) {
		this.menuUrl2 = menuUrl2;
	}
	public String getMenuDesc() {
		return menuDesc;
	}
	public void setMenuDesc(String menuDesc) {
		this.menuDesc = menuDesc;
	}
	public Integer getMenuOrd() {
		return menuOrd;
	}
	public void setMenuOrd(Integer menuOrd) {
		this.menuOrd = menuOrd;
	}
	public Site getSite() {
		return site;
	}
	public void setSite(Site site) {
		this.site = site;
	}
	public Menu getUpperMenu() {
		return upperMenu;
	}
	public void setUpperMenu(Menu upperMenu) {
		this.upperMenu = upperMenu;
	}
	public List<Menu> getChildList() {
		return childList;
	}
	public void setChildList(List<Menu> childList) {
		this.childList = childList;
	}
	public String getMenuTp() {
		return menuTp;
	}
	public void setMenuTp(String menuTp) {
		this.menuTp = menuTp;
	}
	public String getLinkUrl() {
		return linkUrl;
	}
	public void setLinkUrl(String linkUrl) {
		this.linkUrl = linkUrl;
	}
	public String getLinkType() {
		return linkType;
	}
	public void setLinkType(String linkType) {
		this.linkType = linkType;
	}
	public String getContDispType() {
		return contDispType;
	}
	public void setContDispType(String contDispType) {
		this.contDispType = contDispType;
	}
	public Long getBodId() {
		return bodId;
	}
	public void setBodId(Long bodId) {
		this.bodId = bodId;
	}
	public Long getFileId () {
		return fileId;
	}
	public void setFileId (
			Long fileId) {
		this.fileId = fileId;
	}
	public List<MenuRole> getMenuRoleList() {
		return menuRoleList;
	}
	public void setMenuRoleList(List<MenuRole> menuRoleList) {
		this.menuRoleList = menuRoleList;
	}
	public Menu getRootMenu(){
		try {
			Menu menu = upperMenu;
			
			while(true){
				if(menu.upperMenu != null){
					menu = menu.upperMenu;
				} else {
					return menu;
				}
			}
		} catch (Exception e) {
			return null;
		}
	}
	
}
