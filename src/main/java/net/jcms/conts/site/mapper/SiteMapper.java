package net.jcms.conts.site.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import net.jcms.conts.site.model.Site;
import net.jcms.conts.site.model.SiteSearch;
import net.jcms.framework.base.mapper.BaseMapper;

@Mapper (value="siteMapper")
public interface SiteMapper extends BaseMapper<Site, SiteSearch> {
	
}
