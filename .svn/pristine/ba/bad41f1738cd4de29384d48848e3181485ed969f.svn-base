package net.jcms.front.common.mapper;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import net.jcms.framework.base.mapper.BaseMapper;
import net.jcms.front.common.model.Common;
import net.jcms.front.common.model.CommonSearch;

@Mapper (value="commonMapper")
public interface CommonMapper extends BaseMapper<Common, CommonSearch> {

	void insertGwDataOrg();

	void insertGwDataValue();

	List<Map<String, Object>> getCodeList(Map<String, Object> paramMap);

}
