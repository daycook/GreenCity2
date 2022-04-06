package net.jcms.conts.popup.mapper;

import egovframework.rte.psl.dataaccess.mapper.Mapper;
import net.jcms.conts.popup.model.Popup;
import net.jcms.conts.popup.model.PopupSearch;
import net.jcms.framework.base.mapper.BaseMapper;

@Mapper (value="popupMapper")
public interface PopupMapper extends BaseMapper<Popup, PopupSearch> {
	
}
