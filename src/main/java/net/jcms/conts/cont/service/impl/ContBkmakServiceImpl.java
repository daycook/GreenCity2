package net.jcms.conts.cont.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.jcms.conts.cont.mapper.ContBkmakMapper;
import net.jcms.conts.cont.model.ContBkmak;
import net.jcms.conts.cont.model.ContBkmakSearch;
import net.jcms.conts.cont.service.ContBkmakService;
import net.jcms.framework.base.service.impl.BaseServiceImpl;

@Service(value="contBkmakService")
public class ContBkmakServiceImpl extends BaseServiceImpl<ContBkmak, ContBkmakSearch, ContBkmakMapper> implements ContBkmakService {

	@Override
	@Resource (name="contBkmakMapper")
	protected void setMapper (ContBkmakMapper mapper) {
		super.setMapper (mapper);
	}

}
