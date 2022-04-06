package net.jcms.conts.bod.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.jcms.conts.bod.mapper.BodRoleMapper;
import net.jcms.conts.bod.model.BodRole;
import net.jcms.conts.bod.service.BodRoleService;
import net.jcms.framework.base.service.impl.BaseServiceImpl;

@Service(value="bodRoleService")
public class BodRoleImpl extends BaseServiceImpl<BodRole, BodRole, BodRoleMapper> implements BodRoleService {

	@Override
	@Resource (name="bodRoleMapper")
	protected void setMapper (BodRoleMapper mapper) {
		super.setMapper (mapper);
	}

}
