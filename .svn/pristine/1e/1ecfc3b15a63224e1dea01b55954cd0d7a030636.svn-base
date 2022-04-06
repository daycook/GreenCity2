package net.jcms.conts.cont.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.jcms.conts.cont.mapper.ContItemHistMapper;
import net.jcms.conts.cont.model.ContItemHist;
import net.jcms.conts.cont.model.ContItemHistSearch;
import net.jcms.conts.cont.service.ContItemHistService;
import net.jcms.framework.base.service.impl.BaseServiceImpl;
import net.jcms.framework.security.model.UserSearch;
import net.jcms.framework.security.service.UserService;

@Service(value="contItemHistService")
public class ContItemHistServiceImpl extends BaseServiceImpl<ContItemHist, ContItemHistSearch, ContItemHistMapper> implements ContItemHistService {

	@Resource (name="userService")
	private UserService userService;
	
	@Override
	@Resource (name="contItemHistMapper")
	protected void setMapper (ContItemHistMapper mapper) {
		super.setMapper (mapper);
	}

	@Override
	public List<ContItemHist> selectList(ContItemHistSearch contItemHistSearch) {
		List<ContItemHist> result = new ArrayList<ContItemHist>();
		List<ContItemHist> contItemHistList = super.selectList(contItemHistSearch);
		UserSearch userSearch;
		for(ContItemHist contItemHist : contItemHistList) {
			userSearch = new UserSearch();
			userSearch.setUserId(contItemHist.getRegId());
			contItemHist.setUser(userService.select(userSearch));
			result.add(contItemHist);
		}
		return result;
	}
}
