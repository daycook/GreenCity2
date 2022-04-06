package net.jcms.conts.bod.service;

import java.util.List;

import net.jcms.conts.bod.model.Bod;
import net.jcms.conts.bod.model.BodSearch;
import net.jcms.framework.base.service.BaseService;
import net.jcms.framework.security.model.Role;

public interface BodService extends BaseService<Bod, BodSearch> {

	void insert(Bod bod, String[] writeRole, String[] notiRole, String[] scrtRole, String[] answRole);
	void update(Bod bod, String[] writeRole, String[] notiRole, String[] scrtRole, String[] answRole);
	
	List<Bod> selectJson();
	Bod selectJson(Long bodId);
	void initJson();
	
	boolean isAuthInsert(Bod bod, Long userId);
	boolean isAuthInsert(Long bodId, Long userId);
	
	boolean isAuthNoti(Bod bod, Long userId);
	boolean isAuthNoti(Long bodId, Long userId);

	boolean isAuthAnsw(Bod bod, Long userId);
	boolean isAuthAnsw(Long bodId, Long userId);
	List<Role> selectRoleList(Role role);
}
