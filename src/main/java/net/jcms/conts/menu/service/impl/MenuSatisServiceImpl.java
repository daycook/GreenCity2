package net.jcms.conts.menu.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.jcms.conts.menu.mapper.MenuSatisMapper;
import net.jcms.conts.menu.model.MenuSatis;
import net.jcms.conts.menu.model.MenuSatisSearch;
import net.jcms.conts.menu.service.MenuSatisService;
import net.jcms.framework.base.service.impl.BaseServiceImpl;

import org.springframework.stereotype.Service;

@Service (value="menuSatisService")
public class MenuSatisServiceImpl extends BaseServiceImpl<MenuSatis, MenuSatisSearch, MenuSatisMapper> implements MenuSatisService {

	@Override
	@Resource(name="menuSatisMapper")
	protected void setMapper(MenuSatisMapper mapper){
		super.setMapper(mapper);
	}
	
	@Override
	public List<Map<String, Object>> selectSatisfaction(MenuSatisSearch satisfactionSearch) {
		return mapper.selectSatisfaction(satisfactionSearch);
	}

}
