package net.jcms.conts.menu.mapper;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import net.jcms.conts.cont.model.Cont;
import net.jcms.conts.menu.model.MenuCont;
import net.jcms.conts.menu.model.MenuContSearch;
import net.jcms.framework.base.mapper.BaseMapper;

@Mapper (value="cmsMenuContMapper")
public interface MenuContMapper extends BaseMapper<MenuCont, MenuContSearch> {
	
	public List<Cont> selectCont(MenuContSearch menuContSearch);
	
}
