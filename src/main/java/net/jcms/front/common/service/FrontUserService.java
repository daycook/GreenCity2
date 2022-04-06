package net.jcms.front.common.service;

import java.util.Map;

import net.jcms.framework.base.service.BaseService;
import net.jcms.front.common.model.Common;
import net.jcms.front.common.model.CommonSearch;

public interface FrontUserService extends BaseService<Common, CommonSearch>{
	void insertUserInfo(Map<String,Object>paramMap);

	Map<String, Object> selectUserInfo(Map<String, Object> paramMap);

	void changeUserPswd(Map<String, Object> paramMap);
}
