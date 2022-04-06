package net.jcms.conts.bod.service;

import java.util.List;

import net.jcms.conts.bod.model.BodArti;
import net.jcms.conts.bod.model.BodArtiSearch;
import net.jcms.framework.base.service.BaseService;

public interface BodArtiService extends BaseService<BodArti, BodArtiSearch> {
	
	void updateHit(Long artiId);

	void insert(BodArti bodArti, Long[] itemIdList);
	
	void update(BodArti bodArti, Long[] itemIdList);
	
	void insert(BodArti bodArti, Long itemId);
	
	void update(BodArti bodArti, Long itemId);
	
	boolean isAuthScrt(Long artiId, Long userId);
	
	boolean isAuthUpdate(Long artiId, Long userId);
	
	boolean isAuthUpdate(BodArti bodArti, Long userId);

	List selectRecList();
	
}
