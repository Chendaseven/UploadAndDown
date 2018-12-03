package cqupt.chen.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String uploadFile(Model model) {
		//filelistservice.uploadFile(filebean);
		return "success";
	}
	
	
}
