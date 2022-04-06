package net.jcms.conts.bod.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.jcms.conts.bod.model.BodArti;
import net.jcms.conts.bod.model.BodArtiSearch;
import net.jcms.conts.bod.model.BodSearch;
import net.jcms.conts.bod.service.BodArtiService;
import net.jcms.conts.bod.service.BodService;
import net.jcms.framework.base.web.BaseController;

@Controller
public class BodArtiController extends BaseController {
	
	@Resource (name="bodArtiService")
	private BodArtiService bodArtiService;
	
	@Resource (name="bodService")
	private BodService bodService;
	
	@RequestMapping (value="/system/bodArti/list.mng", method=RequestMethod.GET)
	public String list(Model model, BodSearch bodSearch) {
		model.addAttribute("bodList", bodService.selectJson());
		return "system/bodArti/list";
	}
	
	@RequestMapping (value={"/public/bodArti/list.json","/system/bodArti/list.json"})
	@ResponseBody
	public Map<String, Object> list(HttpServletRequest request, BodArtiSearch bodArtiSearch, Boolean pagingYn) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			String sort = request.getParameter("columns[" + request.getParameter("order[0][column]") + "][name]");
			String sortOder = request.getParameter("order[0][dir]");
			bodArtiSearch.setSort(sort);
			bodArtiSearch.setSortOrd(sortOder);
			bodArtiSearch.setPagingYn(true);
			
			int totalCount = bodArtiService.count(bodArtiSearch);
			result.put("recordsTotal", totalCount);
			result.put("recordsFiltered", totalCount);
			result.put("data", bodArtiService.selectList(bodArtiSearch));
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/system/bodArti/recList.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> recList(HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			List selectRecList = bodArtiService.selectRecList();
			result.put("data", selectRecList);
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value={"/system/bodArti/view.json"})
	@ResponseBody
	public Map<String, Object> view(HttpServletRequest request, BodArtiSearch bodArtiSearch) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			result.put("data", bodArtiService.select(bodArtiSearch));
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	/**
	 * 답변 등록
	 */
	@RequestMapping (value={"/public/bodArti/multi/insertAnsw.json"}, method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertAnsw(HttpServletRequest request, BodArti bodArti, Long[] itemIdList) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			if(bodService.isAuthAnsw(bodArti.getBodId(), getUserId())) { //게시물 등록 권한이 존재하는지 확인
				bodArti.setRegId(getUserId());
				bodArtiService.insert(bodArti, itemIdList);
				
				result.put("result", "success");
			}else {
				result.put("result", "fail");
				result.put("message", "등록 권한이 없습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value={"/public/bodArti/multi/insert.json"}, method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insert(HttpServletRequest request, BodArti bodArti, Long[] itemIdList) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			
			bodArti.setRegId(getUserId());
			bodArtiService.insert(bodArti, itemIdList);
			result.put("fileId", bodArti.getFileId());
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value={"/public/bodArti/one/insert.json"}, method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insert(HttpServletRequest request, BodArti bodArti, Long itemId) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			bodArti.setRegId(getUserId());
			bodArtiService.insert(bodArti, itemId);
			
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value={"/public/bodArti/multi/update.json"}, method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> update(HttpServletRequest request, BodArti bodArti, Long[] itemIdList) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			bodArti.setUpdId(getUserId());
			bodArtiService.update(bodArti, itemIdList);
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value={"/public/bodArti/one/update.json"}, method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> update(HttpServletRequest request, BodArti bodArti, Long itemId) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			bodArti.setUpdId(getUserId());
			bodArtiService.update(bodArti, itemId);
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value={"/system/bodArti/delete.json"}, method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delete(HttpServletRequest request, BodArti bodArti) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			bodArti.setDelId(getUserId());
			bodArtiService.delete(bodArti);
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	/**
	 * 비밀글 조회권한이 있는지 체크한다.
	 */
	@RequestMapping (value={"/public/bodArti/isScrt.json"})
	@ResponseBody
	public Map<String, Object> isScrt(HttpServletRequest request, @RequestParam(required=true) Long artiId) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			if(bodArtiService.isAuthScrt(artiId, getUserId())) {
				result.put("result", "success");
			}else {
				result.put("result", "noAuth");
				result.put("message", "조회 권한이 없습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
}
