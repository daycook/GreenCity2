package net.jcms.front.front.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import net.jcms.conts.site.model.Site;
import net.jcms.conts.site.model.SiteSearch;
import net.jcms.framework.base.mapper.BaseMapper;
import net.jcms.front.front.model.Front;
import net.jcms.front.front.model.FrontSearch;

@Mapper (value="frontMapper")
public interface FrontMapper extends BaseMapper<Front, FrontSearch> {

	int testData(FrontSearch frontSearch);
	
}
