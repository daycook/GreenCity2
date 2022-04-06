package net.jcms.conts.media.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.jcms.conts.media.model.Media;
import net.jcms.conts.media.model.MediaSearch;
import net.jcms.conts.media.service.MediaService;
import net.jcms.conts.plan.model.Plan;
import net.jcms.framework.base.web.BaseController;
import net.jcms.framework.util.FileUtil;
import net.jcms.framework.util.PathUtil;
import net.jcms.framework.util.PropertiesUtil;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class MediaController extends BaseController {
	
	@Resource (name="mediaService")
	private MediaService mediaService;
	
	@RequestMapping (value="/system/media/list.mng", method=RequestMethod.GET)
	public String list(Model model) {
		
		return "system/media/list";
	}
	
	@RequestMapping (value="/system/media/image.mng", method=RequestMethod.GET)
	public String image(Model model) {
		MediaSearch mediaSearch = new MediaSearch();
		model.addAttribute("totalCnt", mediaService.count(mediaSearch));
		return "page/media/image";
	}
	
	@RequestMapping (value="/system/media/list.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> list(HttpServletRequest request, MediaSearch mediaSearch) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			String sort = request.getParameter("columns[" + request.getParameter("order[0][column]") + "][name]");
			String sortOder = request.getParameter("order[0][dir]");
			mediaSearch.setSort(sort);
			mediaSearch.setSortOrd(sortOder);
			mediaSearch.setPagingYn(true);
			
			int totalCount = mediaService.count(mediaSearch);
			result.put("recordsTotal", totalCount);
			result.put("recordsFiltered", totalCount);
			
			result.put("data", mediaService.selectList(mediaSearch));
			
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	/**
	 * 미디어 상세조회
	 * @param request
	 * @param mediaSearch
	 * @return
	 */
	@RequestMapping (value="/system/media/view.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> view(HttpServletRequest request, MediaSearch mediaSearch) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			result.put("data", mediaService.select(mediaSearch));
			
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/system/media/insert.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insert(MultipartHttpServletRequest request, Media media) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			String filePath = PropertiesUtil.getProperty("AppConf.filePath.media");
			
			Iterator<String> itr =  request.getFileNames();
	        MultipartFile mpf = null;
	        if(itr.hasNext()){
	        	mpf = request.getFile(itr.next()); 
	            
	            String[] extension = mpf.getOriginalFilename().split("[.]");
	            String saveFileName = UUID.randomUUID().toString();
	            
	            media.setFileNm(mpf.getOriginalFilename());
	            media.setFileExt(extension[extension.length-1]);
	            media.setMediaTp(mpf.getContentType());
	            media.setFileSize((int)(mpf.getSize()/1024));
	            media.setSavePath(filePath);
	            media.setSaveFileNm(saveFileName);
	            
	            FileUtil.createFile(mpf, filePath, saveFileName);
	        }
	        
	        media.setRegId(getUserId());
	        mediaService.insert(media);
			
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/system/media/update.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> update(MultipartHttpServletRequest request, Media media) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			String filePath = PropertiesUtil.getProperty("AppConf.filePath.media");
			
			Iterator<String> itr =  request.getFileNames();
	        MultipartFile mpf = null;
	        if(itr.hasNext()){
	        	mpf = request.getFile(itr.next()); 
	            
	            String[] extension = mpf.getOriginalFilename().split("[.]");
	            String saveFileName = UUID.randomUUID().toString();
	            
	            media.setFileNm(mpf.getOriginalFilename());
	            media.setFileExt(extension[extension.length-1]);
	            media.setMediaTp(mpf.getContentType());
	            media.setFileSize((int)(mpf.getSize()/1024));
	            media.setSavePath(filePath);
	            media.setSaveFileNm(saveFileName);
	            
	            FileUtil.createFile(mpf, filePath, saveFileName);
	            
	            mediaService.updateFile(media);
	        }
	        mediaService.update(media);
			
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	@RequestMapping (value="/public/media/image.json", method=RequestMethod.GET)
	public ResponseEntity<byte[]> image(HttpServletRequest request, @RequestParam(value = "hash", required = true) String hash) throws Exception {
		final HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_PNG);
		
		MediaSearch mediaSearch = new MediaSearch();
		mediaSearch.setHash(hash);
		Media media = mediaService.select(mediaSearch);
		
		String imgPath = PathUtil.getImagesPath(request)+"/noImage.png";
		if(media != null) {
			imgPath = media.getSavePath()+media.getSaveFileNm();
			MediaType mediaType = new MediaType(media.getMediaTp().split("/")[0], media.getMediaTp().split("/")[1]);
			headers.setContentType(mediaType);
		}
		
		File file = new File(imgPath);
		if(!file.exists()) { //파일이 존재하지 않을 경우
			imgPath = PathUtil.getImagesPath(request)+"/noImage.png";
		}
		InputStream in = new FileInputStream(imgPath);
	 
		return new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);		
	}
	
	@RequestMapping (value="/system/media/delete.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> delete(HttpServletRequest request, Media media) {
		Map<String , Object> result = new HashMap<String, Object>();
		try{
			
			media.setDelId(getUserId());
			mediaService.delete(media);
			result.put("result", "success");
		}catch (Exception e){
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
}
