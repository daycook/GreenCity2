package net.jcms.main.web;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.support.RequestContextUtils;

import net.jcms.conts.banner.service.BannerService;
import net.jcms.conts.bod.model.Bod;
import net.jcms.conts.bod.model.BodArti;
import net.jcms.conts.bod.model.BodArtiSearch;
import net.jcms.conts.bod.service.BodArtiService;
import net.jcms.conts.bod.service.BodRoleService;
import net.jcms.conts.bod.service.BodService;
import net.jcms.conts.cont.service.ContItemService;
import net.jcms.conts.cont.service.ContService;
import net.jcms.conts.menu.model.Menu;
import net.jcms.conts.menu.model.MenuConnHist;
import net.jcms.conts.menu.model.MenuContSearch;
import net.jcms.conts.menu.service.MenuConnHistService;
import net.jcms.conts.menu.service.MenuContService;
import net.jcms.conts.menu.service.MenuService;
import net.jcms.conts.site.model.Site;
import net.jcms.conts.site.service.SiteService;
import net.jcms.framework.base.web.BaseController;
import net.jcms.framework.file.model.FileItemSearch;
import net.jcms.framework.file.service.FileItemService;
import net.jcms.framework.security.model.User;
import net.jcms.framework.security.model.UserSearch;
import net.jcms.framework.security.service.UserService;
import net.jcms.framework.util.HttpUtil;
import net.jcms.framework.util.StrUtil;
import net.jcms.front.common.web.CommonController;

@Controller
public class CmsController extends BaseController {

	@Resource (name="siteService")
	private SiteService siteService;
	
	@Resource (name="cmsMenuService")
	private MenuService menuService;
	
	@Resource (name="cmsMenuConnHistService")
	private MenuConnHistService menuConnHistService;
	
	@Resource (name="bodService")
	private BodService bodService;
	
	@Resource (name="bodArtiService")
	private BodArtiService bodArtiService;
	
	@Resource (name="bodRoleService")
	private BodRoleService bodRoleService;
	
	@Resource (name="cmsMenuContService")
	private MenuContService menuContService;
	
	@Resource(name = "contService")
	private ContService contService;
	
	@Resource(name = "contItemService")
	private ContItemService contItemService;
	
	@Resource(name = "userService")
	private UserService userService;
	
	@Resource (name="bannerService")
	private BannerService bannerService;
	
	@Resource (name="fileItemService")
	private FileItemService fileItemService;
		
	@Autowired
	private CommonController commonController;
	
	@RequestMapping ("/login.do")
	public String login (HttpServletRequest request, HttpServletResponse response, Model model) {
		Site site = getSite(request, response, model);
		model.addAttribute("menuList", menuService.selectJson(site.getSiteId()));
		
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		HttpSession session = httpRequest.getSession();
		session.setAttribute ("loginRequestURL","login");
		
		return "cms/login/login";
	}
	
	private static final String IS_MOBILE = "MOBI";
	private static final String IS_PC = "PC";
	
	public static String isDevice(HttpServletRequest req) {
		String userAgent = req.getHeader("User-Agent").toUpperCase();
		if(userAgent.indexOf(IS_MOBILE) > -1) {
			return IS_MOBILE;
		}else {
			return IS_PC;
		}
	}
	
	/**
	 * ????????? ????????? ??????
	 */
	@RequestMapping ("/{depth1}/login.do")
	public String login (HttpServletRequest request, HttpServletResponse response, @PathVariable String depth1, Model model) {
		Site site = getSite(request, response, model);
		model.addAttribute("menuList", menuService.selectJson(site.getSiteId()));
		
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		HttpSession session = httpRequest.getSession();
		session.setAttribute ("loginRequestURL","login");
		
		return "cms/login/login";
	}
	
	@RequestMapping ("/findPw.do")
	public String findPw (HttpServletRequest request, HttpServletResponse response, Model model) {
		Site site = getSite(request, response, model);
		model.addAttribute("menuList", menuService.selectJson(site.getSiteId()));
		return "cms/login/findPw";
	}
	
	@RequestMapping ("/{depth1}/findPw.do")
	public String findPw (HttpServletRequest request, HttpServletResponse response, @PathVariable String depth1, Model model) {
		Site site = getSite(request, response, model);
		model.addAttribute("menuList", menuService.selectJson(site.getSiteId()));
		return "cms/login/findPw";
	}
	
	@RequestMapping ("/findId.do")
	public String findId (HttpServletRequest request, HttpServletResponse response, Model model) {
		Site site = getSite(request, response, model);
		model.addAttribute("menuList", menuService.selectJson(site.getSiteId()));
		return "cms/login/findId";
	}
	
	@RequestMapping ("/{depth1}/findId.do")
	public String findId (HttpServletRequest request, HttpServletResponse response, @PathVariable String depth1, Model model) {
		Site site = getSite(request, response, model);
		model.addAttribute("menuList", menuService.selectJson(site.getSiteId()));
		return "cms/login/findId";
	}
	
	@RequestMapping ("/{depth1}/terms.do")
	public String terms (HttpServletRequest request, HttpServletResponse response, @PathVariable String depth1, Model model) {
		Site site = getSite(request, response, model);
		model.addAttribute("menuList", menuService.selectJson(site.getSiteId()));
		return "cms/login/terms";
	}
	
	@RequestMapping ("/{depth1}/signUp.do")
	public String signUp (HttpServletRequest request, HttpServletResponse response, @PathVariable String depth1, Model model) {
		Site site = getSite(request, response, model);
		model.addAttribute("menuList", menuService.selectJson(site.getSiteId()));
		return "cms/login/signUp";
	}
	
	@RequestMapping (value="/public/user/duplicate.json", method=RequestMethod.POST) 
	@ResponseBody
	public Map<String, String> checkIdDuplicate (UserSearch userSearch) {
		Map<String, String> result = new HashMap <String, String> ();
		if (userService.checkIdDuplicate(userSearch) > 0) {
			result.put("result", "exist");
			result.put("message", "?????? ????????????.");
		} else {
			result.put("result", "nonExist");
			result.put("message", "?????? ???????????????.");
		}
		return result;
		
	}
	
	@RequestMapping ("/user/insert.do")
	public String userInsert (HttpServletRequest request, HttpServletResponse response, Model model) {
		Site site = getSite(request, response, model);
		model.addAttribute("menuList", menuService.selectJson(site.getSiteId()));
		return "cms/login/insert";
	}
	
	@RequestMapping ("/{depth1}/user/insert.do")
	public String userInsert (HttpServletRequest request, HttpServletResponse response, @PathVariable String depth1, Model model) {
		Site site = getSite(request, response, model);
		model.addAttribute("menuList", menuService.selectJson(site.getSiteId()));
		return "cms/login/insert";
	}
	
	@RequestMapping ("/user/myPage.do")
	public String myPage (HttpServletRequest request, HttpServletResponse response,  Model model) {
		Site site = getSite(request, response, model);
		model.addAttribute("menuList", menuService.selectJson(site.getSiteId()));
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		
		UserSearch userSearch = new UserSearch();
		userSearch.setUserId(user.getUserId());
		model.addAttribute("Selectuser", userService.select(userSearch) );
		return "cms/login/myPage";
	}
	
	@RequestMapping ("/{depth1}/user/myPage.do")
	public String myPage (HttpServletRequest request, HttpServletResponse response, @PathVariable String depth1, Model model) {
		Site site = getSite(request, response, model);
		model.addAttribute("menuList", menuService.selectJson(site.getSiteId()));
		
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		UserSearch userSearch = new UserSearch();
		userSearch.setUserId(user.getUserId());
		model.addAttribute("Selectuser", userService.select(userSearch) );
		return "cms/login/myPage";
	}
	
	@RequestMapping ("/{depth1}.do")
	public String dynamic (HttpServletRequest request, HttpServletResponse response, @PathVariable String depth1, Model model) {
		if (request != null && response != null && model != null) {
			Site site = getSite(request, response, model);
			model.addAttribute("menuList", menuService.selectJson(site.getSiteId()));
			Menu menu = getMenu(site, request, model);
			model.addAttribute ("menuId", menu.getMenuId ());
			return forwardMenu(site, menu, model, request);
		} else {
			return "";
		}
	}
	
	@RequestMapping ("/{depth1}/{depth2}.do")
	public String dynamic (HttpServletRequest request, HttpServletResponse response, @PathVariable String depth1, @PathVariable String depth2, Model model) {
		if (request != null && response != null && model != null) {
			Site site = getSite(request, response, model);
			model.addAttribute("menuList", menuService.selectJson(site.getSiteId()));
			Menu menu = getMenu(site, request, model);
			model.addAttribute ("menuId", menu.getMenuId ());
			return forwardMenu(site, menu, model, request);
		} else {
			return "";
		}
	}
	
	@RequestMapping ("/{depth1}/{depth2}/{depth3}.do")
	public String dynamic (HttpServletRequest request, HttpServletResponse response, @PathVariable String depth1, @PathVariable String depth2, @PathVariable String depth3, Model model) {
		if (request != null && response != null && model != null) {
			Site site = getSite(request, response, model);
			model.addAttribute("menuList", menuService.selectJson(site.getSiteId()));
			Menu menu = getMenu(site, request, model);
			return forwardMenu(site, menu, model, request);
		} else {
			return "";
		}
	}
	
	@RequestMapping ("/{depth1}/{depth2}/{depth3}/{depth4}.do")
	public String dynamic (HttpServletRequest request, HttpServletResponse response, @PathVariable String depth1, @PathVariable String depth2, @PathVariable String depth3, @PathVariable String depth4, Model model) {
		if (request != null && response != null && model != null) {
			Site site = getSite(request, response, model);
			model.addAttribute("menuList", menuService.selectJson(site.getSiteId()));
			Menu menu = getMenu(site, request, model);
			return forwardMenu(site, menu, model, request);
		} else {
			return "";
		}
	}
	
	@RequestMapping ("/{depth1}/{depth2}/{depth3}/{depth4}/{depth5}.do")
	public String dynamic (HttpServletRequest request, HttpServletResponse response, @PathVariable String depth1, @PathVariable String depth2, @PathVariable String depth3, @PathVariable String depth4, @PathVariable String depth5, Model model) {
		if (request != null && response != null && model != null) {
			Site site = getSite(request, response, model);
			model.addAttribute("menuList", menuService.selectJson(site.getSiteId()));
			Menu menu = getMenu(site, request, model);
			return forwardMenu(site, menu, model, request);
		} else {
			return "";
		}
	}
	
	/**
	 * ?????? ?????? ??? ???????????? ????????????.
	 */
	public Site getSite(HttpServletRequest request, HttpServletResponse response, Model model) {
		Site result = null;
		
		if (request != null && response != null && model != null) {
			String servletPath = request.getServletPath();
			String domain = request.getServerName();
			if(request.getServerPort() != 80) {
				domain += ":"+request.getServerPort();
			}
			
			String[] urlArray = servletPath.split("/");
			String contextPath = urlArray[1];
		
			List<Site> siteList = siteService.selectJson();
			
			/* ?????? ????????? */
			for(Site site : siteList) {
				String[] domainArray = site.getDomain().split(",");
				for(int i=0;i<domainArray.length;i++){
					if(domain.equals(domainArray[i].trim()) && StrUtil.isEmpty(site.getStartUrl())) {
						result = site;
						break;
					}
				}
			}
			
			for(Site site : siteList) {
				String[] domainArray = site.getDomain().split(",");
				for(int i=0;i<domainArray.length;i++){
					if(domain.equals(domainArray[i].trim()) && contextPath.equals(site.getStartUrl())) {
						result = site;
						break;
					}
				}
			}
			
			//???????????? ?????? ??? ????????? ?????? Locale??????
			Locale locale = new Locale(result.getLang().getLangTp());
			LocaleResolver localeResolver = RequestContextUtils.getLocaleResolver(request);
			localeResolver.setLocale(request, response, locale);
	
			//??????????????? ??????
			//RelSiteSearch relSiteSearch = new RelSiteSearch();
			//relSiteSearch.setSiteId (result.getSiteId ());
			//model.addAttribute ("relSite",relsiteService.selectList(relSiteSearch));
	
			model.addAttribute("currentSite", result);
			model.addAttribute("siteList", siteList);
		}
		return result;
		
	}

	/**
	 * ?????? ?????? ??? ??????????????? ????????????.
	 */
	public Menu getMenu(Site site, HttpServletRequest request, Model model) {
		Menu menu = null;
		
		if (request != null && model != null) {
			String servletPath = request.getServletPath();
			if(!StrUtil.isEmpty(site.getStartUrl())) servletPath = servletPath.substring(site.getStartUrl().length()+1);
			servletPath = servletPath.replace(".do", "");
			servletPath = servletPath.substring(1);
	
			menu = menuService.selectCurrentMenu(site.getSiteId(), servletPath);
			
			/**
			 * ????????? ?????? ?????? ??????
			 */
			model.addAttribute("sideMenu", menuService.selectParentMenu(site.getSiteId(), menu));
		}
		return menu;
	}

	public String forwardMenu(Site site, Menu menu, Model model, HttpServletRequest request) {
		if (request != null && model != null) {
			Long id = getUserId();
			
			Map<String, Object> paramMap = commonController.getParameterMap(request);
			
			paramMap.put("mobileYn", isDevice(request));
			model.addAttribute("paramMap", paramMap);
			
			
			if(id == null) {
				return "redirect:/login/loginForm.mng";
			}
			model.addAttribute("menu", menu);
			
			//?????? ?????? ?????? ??????
			MenuConnHist menuConnHist = new MenuConnHist();
			menuConnHist.setMenuId(menu.getMenuId());
			menuConnHist.setMenuConnIp(HttpUtil.getClientIp(request));
			menuConnHist.setRegId(getUserId());
			menuConnHistService.insert(menuConnHist); //?????? ?????? ?????? ??????
			System.out.println("menu.getMenuTp()=" + menu.getMenuTp());
			
			/**
			 * ???????????? ???????????? ????????? ???????????????
			 * cms/framweork : ?????????????????????
			 * obsvsystem : ??????????????????
			 * */
			
			Menu rootMenu = menu.getRootMenu();
			Menu upperMenu = menu.getUpperMenu();
			
			if(site.getStartUrl().equals("front")){ //??????
				if(menu.getMenuUrl().equals("main")) {
					return "redirect:/front/menu01/pro101.do"; 
				}
				
				if("pgm".equals(menu.getMenuTp().trim())){
					if(menu.getMenuUrl().equals("pro501") && paramMap.containsKey("pageData")) {
						return "front/"+menu.getUpperMenu().getMenuUrl()+"/"+menu.getMenuUrl()+paramMap.get("pageData"); 
					}
					
					if(menu.getUpperMenuId() != null){
						return "front/"+menu.getUpperMenu().getMenuUrl()+"/"+menu.getMenuUrl(); 
					}else{
						return "front/"+menu.getMenuUrl(); 
					}
				}
				if("ready".equals(menu.getMenuTp().trim())){
					return "front/preparing";
				}
				if("link".equals(menu.getMenuTp().trim())){
					return  "redirect:"+menu.getLinkUrl();
				}
				if("board".equals(menu.getMenuTp().trim())) { //?????????
					Bod bod = null;
					List<Bod> bodList = bodService.selectJson();
					for(Bod bd : bodList) {
						if(bd.getBodId().compareTo(menu.getBodId()) == 0) {
							bod = bd;
							break;
						}
					}
					model.addAttribute("bod", bod);

					String action = request.getParameter("action");
					if(StrUtil.isEmpty(action)) action = "list";

					if("answ".equals(action)) { //??????
						Long artiId = Long.parseLong(request.getParameter("upperArtiId"));
						BodArtiSearch bodArtiSearch = new BodArtiSearch();
						bodArtiSearch.setArtiId(artiId);
						BodArti upperBodArti = bodArtiService.select(bodArtiSearch);
						model.addAttribute("upperBodArti", upperBodArti);
					}else if("insert".equals(action)) { //????????????
						model.addAttribute("isAuthNoti", bodService.isAuthNoti(bod.getBodId(), getUserId())); //????????? ??????????????? ????????? ??????
					}else if("view".equals(action) || "update".equals(action)) { //??????, ????????????
						Long artiId = Long.parseLong(request.getParameter("artiId"));
						BodArtiSearch bodArtiSearch = new BodArtiSearch();
						bodArtiSearch.setArtiId(artiId);
						BodArti bodArti = bodArtiService.select(bodArtiSearch);

						if(bod.getBodTp ().equals ("movie") && action.equals ("view")){
							FileItemSearch fileItemSearch = new FileItemSearch ();
							fileItemSearch.setFileId (bodArti.getFileId ());
							model.addAttribute("file",fileItemService.select (fileItemSearch));
						}

						/*
						 * ???????????? ????????? ??????????????? ????????????.
						 */
						if(bodArti.getScrtYn() != null){
							if(bodArti.getScrtYn().equals("Y")) {
								if(!bodArtiService.isAuthScrt(bodArti.getArtiId(), getUserId())) {
									return "cms/error/401";
								}
							}
						}

						model.addAttribute("bodArti", bodArti);
						model.addAttribute("isAuthUpdate", bodArtiService.isAuthUpdate(bodArti, getUserId())); //?????? ????????? ????????? ??????
						model.addAttribute("isAuthNoti", bodService.isAuthNoti(bod, getUserId())); //????????? ??????????????? ????????? ??????
						model.addAttribute("isAuthAnsw", bodService.isAuthAnsw(bod, getUserId())); //?????? ????????? ????????? ??????

						/*
						 * SNS ????????? ?????? Meta?????? ??????
						 */

						String metaImage = "";
						if(request.isSecure()) {
							metaImage += "https://";
						}else {
							metaImage += "http://";
						}

						if("image".equals(bod.getBodTp())) {
							model.addAttribute("metaImage", metaImage+site.getDomain()+"/file/image.do?fileId="+bodArti.getFileId());
						}else if("movie".equals(bod.getBodTp())) {
							model.addAttribute("metaImage", metaImage+site.getDomain()+"/file/movie/preview.do?fileId="+bodArti.getFileId()+"&order="+bodArti.getFilePrview());
						}

						bodArtiService.updateHit(artiId); //????????? ??????
					}else if("list".equals(action)) { //??????
						BodArtiSearch bodArtiSearch = new BodArtiSearch();
						bodArtiSearch.setBodId(bod.getBodId());
						model.addAttribute("artiTotalCnt", bodArtiService.count(bodArtiSearch));

						model.addAttribute("notiList", bodArtiService.selectList(bodArtiSearch));

						model.addAttribute("isAuthInsert", bodService.isAuthInsert(bod, getUserId())); //?????? ????????? ????????? ??????
					}

					return "front/bod/"+bod.getBodTp()+"/"+action;
				}
				
				if("cont".equals(menu.getMenuTp().trim())){ 
					MenuContSearch menuContSearch = new MenuContSearch();
					menuContSearch.setMenuId(menu.getMenuId());
					//System.out.println("aaa="+menuContService.selectList(menuContSearch, site.getLangId()));
					model.addAttribute("menuContList", menuContService.selectList(menuContSearch, site.getLangId()));
					return "front/cont";
				}	
				
				return "front/main";
			}
		}
		return "system/main";
	}
	
}
