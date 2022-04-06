package net.jcms.framework.file.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.RandomAccessFile;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.jcms.framework.base.web.BaseController;
import net.jcms.framework.file.model.FileInfo;
import net.jcms.framework.file.model.FileItem;
import net.jcms.framework.file.model.FileItemSearch;
import net.jcms.framework.file.model.FileSearch;
import net.jcms.framework.file.service.FileItemService;
import net.jcms.framework.file.service.FileService;
import net.jcms.framework.util.Constants;
import net.jcms.framework.util.FileUtil;
import net.jcms.framework.util.PathUtil;
import net.jcms.framework.util.PropertiesUtil;
import net.jcms.framework.util.StrUtil;

import org.apache.commons.io.FileUtils;
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
public class FileController extends BaseController {
	
	@Resource (name="fileService")
	private FileService fileService;
	
	@Resource (name="fileItemService")
	private FileItemService fileItemService;
	
	String filePathCommon = "C:/file/upload/";
	
	/**
	 * 파일 업로드
	 * @param fileId (파일 아이디)
	 * @param shift - 기존에 있는 파일을 지우고 새로운 파일로 교체를 원할 경우 true로 전달한다.
	 */
	@RequestMapping(value="/public/file/upload.json")
	@ResponseBody
	public Map<String, Object> upload(MultipartHttpServletRequest request, String filePath, HttpServletResponse response, Long fileId) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			Iterator<String> itr =  request.getFileNames();
	        MultipartFile mpf = null;
	        FileItem fileItem = null;
	        if(itr.hasNext()){
	        	mpf = request.getFile(itr.next()); 
	          /*  HttpSession session = request.getSession ();
	            User user = (User)session.getAttribute ("user");*/
	        	
	            String[] extension = mpf.getOriginalFilename().split("[.]");
	            String saveFileName = UUID.randomUUID().toString();
	            if(StrUtil.isEmpty(filePath)) {
    				if(! mpf.getContentType () .equals (Constants.MEDIA_TYPE_MP4)){
    					filePath = filePathCommon;
    					System.out.println("111 = " + filePath);
    					fileItem = new FileItem();
    		            fileItem.setFileNm(mpf.getOriginalFilename());
    		            fileItem.setFileSize((int)(mpf.getSize()/1024));
    		            fileItem.setMediaTp(mpf.getContentType());
    		            fileItem.setFileExt(extension[extension.length-1]);
    		            fileItem.setSavePath(filePath);
    		            fileItem.setSaveFileNm(saveFileName);
    		            fileItem.setRegId(getUserId());
    		            //fileItem.setRegId(user.getUserId ());
    				}else{
    					filePath = PropertiesUtil.getProperty("AppConf.filePath.video");
    					System.out.println("222 = " + filePath);
    					fileItem = new FileItem();
    		            fileItem.setFileNm(mpf.getOriginalFilename());
    		            fileItem.setFileSize((int)(mpf.getSize()/1024));
    		            fileItem.setMediaTp(mpf.getContentType());
    		            fileItem.setFileExt(extension[extension.length-1]);
    		            fileItem.setSavePath(filePath);
    		            saveFileName += "."+fileItem.getFileExt ();
    		            fileItem.setSaveFileNm(saveFileName);
    		            fileItem.setRegId(getUserId());
    		           // fileItem.setRegId(user.getUserId ());

    				}
    			}
	            fileItem.setFileId(fileId);
	            fileItemService.insert(fileItem);
	            
	            FileUtil.createFile(mpf, filePath, saveFileName);
	        }

	        result.put("fileItem", fileItem);
	        result.put("result", "success");
		}catch(Exception e) {
			result.put("result", "exception");
			result.put("mess age",  e.getMessage());
			
			e.printStackTrace();
		}
        return result;
	}
	
	/**
	 * 파일 업로드
	 * @param fileId (파일 아이디)
	 * @param shift - 기존에 있는 파일을 지우고 새로운 파일로 교체를 원할 경우 true로 전달한다.
	 */
	@RequestMapping(value="/file/ckeditor/upload.json")
	public void ckeditorUpload(MultipartHttpServletRequest request, HttpServletResponse response) {
		try {
			String filePath = filePathCommon;

			FileInfo fileInfo = new FileInfo();
			fileService.insert(fileInfo);
			
			Iterator<String> itr =  request.getFileNames();
	        MultipartFile mpf = null;
	        FileItem fileItem = null;
	        if(itr.hasNext()){
	        	mpf = request.getFile(itr.next()); 
	            
	            String[] extension = mpf.getOriginalFilename().split("[.]");
	            String saveFileName = UUID.randomUUID().toString();
	            
	            fileItem = new FileItem();
	            fileItem.setFileId(fileInfo.getFileId());
	            fileItem.setFileNm(mpf.getOriginalFilename());
	            fileItem.setFileSize((int)(mpf.getSize()/1024));
	            fileItem.setMediaTp(mpf.getContentType());
	            fileItem.setFileExt(extension[extension.length-1]);
	            fileItem.setSavePath(filePath);
	            fileItem.setSaveFileNm(saveFileName);
	            fileItem.setRegId(getUserId());
	            
	            fileItemService.insert(fileItem);
	            
	            FileUtil.createFile(mpf, filePath, saveFileName);
	        }

	        
            PrintWriter printWriter = null;
            printWriter = response.getWriter();
            String callback = request.getParameter("CKEditorFuncNum");
            String msg = "이미지를 업로드 하였습니다.";
            
            String message =  URLEncoder.encode("이미지를 업로드 하였습니다.","UTF-8");
            
            
            String fileUrl = "/file/image.mng?fileId="+fileInfo.getFileId()+"&"+new Date().getTime();
        	printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
                       + callback
                       + ",'"
                       + fileUrl
                       + "')</script>");
               printWriter.flush();
               
		}catch(Exception e) {
		}
	}
	
	
	@RequestMapping (value="/public/file/view.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> view(HttpServletRequest request, FileSearch fileSearch) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {	
			result.put("data", fileService.select(fileSearch));
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	/**
	 * 동영상 미리보기 이미지
	 */
	@RequestMapping (value="/file/movie/preview.mng", method=RequestMethod.GET)
	public ResponseEntity<byte[]> moviePreview(HttpServletRequest request, FileItemSearch fileItemSearch, @RequestParam(value = "order", required = true) String order) throws Exception {
		final HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_PNG);
		
		List<FileItem> fileItemList = fileItemService.selectList(fileItemSearch);
		
		String imgPath = PathUtil.getImagesPath(request)+"/noImage.png";
		if(fileItemList.size() > 0) {
			FileItem fileItem = fileItemList.get(0);
			imgPath = fileItem.getSavePath()+PropertiesUtil.getProperty("AppConf.filePath.preview")+fileItem.getSaveFileNm()+System.getProperty("file.separator")+order+".png";
		}
		
		File file = new File(imgPath);
		if(!file.exists()) { //파일이 존재하지 않을 경우
			imgPath = PathUtil.getImagesPath(request)+"/noImage.png";
		}
		InputStream in = new FileInputStream(imgPath);
		
		return new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);		
	}
	
	@RequestMapping (value="/file/movie/play.mng")
	public void showMovie(FileItemSearch fileItemSearch, HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<FileItem> fileItemList = fileItemService.selectList(fileItemSearch);
		
		if(fileItemList.size() > 0) {
			ServletOutputStream out = null;
			RandomAccessFile rf = null;
			try {
				FileItem fileItem = fileItemList.get(0);
				String range = request.getHeader("Range");
				int i = range.indexOf("=");
				int j = range.indexOf("-");
	
				long start = Long.parseLong(range.substring(i + 1, j));
				long end = 0;
				if (j < range.length() - 1) {
					end = Long.parseLong(range.substring(j + 1));
				}
				if (end == 0) {
					end = start + 1024 * 1024 - 1;
				}
	
				File file = new File(fileItem.getSavePath()+fileItem.getSaveFileNm());
				if (end > file.length() - 1) {
					end = file.length() - 1;
				}
	
				response.setStatus(HttpServletResponse.SC_PARTIAL_CONTENT);
				response.setContentType(fileItem.getMediaTp());
				response.setHeader("Accept-Ranges", "bytes");
				response.setHeader("Content-Range", "bytes " + start + "-" + end + "/" + file.length());
				response.setContentLength((int) (end - start + 1));
	
				rf = new RandomAccessFile(file, "r");
				rf.seek(start);
				byte[] buffer = new byte[1024];
				int num = 0;
				out = response.getOutputStream();
				while (start < end && (num = rf.read(buffer)) != -1) {
					out.write(buffer, 0, num);
					out.flush();
					start += 1024;
				}
				
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
			} finally {
				if(out != null) out.close();
				if(rf != null) rf.close();
			}
		}
	}
	

	/**
	 * 파일삭제
	 */
	@RequestMapping (value="/file/delete.json", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delete(HttpServletRequest request, FileItem fileItem) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {
			fileItemService.delete(fileItem);
			result.put("result", "success");
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "fail");
			result.put("message", e.getMessage());
		}
		return result;
	}
	
	/**
	 * 파일다운로드
	 */
	@RequestMapping (value="/file/download.json", method=RequestMethod.GET)
	public void download(HttpServletResponse response, FileItemSearch fileItemSearch) throws Exception{
		FileItem fileItem = fileItemService.select(fileItemSearch);
		
		fileItemService.updateDwnCnt(fileItem.getItemId()); //다운로드 수 증가
		
		byte fileByte[] = FileUtils.readFileToByteArray(new File(fileItem.getSavePath()+fileItem.getSaveFileNm()));
	     
	    response.setContentType("application/octet-stream");
	    response.setContentLength(fileByte.length);
	    response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(fileItem.getFileNm(),"UTF-8")+"\";");
	    response.setHeader("Content-Transfer-Encoding", "binary");
	    response.getOutputStream().write(fileByte);
	     
	    response.getOutputStream().flush();
	    response.getOutputStream().close();
	}
	
	/**
	 * 이미지 보기
	 */
	@RequestMapping (value="/file/image.mng")
	public ResponseEntity<byte[]> imageView(HttpServletRequest request, FileItemSearch fileItemSearch, boolean thumnail) throws Exception {
		final HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_PNG);
		
		List<FileItem> fileItemList = fileItemService.selectList(fileItemSearch);
		
		String imgPath = PathUtil.getImagesPath(request)+"/noImage.png";
		if(fileItemList.size() > 0) {
			FileItem fileItem = fileItemList.get(0);
			if(thumnail) {
				imgPath = fileItem.getSavePath()+PropertiesUtil.getProperty("AppConf.filePath.thumb")+fileItem.getSaveFileNm()+PropertiesUtil.getProperty("AppConf.fileNm.thumb");
			}else {
				imgPath = fileItem.getSavePath()+fileItem.getSaveFileNm();
			}
			MediaType mediaType = new MediaType(fileItem.getMediaTp().split("/")[0], fileItem.getMediaTp().split("/")[1]);
			headers.setContentType(mediaType);
		}
		
		File file = new File(imgPath);
		if(!file.exists()) { //파일이 존재하지 않을 경우
			imgPath = PathUtil.getImagesPath(request)+"/noImage.png";
		}
		InputStream in = new FileInputStream(imgPath);
	 
		return new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);		
	}
	
	@RequestMapping("/ckeditorImageUpload")
	public String ckeditorImageUpload(final HttpServletRequest request,Model model){
		
		return "";
	}
	
	/**
	 * 썸네일 이미지 보기
	 */
	@RequestMapping (value="/image/thumbnail.json", method=RequestMethod.GET)
	public ResponseEntity<byte[]> imageThumbnail(HttpServletRequest request, FileItemSearch fileItemSearch) throws Exception {
		final HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_PNG);
		
		List<FileItem> fileItemList = fileItemService.selectList(fileItemSearch);
		
		String imgPath = PathUtil.getImagesPath(request)+"/noImage.png";
		if(fileItemList.size() > 0) {
			FileItem fileItem = fileItemList.get(0);
			imgPath = fileItem.getSavePath()+PropertiesUtil.getProperty("AppConf.filePath.thumb")+fileItem.getSaveFileNm()+PropertiesUtil.getProperty("AppConf.fileNm.thumb");
			MediaType mediaType = new MediaType(fileItem.getMediaTp().split("/")[0], fileItem.getMediaTp().split("/")[1]);
			headers.setContentType(mediaType);
		}
		
		File file = new File(imgPath);
		if(!file.exists()) { //파일이 존재하지 않을 경우
			imgPath = PathUtil.getImagesPath(request)+"/noImage.png";
		}
		InputStream in = new FileInputStream(imgPath);
	 
		return new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);		
	}
	
}
