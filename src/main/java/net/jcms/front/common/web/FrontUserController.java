package net.jcms.front.common.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.jcms.framework.base.web.BaseController;
import net.jcms.framework.util.StrUtil;
import net.jcms.front.common.service.FrontUserService;

@Controller
public class FrontUserController extends BaseController{
	
	@Resource(name="frontUserService")
	private FrontUserService frontUserService;
	
	@Resource(name="commonController")
	private CommonController commonController;
	
	@RequestMapping(value="/front/user/insertUserInfo.json")
	@ResponseBody
	public Map<String,Object> insertUserInfo(HttpServletRequest request){
		Map<String,Object> resultMap = new HashedMap<>();
		Map<String,Object> paramMap = commonController.getParameterMap(request);
		
		try {
			Map<String,Object> userInfo = frontUserService.selectUserInfo(paramMap);
			if(userInfo != null) {
				resultMap.put("err", "1");
			}else {
				paramMap.put("userPwd", StrUtil.encryptSha512((String)paramMap.get("userPwd"), (String)paramMap.get("userLoginId")));
				frontUserService.insertUserInfo(paramMap);
			}
			resultMap.put("message", "success");
		}catch (Exception e) {
			resultMap.put("message", "fail");
		}
		
		return resultMap;
	}
	
	
	@RequestMapping(value="/front/user/loginInfoChk.json")
	@ResponseBody
	public Map<String,Object> loginInfoChk(HttpServletRequest request){
		Map<String,Object> resultMap = new HashedMap<>();
		Map<String,Object> paramMap = commonController.getParameterMap(request);
		
		try {
			Map<String,Object> userInfo = frontUserService.selectUserInfo(paramMap);
			paramMap.put("userPwd", StrUtil.encryptSha512((String)paramMap.get("userPwd"), (String)paramMap.get("userLoginId")));
			
			if(userInfo == null) {
				resultMap.put("err", "1");
			}else if(!userInfo.get("userPwd").equals(paramMap.get("userPwd"))) {
				resultMap.put("err", "2");
			}else if(userInfo.get("userStCd").equals("2")) {
				resultMap.put("err", "3");
			}else {
				resultMap.put("err", "0");
			}
			
			resultMap.put("message", "success");
		}catch (Exception e) {
			resultMap.put("message", "fail");
		}
		
		return resultMap;
	}
	
	
	@RequestMapping(value="/front/user/selectUserInfo.json")
	@ResponseBody
	public Map<String,Object> selectUserInfo(HttpServletRequest request){
		Map<String,Object> resultMap = new HashedMap<>();
		Map<String,Object> paramMap = commonController.getParameterMap(request);
		
		try {
			Map<String,Object> userInfo = frontUserService.selectUserInfo(paramMap);
			
			resultMap.put("userInfo", userInfo);
			
			resultMap.put("message", "success");
		}catch (Exception e) {
			resultMap.put("message", "fail");
		}
		
		return resultMap;
	}
	
	@RequestMapping(value="/front/user/changeUserPswd.json")
	@ResponseBody
	public Map<String,Object> changeUserPswd(HttpServletRequest request){
		Map<String,Object> resultMap = new HashedMap<>();
		Map<String,Object> paramMap = commonController.getParameterMap(request);
		
		try {
			Map<String,Object> userInfo = frontUserService.selectUserInfo(paramMap);
			String oldPwd = StrUtil.encryptSha512((String)paramMap.get("oldPwd"), (String)userInfo.get("userLoginId"));
			
			if(!oldPwd.equals(userInfo.get("userPwd"))) {
				resultMap.put("err", "1");
			}else {
				//비밀번호 변경 관련하여서 수정 작업중!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				paramMap.put("userPwd", StrUtil.encryptSha512((String)paramMap.get("chgPwd"), (String)userInfo.get("userLoginId")));
				frontUserService.changeUserPswd(paramMap);
			
			}
			
			resultMap.put("message", "success");
		}catch (Exception e) {
			resultMap.put("message", "fail");
		}
		
		return resultMap;
	}
}
