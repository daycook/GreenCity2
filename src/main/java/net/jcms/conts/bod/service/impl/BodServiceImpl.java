package net.jcms.conts.bod.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.jcms.conts.bod.mapper.BodMapper;
import net.jcms.conts.bod.model.Bod;
import net.jcms.conts.bod.model.BodRole;
import net.jcms.conts.bod.model.BodSearch;
import net.jcms.conts.bod.service.BodRoleService;
import net.jcms.conts.bod.service.BodService;
import net.jcms.framework.base.service.impl.BaseServiceImpl;
import net.jcms.framework.cd.model.CdDtl;
import net.jcms.framework.security.model.Role;
import net.jcms.framework.security.model.UserRole;
import net.jcms.framework.security.service.UserRoleService;
import net.jcms.framework.util.ApplicationHelper;
import net.jcms.framework.util.CdUtil;
import net.jcms.framework.util.Constants;

@Service(value="bodService")
public class BodServiceImpl extends BaseServiceImpl<Bod, BodSearch, BodMapper> implements BodService {

	@Resource (name="bodRoleService")
	private BodRoleService bodRoleService;
	
	@Resource (name="userRoleService")
	private UserRoleService userRoleService;
	
	@Override
	@Resource (name="bodMapper")
	protected void setMapper (BodMapper mapper) {
		super.setMapper (mapper);
	}
	
	@Override
	public Bod select(BodSearch bodSearch) {
		Bod bod = super.select(bodSearch);
		
		List<CdDtl> cdDtlList = CdUtil.cdDtlList("board");
		for(CdDtl cdDtl : cdDtlList) {
			if(cdDtl.getCdDtlId().equals(bod.getBodTp())) {
				bod.setBodTpCd(cdDtl);
				break;
			}
		}
		
		BodRole bodRoleSearch = new BodRole();
		bodRoleSearch.setBodId(bodSearch.getBodId());
		List<BodRole> bodRoleList = bodRoleService.selectList(bodRoleSearch);
	
		List<String> notiRoleList = new ArrayList<String>();
		List<String> writeRoleList = new ArrayList<String>();
		List<String> scrtRoleList = new ArrayList<String>();
		List<String> answRoleList = new ArrayList<String>();
		for(BodRole bodRole : bodRoleList) {
			if(Constants.BOD_ROLE_TYPE_NOTI.equals(bodRole.getAuthTp())) notiRoleList.add(bodRole.getRoleAuth());
			if(Constants.BOD_ROLE_TYPE_WRITE.equals(bodRole.getAuthTp())) writeRoleList.add(bodRole.getRoleAuth());
			if(Constants.BOD_ROLE_TYPE_SCRT.equals(bodRole.getAuthTp())) scrtRoleList.add(bodRole.getRoleAuth());
			if(Constants.BOD_ROLE_TYPE_ANSW.equals(bodRole.getAuthTp())) answRoleList.add(bodRole.getRoleAuth());
		}
		
		bod.setNotiRoleList(notiRoleList);
		bod.setWriteRoleList(writeRoleList);
		bod.setScrtRoleList(scrtRoleList);
		bod.setAnswRoleList(answRoleList);
		
		return bod;
	}

	@Override
	public List<Bod> selectList(BodSearch bodSearch) {
		List<String> writeRoleList,scrtRoleList,answRoleList;
		
		BodRole bodRoleSearch;
		List<BodRole> bodRoleList;

		List<CdDtl> cdDtlList = CdUtil.cdDtlList("board");
		List<Bod> resultList = new ArrayList<Bod>();
		List<Bod> bodList = super.selectList(bodSearch);
		for(Bod bod : bodList) {
			bodRoleSearch = new BodRole();
			bodRoleSearch.setBodId(bod.getBodId());
			bodRoleList = bodRoleService.selectList(bodRoleSearch);
		
			List<String> notiRoleList = new ArrayList<String>();
			writeRoleList = new ArrayList<String>();
			scrtRoleList = new ArrayList<String>();
			answRoleList = new ArrayList<String>();
			for(BodRole bodRole : bodRoleList) {
				if(Constants.BOD_ROLE_TYPE_NOTI.equals(bodRole.getAuthTp())) notiRoleList.add(bodRole.getRoleAuth());
				if(Constants.BOD_ROLE_TYPE_WRITE.equals(bodRole.getAuthTp())) writeRoleList.add(bodRole.getRoleAuth());
				if(Constants.BOD_ROLE_TYPE_SCRT.equals(bodRole.getAuthTp())) scrtRoleList.add(bodRole.getRoleAuth());
				if(Constants.BOD_ROLE_TYPE_ANSW.equals(bodRole.getAuthTp())) answRoleList.add(bodRole.getRoleAuth());
			}
			bod.setNotiRoleList(notiRoleList);
			bod.setWriteRoleList(writeRoleList);
			bod.setScrtRoleList(scrtRoleList);
			bod.setAnswRoleList(answRoleList);

			for(CdDtl cdDtl : cdDtlList) {
				if(cdDtl.getCdDtlId().equals(bod.getBodTp())) {
					bod.setBodTpCd(cdDtl);
					break;
				}
			}
			
			resultList.add(bod);
		}
		
		return resultList;
	}

	@Override
	public void insert(Bod bod, String[] writeRole, String[] notiRole, String[] scrtRole, String[] answRole) {
		insert(bod);
		updateBodRole(bod.getBodId(), writeRole, notiRole, scrtRole, answRole);
	}

	@Override
	public void update(Bod bod, String[] writeRole, String[] notiRole, String[] scrtRole, String[] answRole) {
		update(bod);
		updateBodRole(bod.getBodId(), writeRole, notiRole, scrtRole, answRole);
	}
	
	public void updateBodRole(Long bodId, String[] writeRole, String[] notiRole, String[] scrtRole, String[] answRole) {
		BodRole bodRole = new BodRole();
		bodRole.setBodId(bodId);
		bodRoleService.delete(bodRole);

		if(writeRole != null) { //쓰기그룹
			for(String roleAuth : writeRole) {
				bodRole.setAuthTp(Constants.BOD_ROLE_TYPE_WRITE);
				bodRole.setRoleAuth(roleAuth);
				bodRoleService.insert(bodRole);
			}
		}
		if(notiRole != null) { //공지관리그룹
			for(String roleAuth : notiRole) {
				bodRole.setAuthTp(Constants.BOD_ROLE_TYPE_NOTI);
				bodRole.setRoleAuth(roleAuth);
				bodRoleService.insert(bodRole);
			}
		}
		if(scrtRole != null) { //비밀글관리그룹
			for(String roleAuth : scrtRole) {
				bodRole.setAuthTp(Constants.BOD_ROLE_TYPE_SCRT);
				bodRole.setRoleAuth(roleAuth);
				bodRoleService.insert(bodRole);
			}
		}
		if(answRole != null) { //답변관리 그룹
			for(String roleAuth : answRole) {
				bodRole.setAuthTp(Constants.BOD_ROLE_TYPE_ANSW);
				bodRole.setRoleAuth(roleAuth);
				bodRoleService.insert(bodRole);
			}
		}
	}

	@Override
	public List<Bod> selectJson() {
		if(ApplicationHelper.getBodList() == null) {
			initJson();
		}
		
		return ApplicationHelper.getBodList(); 
	}
	
	@Override
	public Bod selectJson(Long bodId) {
		List<Bod> bodList = selectJson();
		
		Bod bod = null;
		for(Bod bd : bodList) {
			if(bd.getBodId().compareTo(bodId) == 0) {
				bod = bd;
				break;
			}
		}
		return bod;
	}

	@Override
	public void initJson() {
		BodSearch bodSearch = new BodSearch();
		List<Bod> bodList = selectList(bodSearch);
		
		ApplicationHelper.setBodList(bodList);
	}

	/**
	 * 등록 권한이 있는지 체크한다.
	 */
	@Override
	public boolean isAuthInsert(Long bodId, Long userId) {
		if(userId != null) {
			Bod bod = selectJson(bodId);
			return isAuthInsert(bod, userId);
		}
		return false;
	}
	@Override
	public boolean isAuthInsert(Bod bod, Long userId) {
		if(userId != null) {
			List<String> writeRoleList = bod.getWriteRoleList();
//			if(writeRoleList.size() > 0) {
				List<String> roleList = new ArrayList<String>();
				UserRole userRoleSearch = new UserRole();
				userRoleSearch.setUserId(userId);
				List<UserRole> userRoleList = userRoleService.selectList(userRoleSearch);
				for(UserRole userRole : userRoleList) {
					roleList.add(userRole.getRoleAuth());
				}
				for(String role : roleList) {
					if(writeRoleList.contains(role)) {
						return true; 
					}
				}
//			}else {
//				return true;
//			}
		}
		return false;
	}

	/**
	 * 공지글 게시권한이 있는지 체크한다.
	 */
	@Override
	public boolean isAuthNoti(Long bodId, Long userId) {
		if(userId != null) {
			Bod bod = selectJson(bodId);
			return isAuthNoti(bod, userId);
		}
		return false;
	}
	
	@Override
	public boolean isAuthNoti(Bod bod, Long userId) {
		if(userId != null) {
			List<String> notiRoleList = bod.getNotiRoleList();
			if(notiRoleList.size() > 0) {
				List<String> roleList = new ArrayList<String>();
				UserRole userRoleSearch = new UserRole();
				userRoleSearch.setUserId(userId);
				List<UserRole> userRoleList = userRoleService.selectList(userRoleSearch);
				for(UserRole userRole : userRoleList) {
					roleList.add(userRole.getRoleAuth());
				}
				for(String role : roleList) {
					if(notiRoleList.contains(role)) {
						return true; 
					}
				}
			}
		}
		return false;
	}

	/**
	 * 답변 권한이 있는지 체크한다.
	 */
	@Override
	public boolean isAuthAnsw(Long bodId, Long userId) {
		if(userId != null) {
			Bod bod = selectJson(bodId);
			return isAuthAnsw(bod, userId);
		}
		return false;
	}
	
	@Override
	public boolean isAuthAnsw(Bod bod, Long userId) {
		if(userId != null && bod.getAnswYn() != null && bod.getAnswYn()) {
			List<String> answRoleList = bod.getAnswRoleList();
//			if(answRoleList.size() > 0) {
				List<String> roleList = new ArrayList<String>();
				UserRole userRoleSearch = new UserRole();
				userRoleSearch.setUserId(userId);
				List<UserRole> userRoleList = userRoleService.selectList(userRoleSearch);
				for(UserRole userRole : userRoleList) {
					roleList.add(userRole.getRoleAuth());
				}
				for(String role : roleList) {
					if(answRoleList.contains(role)) {
						return true; 
					}
				}
//			}else {
//				return true;
//			}
		}
		return false;
	}

	@Override
	public List<Role> selectRoleList(Role role) {
		return mapper.selectRoleList(role);
	}

}
