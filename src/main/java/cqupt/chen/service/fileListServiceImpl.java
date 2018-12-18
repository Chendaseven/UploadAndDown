package cqupt.chen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cqupt.chen.mapper.fileListMapper;
import cqupt.chen.pojo.fileBean;
@Service
public class fileListServiceImpl implements fileListService {
	@Autowired
	public fileListMapper filelistmapper;
	@Override
	public List<fileBean> fileList() {
		List<fileBean> filebeanList = filelistmapper.findAllFile();
	
		return filebeanList;
	}
	
	//根据文件名搜索文件
	@Override
	public List<fileBean> findByName(String name) {
		List<fileBean> fileListByName = filelistmapper.findFileByName(name);
		
		return fileListByName;
	}
	//根据图片类型搜索文件
	@Override
	public List<fileBean> findByimage(String type) {
		List<fileBean> fileListByimage = filelistmapper.findFileByImage(type);
		return fileListByimage;
	}

	@Override
	public void uploadFile(fileBean filebean) {
		filelistmapper.uploadFile(filebean);
	}

	@Override
	public fileBean findByID(Integer id) {
		fileBean filebean = filelistmapper.findById(id);
		return filebean;
	}
	

}
