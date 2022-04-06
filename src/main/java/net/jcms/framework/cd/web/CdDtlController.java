package net.jcms.framework.cd.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.jcms.framework.base.web.BaseController;
import net.jcms.framework.cd.model.CdDtl;
import net.jcms.framework.cd.service.CdDtlService;
import net.jcms.framework.util.StrUtil;

/**
 * 상세코드 관리 Controller
 * 
 * @author machineguy
 *
 */
@Controller
public class CdDtlController extends BaseController{
	
	@Resource (name="cdDtlService")
	private CdDtlService cdDtlService;
	
	
	/**
	 * 상세 코드 목록을 json 으로 반환
	 * @param request
	 * @param cdDtl
	 * @return
	 */
	@RequestMapping(value="/system/cdDtl/list.json")
	@ResponseBody
	public Map<String, Object> list(HttpServletRequest request, CdDtl cdDtl){
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			String sort = request.getParameter("columns[" + request.getParameter("order[0][column]") + "][name]" );
			String sortOder = request.getParameter("order[0][dir]");
			cdDtl.setSort(sort);
			cdDtl.setSortOrd(sortOder);
			cdDtl.setPagingYn(true);
			
			String useSt = request.getParameter("search[value]");
			if(useSt.equals("사용")){
				cdDtl.setUseSt("Y");
			}else if(useSt.equals("사용안함")){
				cdDtl.setUseSt("N");
			}
			
			if(StrUtil.isEmpty(cdDtl.getCdId())) {
				result.put("recordsTotal", 0);
				result.put("recordsFiltered", 0);
				result.put("data", "");
			} else {
				int totalCount = cdDtlService.count(cdDtl);
				result.put("recordsTotal", totalCount);
				result.put("recordsFiltered", totalCount);
				result.put("data", cdDtlService.selectList(cdDtl));
			}
			result.put("result", "success");
		} catch (Exception e){
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	/**
	 * 상세코드 등록
	 * 
	 * @param request
	 * @param cdDtl
	 * @return
	 */
	@RequestMapping(value="/system/cdDtl/insert.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insert(HttpServletRequest request, CdDtl cdDtl) {
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			if(cdDtlService.existCount(cdDtl) > 0) {//코드분류아이디 또는 코드분류이름이 중복된 경우
				result.put("result", "duplicate");
				result.put("message", "이미 등록된 코드 입니다. 다시 등록하여 주십시오.");
			} else {
				cdDtl.setRegId(getUserId());
				cdDtlService.insert(cdDtl);
				
				//cdDtlService.initJson();
				result.put("result", "success");
			}
		} catch (Exception e){
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	
	/**
	 * 상세코드 수정
	 * @param request
	 * @param cdDtl
	 * @return
	 */
	@RequestMapping(value="/system/cdDtl/update.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> update(HttpServletRequest request, CdDtl cdDtl) {
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			cdDtl.setUpdId(getUserId());
			cdDtlService.update(cdDtl);
			
			//cdDtlService.initJson();
			result.put("result", "success");
		} catch (Exception e){
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	
	/**
	 * 상세코드 삭제
	 * @param request
	 * @param cdDtl
	 * @return
	 */
	@RequestMapping(value="/system/cdDtl/delete.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delete(HttpServletRequest request, CdDtl cdDtl) {
		Map<String, Object> result = new HashMap<String, Object>();
		try{
			cdDtl.setDelId(getUserId());
			cdDtlService.delete(cdDtl);
			
			//cdDtlService.initJson();
			result.put("result", "success");
		} catch (Exception e){
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
}
