package cqupt.chen.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import cqupt.chen.pojo.fileBean;
import cqupt.chen.service.fileListService;

@Controller
public class fileUploadController {
	@Autowired
	private fileListService filelistservice;
	
	@RequestMapping(value = "list")
	public String uploadlist(Model model) {
		List<fileBean> filelist = filelistservice.fileList();
		model.addAttribute("list", filelist);
		
		return "list";
	}
	
	@RequestMapping(value = "searchFile")
	public String findFileByName(Model model,String sename) {
		List<fileBean> fileList= filelistservice.findByName(sename);
		model.addAttribute("list", fileList);
		return "list";
	}
	
	@RequestMapping(value = "searchimage")
	public String findFileByImage(Model model) {
		List<fileBean> fileList= filelistservice.findByimage("image");
		model.addAttribute("list", fileList);
		return "list";
	}
	
	@RequestMapping(value = "UploadServlet")
	public String uploadFile(HttpServletRequest request,MultipartFile[] attachment,Model model) throws IllegalStateException, IOException {
		//设置文件上传时间
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String uploadDate = sdf.format(new Date());
		List<fileBean> filebeanList = new ArrayList<>();
		
		if(attachment != null && attachment.length>0) {
			for(MultipartFile file : attachment) {
				if(file != null & !file.isEmpty()) {
					
					//获得文件原始名
					//特别注意：文件上传时，MultipartFile file 此file名应该与前端jsp页面<input type="file" name="file"/> 这个name名相同，否则取不到file
					String fileName = file.getOriginalFilename().substring(0, file.getOriginalFilename().lastIndexOf("."));
					//获取文件类型
					String fileType = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")+1);
					File fileLocal = new File("H:/temp"+File.separator+file.getOriginalFilename());
					
					Long fileSize = file.getSize();
					//计算文件大小
					/**
					 *  e.g.   1024b=1KB  1024*1024b=1MB
					 */
					String sizeStr = "";
					if(fileSize>=1024 && fileSize<1024*1024){
						sizeStr = (fileSize/1024)+"KB";
					}else if(fileSize>1024*1024 && fileSize<=1024*1024*1024){
						sizeStr = (fileSize/(1024*1024))+"MB";
					}else if(fileSize >= 1024*1024*1024){
						sizeStr = (fileSize/(1024*1024*1024))+"GB";
					}else{
						sizeStr = fileSize+"B";
					}
					//String fileType = file.getContentType();
					String info = request.getParameter("info1");
					//分别保存每一个上传的文件
					fileBean filebean = new fileBean();
					filebean.setName(fileName);
					filebean.setSize(sizeStr);
					filebean.setType(fileType);
					filebean.setAddtime(uploadDate);
					filebean.setFile_path(fileLocal.getPath());
					filebean.setInfo(info);
					//将每一个fileBean保存在List中
					filebeanList.add(filebean);
					//将每一个文件保存在指定目录
					file.transferTo(fileLocal);
					//将每一个文件的信息插入到数据库中，考虑Mybatis中使用一条语句同时插入所有文件信息
					filelistservice.uploadFile(filebean);
				}
			}
		}
		model.addAttribute("fileList", filebeanList);
		return "success";
	}
	
	@RequestMapping(value = "DownServlet")
	public void downFile(fileBean filebean,Integer id,HttpServletRequest request,HttpServletResponse response) throws IOException {
		fileBean filebeanById = filelistservice.findByID(id);
		//获取文件名称
		String fileName = filebeanById.getName();
		//获取文件名+类型
		fileName = fileName +"."+ filebeanById.getType();
		//获取文件所在路径
		String path = "H:\\temp" + "\\" + fileName;
		InputStream in = new BufferedInputStream(new FileInputStream(new File(path)));
		fileName = URLEncoder.encode(fileName, "utf-8");
		//设置一个响应头: Content-Disposition  告诉浏览器以下载的方法打开该资源
		String content = "attachment;filename="+fileName;
		response.setHeader("Content-Disposition", content);
		//把文件内容发送给浏览器
		OutputStream out = response.getOutputStream();
		 int len = 0;
		 byte[] buf = new byte[1024];
         while((len = in.read(buf)) != -1){
             out.write(buf, 0, len);
             out.flush();
         }  
         out.close();
         in.close();
	}
	
	
}
