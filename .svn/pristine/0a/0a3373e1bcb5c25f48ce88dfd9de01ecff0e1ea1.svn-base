package net.jcms.conts.bod.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.jcms.conts.bod.mapper.BodCmntMapper;
import net.jcms.conts.bod.model.BodCmnt;
import net.jcms.conts.bod.model.BodCmntSearch;
import net.jcms.conts.bod.service.BodCmntService;
import net.jcms.framework.base.service.impl.BaseServiceImpl;
import net.jcms.framework.security.model.UserSearch;
import net.jcms.framework.security.service.UserService;

@Service(value="bodCmntService")
public class BodCmntServiceImpl extends BaseServiceImpl<BodCmnt, BodCmntSearch, BodCmntMapper> implements BodCmntService {

	@Resource (name="userService")
	private UserService userService;
	
	@Override
	@Resource (name="bodCmntMapper")
	protected void setMapper (BodCmntMapper mapper) {
		super.setMapper (mapper);
	}

	@Override
	public List<BodCmnt> selectList(BodCmntSearch s) {
		List<BodCmnt> result = new ArrayList<BodCmnt>();
		
		UserSearch userSearch;
		List<BodCmnt> bodCmntList = super.selectList(s);  
		for(BodCmnt bodCmnt : bodCmntList) {
			userSearch = new UserSearch();
			userSearch.setUserId(bodCmnt.getRegId());
			bodCmnt.setUser(userService.select(userSearch));
			result.add(bodCmnt);
		}
		return result;
	}

	@Override
	public BodCmnt select(BodCmntSearch s) {
		BodCmnt bodCmnt = super.select(s);
		UserSearch userSearch = new UserSearch();
		userSearch.setUserId(bodCmnt.getRegId());
		bodCmnt.setUser(userService.select(userSearch));
		return bodCmnt;
	}

	@Override
	public void insert(BodCmnt bodCmnt) {
		super.insert(bodCmnt);
		if(bodCmnt.getCmntGrp() == null) {
			bodCmnt.setCmntGrp(bodCmnt.getCmntId());
			mapper.updateCmntGrp(bodCmnt);
		}
	}

	@Override
	public boolean isAuthUpdate(Long cmntId, Long userId) {
		if(userId != null) {
			BodCmntSearch bodCmntSearch = new BodCmntSearch();
			bodCmntSearch.setCmntId(cmntId);
			BodCmnt bodCmnt = select(bodCmntSearch);
			return isAuthUpdate(bodCmnt, userId);
		}
		return false;
	}

	@Override
	public boolean isAuthUpdate(BodCmnt bodCmnt, Long userId) {
		if(userId != null) {
			if(bodCmnt.getRegId().compareTo(userId) == 0) {
				return true;
			}
		}
		return false;
	}

}
