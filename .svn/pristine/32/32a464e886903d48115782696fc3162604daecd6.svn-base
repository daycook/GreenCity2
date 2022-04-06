package net.jcms.conts.bod.mapper;

import java.util.List;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import net.jcms.conts.bod.model.BodArti;
import net.jcms.conts.bod.model.BodArtiSearch;
import net.jcms.framework.base.mapper.BaseMapper;

@Mapper (value="bodArtiMapper")
public interface BodArtiMapper extends BaseMapper<BodArti, BodArtiSearch> {

	void updateHit(Long artiId);

	void updateArtiGrp(BodArti bodArti);

	List selectRecList();
	
}
