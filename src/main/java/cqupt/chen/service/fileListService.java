package cqupt.chen.service;

import java.util.List;

import cqupt.chen.pojo.fileBean;

public interface fileListService {
	public List<fileBean> fileList();
	//service中定义根据name搜索文件
	public List<fileBean> findByName(String name);
	//根据图片类型查找文件
	public List<fileBean> findByimage(String type);
	//文件上传
	public void uploadFile(fileBean filebean);
	//根据id查询文件对象
	public fileBean findByID(Integer id);
}
