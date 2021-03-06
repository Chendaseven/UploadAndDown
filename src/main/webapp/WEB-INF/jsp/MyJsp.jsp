
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<meta charset="UTF-8">
  <title>Document</title>
  <link rel="stylesheet" href="css/index.css">

  <style>
  @font-face {
  font-family: 'iconfont';
  src: url('iconfont.eot');
  src: url('iconfont.eot?#iefix') format('embedded-opentype'),
  url('iconfont.woff') format('woff'),
  url('iconfont.ttf') format('truetype'),
  url('iconfont.svg#iconfont') format('svg');
}
.iconfont{
  font-family:"iconfont" !important;
  font-size:16px;font-style:normal;
  -webkit-font-smoothing: antialiased;
  -webkit-text-stroke-width: 0.2px;
  -moz-osx-font-smoothing: grayscale;
}
.icon
{
  width: 1em;
  height: 1em;
  vertical-align: -0.15em;
  color: white;
  overflow: hidden;
}
  </style>

  </head>
  
  <body>
      
    <div class="head">
      <div class="logo">
        <h1>Severs</h1>
      </div>
      <div class="search">
         <form>
            <input type="text" placeholder="请输入您要搜索的内容...">
            <button type="submit" value="搜索">Search</button>
               </form>
      </div>
      <div class="menu">
        <h1>功能栏</h1>
      </div>
    </div>
  
  <div class="content">
    <div class="tools">
      <div id="active" class="allfiles">
        <!-- <i class="iconfont">&#x33;</i> -->

        <h1><a href="">全部文件</a></h1>
      </div>
      <div class="picture">
        <h1><a href="picture.html">图片</a></h1>
      </div>
      <div class="flonder">
        <h1><a href="#">文档</a></h1>
      </div>
      <div class="video">
        <h1><a href="#">视频</a></h1>
      </div>
      <div class="music" >
        <h1><a href="#">视频</a></h1>
      </div>
      <div class="other">
        <h1><a href="#">视频</a></h1>
      </div>
    </div>
    <div class="main-content">
      <table border="1" width="700px">
      <tr>
        <th>编号</th>
        <th>文件名</th>
        <th>大小</th>
        <th>类型</th>
        <th>上传时间</th>
        <th>操作</th>
      </tr>
      <c:forEach items="${list}" var="bean" varStatus="varSta">
      <tr>
        <td>${varSta.count }</td>
        <td>${bean.name }</td>
        <td>${bean.size }</td>
        <td>${bean.type }</td>
        <td>${bean.addTime }</td>
        <td><a href="${pageContext.request.contextPath }/DownServlet?id=${bean.id}">下载该资源</a></td>
      </tr>
      </c:forEach>
    </table>
    </div>
  </div>
  <div class="mask"></div>
  <div id="sidebar">
    <ul>
      <li>
        
        <a href="upload1.html">上传</a></li>
      <li>
        
          <a href="download.html">下载</a></li>
      
      
    </ul>
  </div>
  <script src="js/jquery.js"></script>
  <script src="js/main.js"></script>
  <script src="./iconfont/iconfont.js"></script>  
  </body>
</html>
