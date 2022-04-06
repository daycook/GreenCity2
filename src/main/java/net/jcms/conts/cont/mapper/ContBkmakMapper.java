package net.jcms.conts.cont.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import net.jcms.conts.cont.model.ContBkmak;
import net.jcms.conts.cont.model.ContBkmakSearch;
import net.jcms.framework.base.mapper.BaseMapper;

@Mapper (value="contBkmakMapper")
public interface ContBkmakMapper extends BaseMapper<ContBkmak, ContBkmakSearch> {
	
}
