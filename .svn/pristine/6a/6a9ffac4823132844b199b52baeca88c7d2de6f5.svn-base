package net.jcms.conts.bod.mapper;

import java.util.List;

import net.jcms.conts.bod.model.Bod;
import net.jcms.conts.bod.model.BodSearch;
import net.jcms.framework.base.mapper.BaseMapper;
import net.jcms.framework.security.model.Role;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper (value="bodMapper")
public interface BodMapper extends BaseMapper<Bod, BodSearch> {

	List<Role> selectRoleList(Role role);
	
}
