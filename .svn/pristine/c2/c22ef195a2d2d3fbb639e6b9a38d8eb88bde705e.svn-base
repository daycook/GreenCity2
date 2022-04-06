package net.jcms.conts.menu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.jcms.conts.menu.mapper.MenuConnHistMapper;
import net.jcms.conts.menu.model.MenuConnHist;
import net.jcms.conts.menu.model.MenuConnHistSearch;
import net.jcms.conts.menu.service.MenuConnHistService;
import net.jcms.framework.base.service.impl.BaseServiceImpl;

@Service(value="cmsMenuConnHistService")
public class MenuConnHistServiceImpl extends BaseServiceImpl<MenuConnHist, MenuConnHistSearch, MenuConnHistMapper> implements MenuConnHistService {

	@Override
	@Resource (name="cmsMenuConnHistMapper")
	protected void setMapper (MenuConnHistMapper mapper) {
		super.setMapper (mapper);
	}

	@Override
	public List<MenuConnHistSearch> siteStats(
			MenuConnHistSearch menuConnHistSearch) {
		return mapper.siteStats (menuConnHistSearch);
	}
	
}
