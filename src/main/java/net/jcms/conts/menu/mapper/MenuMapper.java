package net.jcms.conts.menu.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import net.jcms.conts.menu.model.Menu;
import net.jcms.conts.menu.model.MenuSearch;
import net.jcms.framework.base.mapper.BaseMapper;

@Mapper (value="cmsMenuMapper")
public interface MenuMapper extends BaseMapper<Menu, MenuSearch> {

	int selectMaxMenuOrder(MenuSearch menuSearch);
	
	void updateOrder(Menu menu);
	
	void updateUseSt(Menu menu);
	
}
