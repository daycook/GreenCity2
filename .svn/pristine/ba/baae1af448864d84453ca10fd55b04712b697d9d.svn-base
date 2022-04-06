package net.jcms.conts.popup.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.jcms.conts.popup.mapper.PopupMapper;
import net.jcms.conts.popup.model.Popup;
import net.jcms.conts.popup.model.PopupSearch;
import net.jcms.conts.popup.service.PopupService;
import net.jcms.framework.base.service.impl.BaseServiceImpl;
import net.jcms.framework.file.model.FileInfo;
import net.jcms.framework.file.model.FileItem;
import net.jcms.framework.file.service.FileItemService;
import net.jcms.framework.file.service.FileService;

@Service(value="popupService")
public class PopupServiceImpl extends BaseServiceImpl<Popup, PopupSearch, PopupMapper> implements PopupService {

	@Resource (name="fileItemService")
	private FileItemService fileItemService;
	
	@Resource (name="fileService")
	private FileService fileService;
	
	@Override
	@Resource (name="popupMapper")
	protected void setMapper (PopupMapper mapper) {
		super.setMapper (mapper);
	}

	@Override
	public void insert(Popup popup, Long itemId) {
		FileInfo file = new FileInfo();
		fileService.insert(file);
		
		FileItem fileItem = new FileItem();
		fileItem.setFileId(file.getFileId());
		fileItem.setItemId(itemId);
		fileItemService.updateFileId(fileItem);
		
		popup.setFileId(file.getFileId());
		insert(popup);
	}

	@Override
	public void update(Popup popup, Long itemId) {
		if(itemId != null) { //첨부파일 교체 시
			fileService.deleteFileItem(popup.getFileId());
			
			FileItem fileItem = new FileItem();
			fileItem.setFileId(popup.getFileId());
			fileItem.setItemId(itemId);
			fileItemService.updateFileId(fileItem);
		}
		
		update(popup);
	}

}
