package net.jcms.conts.media.service;

import net.jcms.conts.media.model.Media;
import net.jcms.conts.media.model.MediaSearch;
import net.jcms.framework.base.service.BaseService;

public interface MediaService extends BaseService<Media, MediaSearch> {
	
	void updateFile(Media media);
	
}
