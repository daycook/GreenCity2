package net.jcms.conts.menu.service;

import java.util.List;
import java.util.Map;

import net.jcms.conts.menu.model.MenuSatis;
import net.jcms.conts.menu.model.MenuSatisSearch;
import net.jcms.framework.base.service.BaseService;

public interface MenuSatisService extends BaseService<MenuSatis, MenuSatisSearch>{

	List<Map<String, Object>> selectSatisfaction(MenuSatisSearch satisfactionSearch);
	
}
