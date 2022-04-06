package net.jcms.conts.lang.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import net.jcms.conts.lang.model.Lang;
import net.jcms.conts.lang.model.LangSearch;
import net.jcms.framework.base.mapper.BaseMapper;

@Mapper (value="langMapper")
public interface LangMapper extends BaseMapper<Lang, LangSearch> {
	int checkIdDuplicate(Lang lang);
}
