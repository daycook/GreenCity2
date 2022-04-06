package net.jcms.front.common.mapper;

import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import net.jcms.framework.base.mapper.BaseMapper;
import net.jcms.front.common.model.Common;
import net.jcms.front.common.model.CommonSearch;

@Mapper(value="frontUserMapper")
public interface FrontUserMapper extends BaseMapper<Common, CommonSearch>{

	void insertUserInfo(Map<String, Object> paramMap);

	Map<String, Object> selectUserInfo(Map<String, Object> paramMap);

	void insertUserRole(Map<String, Object> paramMap);

	void changeUserPswd(Map<String, Object> paramMap);

}
