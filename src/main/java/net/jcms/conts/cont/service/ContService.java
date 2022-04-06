package net.jcms.conts.cont.service;

import java.util.List;
import java.util.Map;

import net.jcms.conts.cont.model.Cont;
import net.jcms.conts.cont.model.ContItem;
import net.jcms.conts.cont.model.ContItemHist;
import net.jcms.conts.cont.model.ContSearch;
import net.jcms.framework.base.service.BaseService;

public interface ContService extends BaseService<Cont, ContSearch> {
	
	Cont select(ContSearch contSearch, Long langId);
	
	void insert (Cont cont, List<ContItem> contItemList, List<ContItemHist> contItemHistList);
	
	void update (Cont cont, List<ContItem> contItemList, List<ContItemHist> contItemHistList);
	
	List<Map<String, Object>> dynamic(ContSearch contSearch);
}
