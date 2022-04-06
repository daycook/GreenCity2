package net.jcms.conts.menu.tag;

import java.util.List;
import java.util.Map;

import javax.servlet.jsp.JspWriter;

import net.jcms.conts.menu.model.Menu;
import net.jcms.conts.menu.model.MenuSearch;
import net.jcms.conts.menu.service.MenuService;
import net.jcms.framework.base.tag.BaseTag;
import net.jcms.framework.util.StrUtil;

/**
 * CMS 페이지의 메뉴정보를 생성한다.
 */


@SuppressWarnings("serial")
public class MenuInfoTag extends BaseTag{
	
	private MenuService menuService;
	private StringBuffer sb;
	
	@Override
	protected int doProcessTag() throws Exception {
		JspWriter out = pageContext.getOut ();
		sb = new StringBuffer();
			
		if(getSiteId() != null && !StrUtil.isEmpty(getMenuId())) {
			menuService = getRequestContext().getWebApplicationContext().getBean(MenuService.class);
			
			List<Menu> menuList = menuService.selectJson(Long.parseLong(getSiteId()));
			Menu currentMenu = null;
			for(Menu menu : menuList) {
				currentMenu = getMenu(menu);
				if(currentMenu != null) break;
			}
			if(currentMenu != null) {
				sb.append("<div class='hidden-xs pull-right'>");
				sb.append("<ol class='breadcrumb'><li><i class='fa fa-home'></i></li>");
				sb.append(makeUpperCourse(currentMenu));
				sb.append("</ol>");
				sb.append("</div>");
				sb.append("<div class='clearfix'></div>");
				sb.append("<h2 class='page-title page-header ");
				if(getSnsYn() != null && getSnsYn()) {
					sb.append("fl");
				}
				sb.append("'>"+currentMenu.getMenuNm()+"</h2>");
			}
			if(getSnsYn() != null && getSnsYn()) {
				sb.append("<div class='fr'>");
				sb.append("<button type='button' class='btn btn-fbook' onclick='share(\"facebook\")'><i class='fa fa-facebook'></i></button>");
				sb.append("<button type='button' class='btn btn-twitter' onclick='share(\"twitter\")'><i class='fa fa-twitter'></i></button>");
				sb.append("</div>");
			}
		}
		
		out.print(sb.toString());
		return SKIP_BODY;
	}
	
	public Menu getMenu(Menu menu) {
		Menu result = null;
		if(String.valueOf(menu.getMenuId()).equals(getMenuId())) {
			return menu;
		}
		
		for(Menu childMenu : menu.getChildList()) {
			result = getMenu(childMenu);
			if(result != null) return result;
		}
		return result;
	}
	
	public String makeUpperCourse(Menu menu) {
		StringBuffer result = new StringBuffer();;
		if(menu.getUpperMenuId() != null) result.append(makeUpperCourse(menu.getUpperMenu()));
		result.append("<li");
		if(String.valueOf(menu.getMenuId()).equals(getMenuId())) {
			result.append(" class='active' ");
		}
		result.append(">");
		result.append(menu.getMenuNm());
		result.append("</li>");
		return result.toString();
	}
}
