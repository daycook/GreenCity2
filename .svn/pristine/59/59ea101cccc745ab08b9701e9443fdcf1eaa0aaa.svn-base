package net.jcms.conts.cont.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import net.jcms.conts.cont.mapper.ContMapper;
import net.jcms.conts.cont.model.Cont;
import net.jcms.conts.cont.model.ContItem;
import net.jcms.conts.cont.model.ContItemHist;
import net.jcms.conts.cont.model.ContItemSearch;
import net.jcms.conts.cont.model.ContSearch;
import net.jcms.conts.cont.service.ContItemHistService;
import net.jcms.conts.cont.service.ContItemService;
import net.jcms.conts.cont.service.ContService;
import net.jcms.framework.base.service.impl.BaseServiceImpl;

@Service(value="contService")
public class ContServiceImpl extends BaseServiceImpl<Cont, ContSearch, ContMapper> implements ContService {

	@Resource (name="contItemService")
	private ContItemService contItemService;
	
	@Resource (name="contItemHistService")
	private ContItemHistService contItemHistService;
	
	@Override
	@Resource (name="contMapper")
	protected void setMapper (ContMapper mapper) {
		super.setMapper (mapper);
	}

	@Override
	public Cont select(ContSearch contSearch, Long langId) {
		Cont cont = super.select(contSearch);
		
		ContItemSearch contItemSearch = new ContItemSearch();
		contItemSearch.setContId(cont.getContId());
		contItemSearch.setLangId(langId);
		cont.setContItem(contItemService.select(contItemSearch));
		
		return cont;
	}

	@Override
	public List<Map<String, Object>> dynamic(ContSearch contSearch) {
		return mapper.dynamic(contSearch);
	}

	@Override
	public void insert(Cont cont, List<ContItem> contItemList, List<ContItemHist> contItemHistList) {
		long contId = Long.parseLong(mapper.selectSerial());
		cont.setContId(contId);
		super.insert(cont);
		
		ContItemSearch contItemSearch;
		ContItem contItem2;
		for(ContItem contItem : contItemList) {
			contItem.setContId(contId);
			
			contItemSearch = new ContItemSearch();
			contItemSearch.setContId(contId);
			contItemSearch.setLangId(contItem.getLangId());
			contItem2 = contItemService.select(contItemSearch);
			if(contItem2 == null) {
				contItemService.insert(contItem);
			}else {
				contItem.setContItemId(contItem2.getContItemId());
				contItemService.update(contItem);
			}
		}
		
		for(ContItemHist contItemHist : contItemHistList) {
			contItemHist.setContId(contId);
			contItemHistService.insert(contItemHist);
		}
	}

	@Override
	public void update(Cont cont, List<ContItem> contItemList, List<ContItemHist> contItemHistList) {
		super.update(cont);
		
		ContItemSearch contItemSearch;
		ContItem contItem2;
		for(ContItem contItem : contItemList) {
			contItem.setContId(cont.getContId());
			
			contItemSearch = new ContItemSearch();
			contItemSearch.setContId(cont.getContId());
			contItemSearch.setLangId(contItem.getLangId());
			contItem2 = contItemService.select(contItemSearch);
			if(contItem2 == null) {
				contItemService.insert(contItem);
			}else {
				contItem.setContItemId(contItem2.getContItemId());
				contItemService.update(contItem);
			}
		}
		
		for(ContItemHist contItemHist : contItemHistList) {
			contItemHist.setContId(cont.getContId());
			contItemHistService.insert(contItemHist);
		}
	}

}
