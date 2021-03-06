package net.jcms.front.common.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.jcms.framework.base.service.BaseService;
import net.jcms.front.common.model.Common;
import net.jcms.front.common.model.CommonSearch;

public interface CommonService extends BaseService<Common, CommonSearch> {
	String excelDown(HttpServletRequest request, HttpServletResponse response, List<Map<String,Object>> dataList, String[] title, String[] cont);
	void download(HttpServletResponse response, String fileName, String fileDownName);
	void imgdownload(HttpServletResponse response, String string, String downFileName);
	void insertGwDataOrg();
	List<Map<String, Object>> getCodeList(Map<String, Object> paramMap);
}
