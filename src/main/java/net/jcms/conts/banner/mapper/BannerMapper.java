package net.jcms.conts.banner.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import net.jcms.conts.banner.model.Banner;
import net.jcms.conts.banner.model.BannerSearch;
import net.jcms.framework.base.mapper.BaseMapper;

@Mapper (value="bannerMapper")
public interface BannerMapper extends BaseMapper<Banner, BannerSearch> {
	
}
