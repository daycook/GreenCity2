package net.jcms.conts.menu.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.jcms.conts.cont.model.ContSearch;
import net.jcms.conts.cont.service.ContService;
import net.jcms.conts.menu.mapper.MenuContMapper;
import net.jcms.conts.menu.model.MenuCont;
import net.jcms.conts.menu.model.MenuContSearch;
import net.jcms.conts.menu.service.MenuContService;
import net.jcms.framework.base.service.impl.BaseServiceImpl;

@Service(value="cmsMenuContService")
public class MenuContServiceImpl extends BaseServiceImpl<MenuCont, MenuContSearch, MenuContMapper> implements MenuContService {

	@Resource (name="contService")
	private ContService contService;
	
	@Override
	@Resource (name="cmsMenuContMapper")
	protected void setMapper (MenuContMapper mapper) {
		super.setMapper (mapper);
	}
	
	@Override
	public void insert(Long menuId, Long[] contIdList) {
		MenuCont menuCont = new MenuCont();
		menuCont.setMenuId(menuId);
		delete(menuCont);
		
		if(contIdList != null) {
			for(Long contId : contIdList) {
				menuCont.setContId(contId);
				insert(menuCont);
			}
		}
	}

	@Override
	public List<MenuCont> selectList(MenuContSearch menuContSearch) {
		List<MenuCont> resultList = new ArrayList<MenuCont>();
		List<MenuCont> menuContList = super.selectList(menuContSearch);
		ContSearch contSearch;
		for(MenuCont menuCont : menuContList) {
			contSearch = new ContSearch();
			contSearch.setContId(menuCont.getContId());
			menuCont.setCont(contService.select(contSearch));
			
			resultList.add(menuCont);
		}
		return resultList;
	}
	
	@Override
	public List<MenuCont> selectList(MenuContSearch menuContSearch, Long langId) {
		List<MenuCont> resultList = new ArrayList<MenuCont>();
		List<MenuCont> menuContList = super.selectList(menuContSearch);
		ContSearch contSearch;
		for(MenuCont menuCont : menuContList) {
			contSearch = new ContSearch();
			contSearch.setContId(menuCont.getContId());
			menuCont.setCont(contService.select(contSearch, langId));
			
			resultList.add(menuCont);
		}
		return resultList;
	}
	
	
}
