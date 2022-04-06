package net.jcms.framework.pgm.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import net.jcms.framework.base.service.impl.BaseServiceImpl;
import net.jcms.framework.pgm.mapper.PgmMapper;
import net.jcms.framework.pgm.model.Pgm;
import net.jcms.framework.pgm.model.PgmSearch;
import net.jcms.framework.pgm.service.PgmService;
import net.jcms.framework.util.FileUtil;
import net.jcms.framework.util.PropertiesUtil;

@Service(value="pgmService")
public class PgmServiceImpl extends BaseServiceImpl<Pgm, PgmSearch, PgmMapper> implements PgmService {

	@Override
	@Resource (name="pgmMapper")
	protected void setMapper (PgmMapper mapper) {
		super.setMapper (mapper);
	}	
}
