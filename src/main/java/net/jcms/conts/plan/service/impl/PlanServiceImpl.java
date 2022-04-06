package net.jcms.conts.plan.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.jcms.conts.plan.mapper.PlanMapper;
import net.jcms.conts.plan.model.Plan;
import net.jcms.conts.plan.model.PlanSearch;
import net.jcms.conts.plan.service.PlanService;
import net.jcms.framework.base.service.impl.BaseServiceImpl;

@Service(value="planService")
public class PlanServiceImpl extends BaseServiceImpl<Plan, PlanSearch, PlanMapper> implements PlanService {

	
	@Override
	@Resource (name="planMapper")
	protected void setMapper (PlanMapper mapper) {
		super.setMapper(mapper);
	}
}
