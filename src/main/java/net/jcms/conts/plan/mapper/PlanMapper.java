package net.jcms.conts.plan.mapper;

import net.jcms.conts.plan.model.Plan;
import net.jcms.conts.plan.model.PlanSearch;
import net.jcms.framework.base.mapper.BaseMapper;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper (value="planMapper")
public interface PlanMapper extends BaseMapper<Plan, PlanSearch>{

}
