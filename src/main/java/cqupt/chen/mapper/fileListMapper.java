package cqupt.chen.mapper;

import java.util.List;

import cqupt.chen.pojo.fileBean;

public interface fileListMapper {
	public List<fileBean> findAllFile();
	//根据文件文搜素文件
	public List<fileBean> findFileByName(String fileName);
	//搜索图片类型文件
	public List<fileBean> findFileByImage(String type);
	//上传文件
	public void uploadFile(fileBean filebean);
}
