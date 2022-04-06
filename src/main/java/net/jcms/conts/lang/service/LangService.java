package net.jcms.conts.lang.service;

import java.util.List;

import net.jcms.conts.lang.model.Lang;
import net.jcms.conts.lang.model.LangSearch;
import net.jcms.framework.base.service.BaseService;

public interface LangService extends BaseService<Lang, LangSearch> {

	/*List<Lang> selectJson();
	
	void initJson();*/
	int checkIdDuplicate(Lang lang);
	
}
