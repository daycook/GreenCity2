package net.jcms.conts.lang.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import net.jcms.conts.lang.mapper.LangMapper;
import net.jcms.conts.lang.model.Lang;
import net.jcms.conts.lang.model.LangSearch;
import net.jcms.conts.lang.service.LangService;
import net.jcms.framework.base.service.impl.BaseServiceImpl;
import net.jcms.framework.cd.model.CdDtl;
import net.jcms.framework.cd.service.CdDtlService;
import net.jcms.framework.security.model.UserSearch;
import net.jcms.framework.util.FileUtil;
import net.jcms.framework.util.PropertiesUtil;

@Service(value="langService")
public class LangServiceImpl extends BaseServiceImpl<Lang, LangSearch, LangMapper> implements LangService {

	@Resource (name="cdDtlService")
	private CdDtlService cdDtlService;
	
	@Override
	@Resource (name="langMapper")
	protected void setMapper (LangMapper mapper) {
		super.setMapper (mapper);
	}
	
	
	@Override
	public Lang select(LangSearch s) {
		Lang lang = super.select(s);
		
		List<CdDtl> cdDtlList = cdDtlService.selectJson("lang");
		for(CdDtl cdDtl : cdDtlList) {
			if(cdDtl.getCdDtlId().equals(lang.getLangTp())) {
				lang.setLangTpCd(cdDtl);
				break;
			}
		}
		
		return lang;
	}

	@Override
	public List<Lang> selectList(LangSearch s) {
		List<Lang> result = new ArrayList<Lang>();
		List<Lang> langList = super.selectList(s);
		
		List<CdDtl> cdDtlList = cdDtlService.selectJson("lang");
		
		for(Lang lang : langList) {
			for(CdDtl cdDtl : cdDtlList) {
				if(cdDtl.getCdDtlId().equals(lang.getLangTp())) {
					lang.setLangTpCd(cdDtl);
					break;
				}
			}
			
			result.add(lang);
		}
		return result;
	}

	@Override
	public int checkIdDuplicate (Lang s) {
		return mapper.checkIdDuplicate (s);
	}
}
