package net.jcms.conts.site.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.jcms.conts.lang.model.LangSearch;
import net.jcms.conts.lang.service.LangService;
import net.jcms.conts.menu.model.Menu;
import net.jcms.conts.menu.service.MenuService;
import net.jcms.conts.site.mapper.SiteMapper;
import net.jcms.conts.site.model.Site;
import net.jcms.conts.site.model.SiteSearch;
import net.jcms.conts.site.service.SiteService;
import net.jcms.framework.base.service.impl.BaseServiceImpl;
import net.jcms.framework.util.ApplicationHelper;
import net.jcms.framework.util.Constants;

@Service(value="siteService")
public class SiteServiceImpl extends BaseServiceImpl<Site, SiteSearch, SiteMapper> implements SiteService {
	
	@Resource (name="langService")
	private LangService langService;
	
	@Resource (name="cmsMenuService")
	private MenuService menuService;
	
	@Override
	@Resource (name="siteMapper")
	protected void setMapper (SiteMapper mapper) {
		super.setMapper (mapper);
	}

	@Override
	public List<Site> selectList(SiteSearch s) {
		List<Site> resultList = new ArrayList<Site>();
		List<Site> siteList = super.selectList(s);
		LangSearch langSearch;
		for(Site site : siteList) {
			langSearch = new LangSearch();
			langSearch.setLangId(site.getLangId());
			site.setLang(langService.select(langSearch));
			resultList.add(site);
		}
		
		return resultList;
	}

	@Override
	public List<Site> selectJson() {
		if(ApplicationHelper.getSiteList() == null) {
			initJson();
		}
		
		return ApplicationHelper.getSiteList();
	}
	
	@Override
	public void initJson() {
		SiteSearch siteSearch = new SiteSearch();
		ApplicationHelper.setSiteList(selectList(siteSearch));
	}

	@Override
	public void insert(Site site) {
		super.insert(site);
		
		//메인 메뉴 등록
		Menu menu = new Menu();
		menu.setSiteId(site.getSiteId());
		menu.setMenuNm("메인");
		menu.setMenuUrl("main");
		menu.setMenuOrd(0);
		menu.setMenuTp(Constants.MENU_TYPE_PGM);
		menu.setUseSt("Y");
		menu.setRegId(site.getRegId());
		
		menuService.insert(menu);
		menuService.initJson(site.getSiteId());
	}
	
}
