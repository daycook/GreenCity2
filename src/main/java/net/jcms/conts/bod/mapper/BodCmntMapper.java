package net.jcms.conts.bod.mapper;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import net.jcms.conts.bod.model.BodCmnt;
import net.jcms.conts.bod.model.BodCmntSearch;
import net.jcms.framework.base.mapper.BaseMapper;

@Mapper (value="bodCmntMapper")
public interface BodCmntMapper extends BaseMapper<BodCmnt, BodCmntSearch> {
	
	void updateCmntGrp(BodCmnt bodCmnt);

}
