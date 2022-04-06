package net.jcms.conts.media.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.jcms.conts.media.mapper.MediaMapper;
import net.jcms.conts.media.model.Media;
import net.jcms.conts.media.model.MediaSearch;
import net.jcms.conts.media.service.MediaService;
import net.jcms.framework.base.service.impl.BaseServiceImpl;
import net.jcms.framework.util.StrUtil;

@Service(value="mediaService")
public class MediaServiceImpl extends BaseServiceImpl<Media, MediaSearch, MediaMapper> implements MediaService {

	@Override
	@Resource (name="mediaMapper")
	protected void setMapper (MediaMapper mapper) {
		super.setMapper (mapper);
	}

	@Override
	public void insert(Media media) {
		super.insert(media);
		media.setHash(StrUtil.getDigits(media.getMediaId()));
		mapper.updateHash(media);
	}

	@Override
	public void updateFile(Media media) {
		mapper.updateFile(media);
	}
	
}
