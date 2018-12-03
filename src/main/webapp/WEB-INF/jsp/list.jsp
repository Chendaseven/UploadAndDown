<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
    <title>可以下载的文件列表</title>
    <link rel="stylesheet" href="css/index.css">  
  </head>
  
  <body>
  
    <div class="head">
      <div class="logo">
        <h1>Severs</h1>
      </div>
      <div class="search">
         <form id="target" action="${pageContext.request.contextPath }/searchFile" method="post">
            <input id="client" type="text" placeholder="请输入您要搜索的内容..."  name="sename"><br>
          	<!--  <input type="text" name="sename"><br>-->
           <input id="host" type="submit" value="搜索">
          	<!-- <button type="submit" value="搜索">Search</button> -->
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

        <h1><a href="${pageContext.request.contextPath }/list">全部文件</a></h1>
      </div>
      <div class="picture">
        <h1><a href="${pageContext.request.contextPath }/searchimage">图片</a></h1>
      </div>
      <div class="flonder">
        <h1><a href="${pageContext.request.contextPath }/searchTxt">文档</a></h1>
      </div>
      <div class="video">
        <h1><a href="${pageContext.request.contextPath }/searchVideo">视频</a></h1>
      </div>
      <div class="music" >
        <h1><a href="#">音乐</a></h1>
      </div>
      <div class="other">
        <h1><a href="#">其他</a></h1>
      </div>
    </div>
    <div class="main-content" style="overflow:auto;">
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
        <td>${bean.addtime }</td>
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
        
        <a href="upload.jsp">上传</a></li>
      <li>
        
          <a href="index.jsp">分片上传</a></li>

    </ul>
  </div>
  <script src="js/jquery.js"></script>
  <script src="js/main.js"></script>
  <script src="./iconfont/iconfont.js"></script>

</body>
</html>


