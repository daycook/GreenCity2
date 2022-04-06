package net.jcms.conts.menu.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.jcms.conts.menu.mapper.MenuMapper;
import net.jcms.conts.menu.model.Menu;
import net.jcms.conts.menu.model.MenuPopupSearch;
import net.jcms.conts.menu.model.MenuSearch;
import net.jcms.conts.menu.service.MenuPopupService;
import net.jcms.conts.menu.service.MenuService;
import net.jcms.conts.site.model.Site;
import net.jcms.conts.site.service.SiteService;
import net.jcms.framework.base.service.impl.BaseServiceImpl;
import net.jcms.framework.util.ApplicationHelper;
import net.jcms.framework.util.CdUtil;

@Service(value="cmsMenuService")
public class MenuServiceImpl extends BaseServiceImpl<Menu, MenuSearch, MenuMapper> implements MenuService {

	@Resource (name="siteService")
	private SiteService siteService;
	
	@Resource (name="cmsMenuPopupService")
	private MenuPopupService menuPopupService;
	
	@Override
	@Resource (name="cmsMenuMapper")
	protected void setMapper (MenuMapper mapper) {
		super.setMapper (mapper);
	}

	@Override
	public Menu select(MenuSearch menuSearch) {		
		Menu menu = super.select(menuSearch); 
		if(menu.getUpperMenuId() != null) {
			menuSearch = new MenuSearch();
			menuSearch.setMenuId(menu.getUpperMenuId());
			menu.setUpperMenu(super.select(menuSearch));
		}
		
		menu.setMenuTpCd(CdUtil.cdDtl("program", menu.getMenuTp().trim()));
		
		MenuPopupSearch menuPopupSearch = new MenuPopupSearch();
		menuPopupSearch.setMenuId(menu.getMenuId());
		//menu.setPopupCnt(menuPopupService.count(menuPopupSearch));
		return menu;
	}

	@Override
	public List<Menu> selectList(MenuSearch menuSearch) {
		menuSearch.setSort("MENU_ORD");
		menuSearch.setSortOrd("ASC");
		List<Menu> menuList = super.selectList(menuSearch);
		
		return setChildList(menuList);
	}
	
	public List<Menu> setChildList(List<Menu> menuList) {
		List<Menu> resultList = new ArrayList<Menu>();
		MenuSearch menuSearch;
		MenuPopupSearch menuPopupSearch;

		for(Menu menu : menuList) {
			menuSearch = new MenuSearch();
			menuSearch.setUpperMenuId(menu.getMenuId());
			menuSearch.setSort("MENU_ORD");
			menuSearch.setSortOrd("ASC");
			menu.setChildList(setChildList(mapper.selectList(menuSearch)));
			
			menuPopupSearch = new MenuPopupSearch();
			menuPopupSearch.setMenuId(menu.getMenuId());
			//menu.setPopupCnt(menuPopupService.count(menuPopupSearch));
			
			if(menu.getUpperMenuId() != null) {
				menuSearch = new MenuSearch();
				menuSearch.setMenuId(menu.getUpperMenuId());
				menu.setUpperMenu(select(menuSearch));
			}
			
			menu.setMenuTpCd(CdUtil.cdDtl("program", menu.getMenuTp().trim()));
			
			resultList.add(menu);
		}
		return resultList;
	}
	
	/**
	 * 해당 메뉴의 최상의 메뉴를 조회한다.
	 */
	@Override
	public Menu selectParentMenu(Long siteId, Menu menu) {
		if(menu.getUpperMenuId() == null) { //1depth 메뉴
			return menu;
		}else {
			List<Menu> menuList = selectJson(siteId);
			for(Menu m : menuList) {
				for(Menu m2 : m.getChildList()) {
					if(m2.getMenuId().compareTo(menu.getMenuId()) == 0) {
						return m;
					}
					for(Menu m3 : m2.getChildList()) {
						if(m3.getMenuId().compareTo(menu.getMenuId()) == 0) {
							return m;
						}
					}
				}
			}
		}
		return null;
	}

	@Override
	public void updateOrder(Menu menu) {
		mapper.updateOrder(menu);
	}
	
	@Override
	public void updateUseSt(Menu menu) {
		mapper.updateUseSt(menu);
	}
	
	@Override
	public Map<Long, List<Menu>> selectJson() {
		if(ApplicationHelper.getCmsMenuMap() == null) {
			initJson();
		}
		
		return ApplicationHelper.getCmsMenuMap();
	}
	
	@Override
	public List<Menu> selectJson(Long siteId) {
		Map<Long, List<Menu>> menuMap = selectJson();
		return menuMap.get(siteId);
	}
	
	@Override
	public void initJson() {
		Map<Long, List<Menu>> menuMap = new HashMap<Long, List<Menu>>();
		
		List<Site> siteList = siteService.selectJson();
		for(Site site : siteList) {
			MenuSearch menuSearch = new MenuSearch();
			menuSearch.setSiteId(site.getSiteId());
			menuMap.put(site.getSiteId(), selectList(menuSearch));
		}
		ApplicationHelper.setCmsMenuMap(menuMap);
	}
	
	@Override
	public void initJson(Long siteId) {
		Map<Long, List<Menu>> menuMap = selectJson();
		
		MenuSearch menuSearch = new MenuSearch();
		menuSearch.setSiteId(siteId);
		menuMap.put(siteId, selectList(menuSearch));
		
		ApplicationHelper.setCmsMenuMap(menuMap);
	}


	@Override
	public Menu selectCurrentMenu(Long siteId, String servletPath) {
		List<Menu> menuList = selectJson(siteId);
		String[] servletPathArray = servletPath.split("/");
		
		Menu result = null;
		
		Menu topParentMenu = null;
		for(Menu menu : menuList) {
			if(menu.getMenuUrl().equals(servletPathArray[0])) {
				result = menu;
				topParentMenu = menu;
				break;
			}
		}
		
		Menu parentMenu = null;
		if(servletPathArray.length > 1) {
			for(Menu menu : topParentMenu.getChildList()) {
				if(menu.getMenuUrl().equals(servletPathArray[1])) {
					result = menu;
					parentMenu = menu;
					break;
				}
			}
		}
		
		if(servletPathArray.length > 2) {
			for(Menu menu : parentMenu.getChildList()) {
				if(menu.getMenuUrl().equals(servletPathArray[2])) {
					return menu;
				}
			}
		}
		
		return result;
	}

	@Override
	public int selectMaxMenuOrder(MenuSearch menuSearch) {
		return mapper.selectMaxMenuOrder(menuSearch);
	}

}
