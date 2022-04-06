package net.jcms.framework.security.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import net.jcms.framework.base.mapper.BaseMapper;
import net.jcms.framework.security.model.LoginLog;
import net.jcms.framework.security.model.LoginLogSearch;

@Mapper (value="loginLogMapper")
public interface LoginLogMapper extends BaseMapper<LoginLog, LoginLogSearch> {
	
}
