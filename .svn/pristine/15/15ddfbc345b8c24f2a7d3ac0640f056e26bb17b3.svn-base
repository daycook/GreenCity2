package net.jcms.conts.cont.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.jcms.conts.cont.mapper.ContItemMapper;
import net.jcms.conts.cont.model.ContItem;
import net.jcms.conts.cont.model.ContItemSearch;
import net.jcms.conts.cont.service.ContItemService;
import net.jcms.framework.base.service.impl.BaseServiceImpl;

@Service(value="contItemService")
public class ContItemServiceImpl extends BaseServiceImpl<ContItem, ContItemSearch, ContItemMapper> implements ContItemService {

	@Override
	@Resource (name="contItemMapper")
	protected void setMapper (ContItemMapper mapper) {
		super.setMapper (mapper);
	}

	@Override
	public ContItem selectLast(ContItemSearch contItemSearch) {
		contItemSearch.setSort("REG_DT");
		contItemSearch.setSortOrd("DESC");
		List<ContItem> contItemList = super.selectList(contItemSearch);
		if(contItemList.size() > 0) {
			return contItemList.get(0);
		}else {
			return null;
		}
	}


}
