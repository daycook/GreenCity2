package net.jcms.conts.cont.mapper;

import java.util.List;
import java.util.Map;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import net.jcms.conts.cont.model.Cont;
import net.jcms.conts.cont.model.ContSearch;
import net.jcms.framework.base.mapper.BaseMapper;

@Mapper (value="contMapper")
public interface ContMapper extends BaseMapper<Cont, ContSearch> {
	
	List<Map<String, Object>> dynamic(ContSearch contSearch);
	String selectSerial();
}
