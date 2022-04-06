package net.jcms.conts.popup.web;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.jcms.conts.popup.model.Popup;
import net.jcms.conts.popup.model.PopupSearch;
import net.jcms.conts.popup.service.PopupService;
import net.jcms.framework.base.web.BaseController;
import net.jcms.framework.file.service.FileService;

@Controller
public class PopupController extends BaseController {
	
	@Value("#{prop['AppConf.filePath.popup']}") 
	private String filePath;
	 
	@Resource (name="fileService")
	private FileService fileService;
	
	@Resource (name="popupService")
	private PopupService popupService;
	
	@RequestMapping (value="/system/popup/list.mng", method=RequestMethod.GET)
	public String list() {
		return "system/popup/list";
	}
	
	@RequestMapping (value="/system/popup/list.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> list(HttpServletRequest request, PopupSearch popupSearch) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			String sort = request.getParameter("columns[" + request.getParameter("order[0][column]") + "][name]");
			String sortOder = request.getParameter("order[0][dir]");
			popupSearch.setSort(sort);
			popupSearch.setSortOrd(sortOder);
			popupSearch.setPagingYn(true);
			
			int totalCount = popupService.count(popupSearch);
			result.put("recordsTotal", totalCount);
			result.put("recordsFiltered", totalCount);
			
			result.put("data", popupService.selectList(popupSearch));
			
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/system/popup/view.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> detail(HttpServletRequest request, PopupSearch popupSearch) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			result.put("data", popupService.select(popupSearch));
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/system/popup/insert.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insert(HttpServletRequest request, Popup popup, Long itemId) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			popup.setRegId(getUserId());
			popupService.insert(popup, itemId);
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/system/popup/update.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> update(HttpServletRequest request, Popup popup, Long itemId) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			popup.setUpdId(getUserId());
			popupService.update(popup, itemId);
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/system/popup/delete.json", method=RequestMethod.POST) 
	@ResponseBody
	public Map<String, String> delete (Popup popup) {
		Map<String, String> result = new HashMap <String, String> ();
		try {
			popup.setDelId(getUserId());
			popupService.delete(popup);
			result.put("result", "success");
		} catch (Exception e){
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
}
