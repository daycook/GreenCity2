package net.jcms.conts.banner.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.jcms.conts.banner.mapper.BannerMapper;
import net.jcms.conts.banner.model.Banner;
import net.jcms.conts.banner.model.BannerSearch;
import net.jcms.conts.banner.service.BannerService;
import net.jcms.framework.base.service.impl.BaseServiceImpl;
import net.jcms.framework.file.model.FileInfo;
import net.jcms.framework.file.model.FileItem;
import net.jcms.framework.file.service.FileItemService;
import net.jcms.framework.file.service.FileService;

@Service(value="bannerService")
public class BannerServiceImpl extends BaseServiceImpl<Banner, BannerSearch, BannerMapper> implements BannerService {

	@Resource (name="fileItemService")
	private FileItemService fileItemService;
	
	@Resource (name="fileService")
	private FileService fileService;
	
	
	@Override
	@Resource (name="bannerMapper")
	protected void setMapper (BannerMapper mapper) {
		super.setMapper (mapper);
	}

	@Override
	public void insert(Banner banner, Long itemId) {
		FileInfo file = new FileInfo();
		fileService.insert(file);
		
		FileItem fileItem = new FileItem();
		fileItem.setFileId(file.getFileId());
		fileItem.setItemId(itemId);
		fileItemService.updateFileId(fileItem);
		
		banner.setFileId(file.getFileId());
		insert(banner);
	}

	@Override
	public void update(Banner banner, Long itemId) {
		if(itemId != null) { //첨부파일 교체 시
			fileService.deleteFileItem(banner.getFileId());
			
			FileItem fileItem = new FileItem();
			fileItem.setFileId(banner.getFileId());
			fileItem.setItemId(itemId);
			fileItemService.updateFileId(fileItem);
		}
		
		update(banner);
	}
}
