package net.jcms.framework.menu.service.impl;
 
import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import net.jcms.framework.base.service.impl.BaseServiceImpl;
import net.jcms.framework.menu.mapper.MenuRoleMapper;
import net.jcms.framework.menu.model.MenuRole;
import net.jcms.framework.menu.model.MenuRoleSearch;
import net.jcms.framework.menu.service.MenuRoleService;
import net.jcms.framework.util.FileUtil;
import net.jcms.framework.util.PropertiesUtil;

@Service(value="menuRoleService")
public class MenuRoleServiceImpl extends BaseServiceImpl<MenuRole, MenuRoleSearch, MenuRoleMapper> implements MenuRoleService {

	@Override
	@Resource (name="menuRoleMapper")
	protected void setMapper (MenuRoleMapper mapper) {
		super.setMapper (mapper);
	}
	
}
