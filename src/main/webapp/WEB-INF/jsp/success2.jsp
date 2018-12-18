<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
    <title>文件列表</title>
    <style type="text/css">
      *
      {
        margin: 0;
        padding: 0;
      }
      .head
      {
        width: 100%;
        height: 50px;
        background: #ccc;
      }
      h2
      {
        line-height: 50px;
      }
      h3
      {
        text-align: center;
        color: purple;
        margin: 5%;
        margin-bottom: 0; 
      }
      table
      {
        margin: 1% auto;
        width: 800px;

      }
      a
      {
        text-decoration: none;
        color: purple;
      }
      td
      {
        text-align: center;
      }
    </style> 
  </head>
  
  <body>
    <div class="head">
      <h2><a href="${pageContext.request.contextPath }/list">返回首页</a></h2>
    </div>
    <div class="main">
    <h3>文件上传成功！ </h3>
    <table border="1" width="500px">
      <tr>
        <th>编号</th>
        <th>文件名</th>
        <th>大小</th>
        <th>类型</th>
        <th>上传时间</th>
      </tr>

      <tr>
        <td>1</td>
        <td>${filebean.name }</td>
        <td>${filebean.size }</td>
        <td>${filebean.type }</td>
        <td>${filebean.addtime }</td>
      </tr>

    </table>
    </div>
  </body>
</html>
