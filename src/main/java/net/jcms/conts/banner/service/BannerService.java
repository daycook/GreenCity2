package net.jcms.conts.banner.service;

import net.jcms.conts.banner.model.Banner;
import net.jcms.conts.banner.model.BannerSearch;
import net.jcms.framework.base.service.BaseService;

public interface BannerService extends BaseService<Banner, BannerSearch> {

	void insert(Banner banner, Long itemId);

	void update(Banner banner, Long itemId);
	
}
