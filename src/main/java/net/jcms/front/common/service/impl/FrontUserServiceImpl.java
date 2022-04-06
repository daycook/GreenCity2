package net.jcms.front.common.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.jcms.framework.base.service.impl.BaseServiceImpl;
import net.jcms.front.common.mapper.FrontUserMapper;
import net.jcms.front.common.model.Common;
import net.jcms.front.common.model.CommonSearch;
import net.jcms.front.common.service.FrontUserService;

@Service(value="frontUserService")
public class FrontUserServiceImpl extends BaseServiceImpl<Common, CommonSearch, FrontUserMapper> implements FrontUserService{
	@Override
	@Resource (name="frontUserMapper")
	protected void setMapper (FrontUserMapper mapper) {
		super.setMapper (mapper);
	}

	@Override
	public void insertUserInfo(Map<String, Object> paramMap) {
		mapper.insertUserInfo(paramMap);
		mapper.insertUserRole(paramMap);
	}

	@Override
	public Map<String, Object> selectUserInfo(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return mapper.selectUserInfo(paramMap);
	}

	@Override
	public void changeUserPswd(Map<String, Object> paramMap) {
		mapper.changeUserPswd(paramMap);
	}
}
