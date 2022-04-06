package net.jcms.conts.bod.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.jcms.conts.bod.mapper.BodArtiMapper;
import net.jcms.conts.bod.model.Bod;
import net.jcms.conts.bod.model.BodArti;
import net.jcms.conts.bod.model.BodArtiSearch;
import net.jcms.conts.bod.service.BodArtiService;
import net.jcms.conts.bod.service.BodService;
import net.jcms.framework.base.service.impl.BaseServiceImpl;
import net.jcms.framework.file.model.FileInfo;
import net.jcms.framework.file.model.FileItem;
import net.jcms.framework.file.service.FileItemService;
import net.jcms.framework.file.service.FileService;
import net.jcms.framework.security.model.UserRole;
import net.jcms.framework.security.model.UserSearch;
import net.jcms.framework.security.service.UserRoleService;
import net.jcms.framework.security.service.UserService;

@Service(value="bodArtiService")
public class BodArtiServiceImpl extends BaseServiceImpl<BodArti, BodArtiSearch, BodArtiMapper> implements BodArtiService {

	@Resource (name="userService")
	private UserService userService;
	
	@Resource (name="userRoleService")
	private UserRoleService userRoleService;
	
	@Resource (name="bodService")
	private BodService bodService;
	
	@Resource (name="fileItemService")
	private FileItemService fileItemService;
	
	@Resource (name="fileService")
	private FileService fileService;
	
	@Override
	@Resource (name="bodArtiMapper")
	protected void setMapper (BodArtiMapper mapper) {
		super.setMapper (mapper);
	}
	
	@Override
	public BodArti select(BodArtiSearch bodArtiSearch) {
		BodArti bodArti = super.select(bodArtiSearch);
		
		UserSearch userSearch;
		List<Bod> bodList = bodService.selectJson();
		for(Bod bod : bodList) {
			if(bodArti.getBodId().equals(bod.getBodId())) {
				bodArti.setBod(bod);
				break;
			}
		}
		userSearch = new UserSearch();
		userSearch.setUserId(bodArti.getRegId());
		bodArti.setUser(userService.select(userSearch));
		return bodArti;
	}

	@Override
	public List<BodArti> selectList(BodArtiSearch bodArtiSearch) {
		List<BodArti> result = new ArrayList<BodArti>();
		List<BodArti> bodArtiList = super.selectList(bodArtiSearch);
		
		UserSearch userSearch;
		List<Bod> bodList = bodService.selectJson();
		for(BodArti bodArti : bodArtiList) {
			for(Bod bod : bodList) {
				if(bodArti.getBodId().equals(bod.getBodId())) {
					bodArti.setBod(bod);
					break;
				}
			}
			userSearch = new UserSearch();
			userSearch.setUserId(bodArti.getRegId());
			bodArti.setUser(userService.select(userSearch));
			
			result.add(bodArti);
		}
		return result;
	}


	@Override
	public void updateHit(Long artiId) {
		mapper.updateHit(artiId);
	}

	

	@Override
	public void insert(BodArti bodArti) {
		super.insert(bodArti);
	}

	@Override
	public void insert(BodArti bodArti, Long[] itemIdList) {
		FileInfo file = new FileInfo();
		fileService.insert(file);
		
		FileItem fileItem;
		for(Long itemId : itemIdList) {
			fileItem = new FileItem();
			fileItem.setFileId(file.getFileId());
			fileItem.setItemId(itemId);
			fileItemService.updateFileId(fileItem);
		}
		
		bodArti.setFileId(file.getFileId());
		insert(bodArti);
	}


	@Override
	public void update(BodArti bodArti, Long[] itemIdList) {
		for(Long itemId : itemIdList) {
			FileItem fileItem = new FileItem();
			fileItem.setFileId(bodArti.getFileId());
			fileItem.setItemId(itemId);
			fileItemService.updateFileId(fileItem);
		}
		
		update(bodArti);
	}


	@Override
	public void insert(BodArti bodArti, Long itemId) {
		FileInfo file = new FileInfo();
		fileService.insert(file);
		
		FileItem fileItem = new FileItem();
		fileItem.setFileId(file.getFileId());
		fileItem.setItemId(itemId);
		fileItemService.updateFileId(fileItem);
		
		bodArti.setFileId(file.getFileId());
		insert(bodArti);
	}


	@Override
	public void update(BodArti bodArti, Long itemId) {
		if(itemId != null) { //첨부파일 교체 시
			fileService.deleteFileItem(bodArti.getFileId());
			
			FileItem fileItem = new FileItem();
			fileItem.setFileId(bodArti.getFileId());
			fileItem.setItemId(itemId);
			fileItemService.updateFileId(fileItem);
		}
		
		update(bodArti);
	}

	/**
	 * 비밀글 보기 권한이 있는지 조회한다.
	 */
	@Override
	public boolean isAuthScrt(Long artiId, Long userId) {
		if(userId != null) {
			BodArtiSearch bodArtiSearch = new BodArtiSearch();
			bodArtiSearch.setArtiId(artiId);
			BodArti bodArti = select(bodArtiSearch);
			if(bodArti.getRegId().compareTo(userId) == 0) {
				return true;
			}else {
				Bod bod = bodArti.getBod();
				List<String> scrtRoleList = bod.getScrtRoleList();
				if(scrtRoleList.size() > 0) {
					List<String> roleList = new ArrayList<String>();
					UserRole userRoleSearch = new UserRole();
					userRoleSearch.setUserId(userId);
					List<UserRole> userRoleList = userRoleService.selectList(userRoleSearch);
					for(UserRole userRole : userRoleList) {
						roleList.add(userRole.getRoleAuth());
					}
					for(String role : roleList) {
						if(scrtRoleList.contains(role)) {
							return true; 
						}
					}
				}
			}
		}
		return false;
	}

	/**
	 * 수정권한이 있는지 조회한다.
	 */
	@Override
	public boolean isAuthUpdate(Long artiId, Long userId) {
		if(userId != null) {
			BodArtiSearch bodArtiSearch = new BodArtiSearch();
			bodArtiSearch.setArtiId(artiId);
			BodArti bodArti = select(bodArtiSearch);
			return isAuthUpdate(bodArti, userId);
		}
		return false;
	}
	@Override
	public boolean isAuthUpdate(BodArti bodArti, Long userId) {
		if(userId != null) {
			if(bodArti.getRegId().compareTo(userId) == 0) {
				return true;
			}
		}
		return false;
	}

	@Override
	public List selectRecList() {
		return mapper.selectRecList();
	}
}
