package net.jcms.front.front.service;

import net.jcms.framework.base.service.BaseService;
import net.jcms.front.front.model.Front;
import net.jcms.front.front.model.FrontSearch;

public interface FrontService extends BaseService<Front, FrontSearch> {

	int testData(FrontSearch frontSearch);
	
}
