package net.jcms.conts.menu.mapper;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import net.jcms.conts.menu.model.MenuConnHist;
import net.jcms.conts.menu.model.MenuConnHistSearch;
import net.jcms.framework.base.mapper.BaseMapper;

@Mapper (value="cmsMenuConnHistMapper")
public interface MenuConnHistMapper extends BaseMapper<MenuConnHist, MenuConnHistSearch> {

	List<MenuConnHistSearch> siteStats(MenuConnHistSearch menuConnHistSearch);
	
}
