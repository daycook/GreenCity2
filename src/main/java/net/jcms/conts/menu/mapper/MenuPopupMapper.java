package net.jcms.conts.menu.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import net.jcms.conts.menu.model.MenuPopup;
import net.jcms.conts.menu.model.MenuPopupSearch;
import net.jcms.framework.base.mapper.BaseMapper;

@Mapper (value="cmsMenuPopupMapper")
public interface MenuPopupMapper extends BaseMapper<MenuPopup, MenuPopupSearch> {
	
}
