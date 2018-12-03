<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base
	href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/">
<script type="text/javascript" src="webuploader/jquery-1.7.2.js"></script>
<script type="text/javascript" src="webuploader/webuploader.min.js"></script>
<link href="webuploader/webuploader.css" type="css/text" />
<script type="text/javascript" src="admin/bootstrap/jquery-2.0.0.min.js"></script>
<script type="text/javascript" src="admin/bootstrap/jquery-ui.js"></script>
<link href="admin/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen">
<script type="text/javascript" src="admin/bootstrap/bootstrap.min.js"></script>
</head>
<body>
	<h2 style="color:purple;"><a href="${pageContext.request.contextPath }/ListFileServlet" style="text-decoratiion">首页</a></h2>
	<div id="thelist" class="uploader-list"></div>
	<div style="margin: 20px 20px 20px 0;">
		<div id="picker" class="form-control-focus">选择文件</div>
	</div>
	<button id="btnSync" type="button" class="btn btn-warning">开始同步</button>
	
	
	<div class="progress">
	  <div id="progress" class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 0%;">
	    <span class="sr-only">60% Complete</span>
	  </div>
	</div>
	
	<script>
		var uploader = WebUploader.create({

			// swf文件路径
			swf : 'webuploader/Uploader.swf',
			// 文件接收服务端。
			server : 'UploadVideoServlet',
			// 选择文件的按钮。可选。
			// 内部根据当前运行是创建，可能是input元素，也可能是flash.
			pick : '#picker',
			chunked: true,  //分片处理
            chunkSize: 10 * 1024 * 1024, //每片10M  
            threads:3,//上传并发数。允许同时最大上传进程数。
			// 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
			resize : false
		});

		// 当有文件被添加进队列的时候
		uploader.on('fileQueued', function(file) {
			//alert(123);
			$("#thelist").append(
					'<div id="' + file.id + '" class="item">'
							+ '<h4 class="info">' + file.name + '</h4>'
							+ '<p class="state">等待上传...</p>' + '</div>');
		});

		uploader.on('uploadProgress', function(file,percentage) {
			$("#progress").css("width",parseInt(percentage*100)+"%");
		});
		
		uploader.on('uploadSuccess', function(file) {
			$('#' + file.id).find('p.state').text('已上传');
			$.post("UploadSuccessServlet", { "guid": uploader.options.formData.guid,chunks:Math.ceil(file.size/(10*1024*1024)),fileName:file.name},
			   function(data){
		   	}, "json");
		});

		uploader.on('uploadError', function(file) {
			$('#' + file.id).find('p.state').text('上传出错');
		});

		uploader.on('uploadComplete', function(file) {
			$('#' + file.id).find('.progress').fadeOut();
		});

		$("#btnSync").on('click', function() {
			if ($(this).hasClass('disabled')) {
				return false;
			}
			uploader.options.formData.guid = Math.random();
			uploader.upload();

		});
	</script>
</body>
</html>
