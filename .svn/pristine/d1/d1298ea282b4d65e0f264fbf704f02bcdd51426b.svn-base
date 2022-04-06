package net.jcms.front.front.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.jcms.framework.base.service.impl.BaseServiceImpl;
import net.jcms.front.front.mapper.FrontMapper;
import net.jcms.front.front.model.Front;
import net.jcms.front.front.model.FrontSearch;
import net.jcms.front.front.service.FrontService;
import net.jcms.front.siteChckManage.service.SiteChckManageService;

@Service(value="frontService")
public class FrontServiceImpl extends BaseServiceImpl<Front, FrontSearch, FrontMapper> implements FrontService {

	@Resource (name="frontMapper")
	private FrontMapper frontMapper;
	
	@Override
	@Resource (name="frontMapper")
	protected void setMapper (FrontMapper mapper) {
		super.setMapper (mapper);
	}
	@Override
	public int testData(FrontSearch frontSearch) {
		return frontMapper.testData(frontSearch);
	}
	
}
