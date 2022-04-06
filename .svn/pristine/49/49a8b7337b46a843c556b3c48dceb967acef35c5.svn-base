package net.jcms.conts.cont.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import net.jcms.conts.cont.model.Cont;
import net.jcms.conts.cont.model.ContItem;
import net.jcms.conts.cont.model.ContItemHist;
import net.jcms.conts.cont.model.ContItemSearch;
import net.jcms.conts.cont.model.ContBkmak;
import net.jcms.conts.cont.model.ContSearch;
import net.jcms.conts.cont.service.ContItemService;
import net.jcms.conts.cont.service.ContBkmakService;
import net.jcms.conts.cont.service.ContService;
import net.jcms.conts.lang.model.Lang;
import net.jcms.conts.lang.model.LangSearch;
import net.jcms.conts.lang.service.LangService;
import net.jcms.framework.base.web.BaseController;

@Controller
public class ContController extends BaseController {
	
	@Resource (name="contService")
	private ContService contService;
	
	@Resource (name="contItemService")
	private ContItemService contItemService;
	
	@Resource (name="contBkmakService")
	private ContBkmakService contBkmakService;
	
	@Resource (name="langService")
	private LangService langService;
	
	@RequestMapping (value="/system/cont/list.mng", method=RequestMethod.GET)
	public String list(Model model, ContSearch contSearch) {
		List<Lang> langList = langService.selectList(new LangSearch());
		model.addAttribute("langList", langList);
		
		List<String> selectList = new ArrayList<String>();
		selectList.add("CONT_ID");
		selectList.add("CONT_NM");
		
		/* Mysql 
		selectList.add("(SELECT CASE WHEN COUNT(CONT_ID) > 0 THEN true ELSE false END FROM CMS_CONT_BKMAK WHERE CMS_CONT_BKMAK.CONT_ID = CMS_CONT.CONT_ID) AS BOOKMARK_YN");
		
		for(Lang lang : langList) {
			selectList.add("IFNULL((SELECT DATE_FORMAT(B.REG_DT,'%Y-%m-%d %H:%i') FROM CMS_CONT_ITEM B WHERE CMS_CONT.CONT_ID = B.CONT_ID AND B.LANG_ID = '"+lang.getLangId()+"'),'') AS ID_"+lang.getLangId());
		}
		*/
		
		/* Oracle */
		selectList.add("(SELECT CASE WHEN COUNT(CONT_ID) > 0 THEN 1 ELSE 0 END FROM JCMS_CONT_BKMAK WHERE JCMS_CONT_BKMAK.CONT_ID = JCMS_CONT.CONT_ID) AS BOOKMARK_YN");
		
		for(Lang lang : langList) {
			//selectList.add("NVL((SELECT TO_CHAR(B.REG_DT,'YYYY-MM-DD HH24:MI') FROM CMS_CONT_ITEM B WHERE CMS_CONT.CONT_ID = B.CONT_ID AND B.LANG_ID = '"+lang.getLangId()+"'),'') AS ID_"+lang.getLangId());
			selectList.add("NVL((SELECT TO_CHAR(B.REG_DT,'YYYY-MM-DD HH24:MI') FROM JCMS_CONT_ITEM B WHERE JCMS_CONT.CONT_ID = B.CONT_ID AND B.LANG_ID = '"+lang.getLangId()+"'),'') AS ID_"+lang.getLangId());
		}
		
		contSearch.setSelectList(selectList);
		
		model.addAttribute("diffList", contService.dynamic(contSearch));
		return "system/cont/list";
	}
	
	@RequestMapping (value="/system/cont/view.mng", method=RequestMethod.GET)
	public String view(Model model, ContSearch contSearch) {
		Cont cont = contService.select(contSearch);
		model.addAttribute("cont", cont);
		
		ContItemSearch contItemSearch = new ContItemSearch();
		contItemSearch.setContId(cont.getContId());
		contItemSearch.setSort("REG_DT");
		contItemSearch.setSortOrd("ASC");
		model.addAttribute("contItemList", contItemService.selectList(contItemSearch));
		model.addAttribute("emptyContItem", new ContItem());
		
		LangSearch langSearch = new LangSearch();
		List<Lang> langList = langService.selectList(langSearch);
		
		List<Lang> basicList = new ArrayList<Lang>();
		List<Lang> etcList = new ArrayList<Lang>();
		for(Lang lang : langList) {
			if(lang.getBasicYn()) basicList.add(lang);
			else etcList.add(lang);
		}
		model.addAttribute("langList", langList);
		model.addAttribute("basicList", basicList);
		model.addAttribute("etcList", etcList);
		return "system/cont/view";
	}
	
	@RequestMapping (value="/system/cont/insert.mng", method=RequestMethod.GET)
	public String insert(Model model) {
		LangSearch langSearch = new LangSearch();
		List<Lang> langList = langService.selectList(langSearch);
		
		List<Lang> basicList = new ArrayList<Lang>();
		List<Lang> etcList = new ArrayList<Lang>();
		for(Lang lang : langList) {
			if(lang.getBasicYn()) basicList.add(lang);
			else etcList.add(lang);
		}
		model.addAttribute("langList", langList);
		model.addAttribute("basicList", basicList);
		model.addAttribute("etcList", etcList);
		return "system/cont/insert";
	}
	
	@RequestMapping (value="/system/cont/insert.mng", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insert(HttpServletRequest request, Cont cont) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			String[] langIdList = request.getParameterValues("langIdList[]");
			String[] contItemNmList = request.getParameterValues("contItemNmList[]");
			String[] contItemContList = request.getParameterValues("contItemContList[]");
			
			List<ContItem> contItemList = new ArrayList<ContItem>();
			List<ContItemHist> contItemHistList = new ArrayList<ContItemHist>();
			ContItem contItem;
			ContItemHist contItemHist;
			if(langIdList != null) {
				for(int i=0; i<langIdList.length; i++) {
					long langId = Long.parseLong(langIdList[i]);
					contItem = new ContItem();
					contItem.setRegId(getUserId());
					contItem.setUpdId(getUserId());
					contItem.setLangId(langId);
					contItem.setContItemNm(contItemNmList[i]);
					contItem.setCont(contItemContList[i]);
					contItemList.add(contItem);
										
					contItemHist = new ContItemHist();
					contItemHist.setRegId(getUserId());
					contItemHist.setLangId(langId);
					contItemHist.setContItemNm(contItemNmList[i]);
					contItemHist.setCont(contItemContList[i]);
					contItemHistList.add(contItemHist);
				}
				contService.insert(cont, contItemList, contItemHistList);
			}
			
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/system/cont/update.mng", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> update(HttpServletRequest request, Cont cont) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			String[] langIdList = request.getParameterValues("langIdList[]");
			String[] contItemNmList = request.getParameterValues("contItemNmList[]");
			String[] contItemContList = request.getParameterValues("contItemContList[]");
			
			List<ContItem> contItemList = new ArrayList<ContItem>();
			List<ContItemHist> contItemHistList = new ArrayList<ContItemHist>();
			ContItem contItem;
			ContItemHist contItemHist;
			if(langIdList != null) {
				for(int i=0; i<langIdList.length; i++) {
					long langId = Long.parseLong(langIdList[i]);
					contItem = new ContItem();
					contItem.setRegId(getUserId());
					contItem.setUpdId(getUserId());
					contItem.setLangId(langId);
					contItem.setContItemNm(contItemNmList[i]);
					contItem.setCont(contItemContList[i]);
					contItemList.add(contItem);
					
					contItemHist = new ContItemHist();
					contItemHist.setRegId(getUserId());
					contItemHist.setLangId(langId);
					contItemHist.setContItemNm(contItemNmList[i]);
					contItemHist.setCont(contItemContList[i]);
					contItemHistList.add(contItemHist);
				}
				contService.update(cont, contItemList, contItemHistList);
			}
			
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/system/cont/updateBkmak.mng", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateBookmark(HttpServletRequest request, ContBkmak contBkmak, boolean bookmarkYn) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			contBkmak.setUserId(getUserId());
			if(bookmarkYn) {
				contBkmakService.insert(contBkmak);
			}else {
				contBkmakService.delete(contBkmak);
			}
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
}
