<%--
  Created by IntelliJ IDEA.
  User: SARITA
  Date: 2022-11-18
  Time: 오전 9:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="com.myapp.common.*,java.io.File"%>
<%@ page import ="com.oreilly.servlet.*"%>
<%@ page import ="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String filename="";
    int sizeLimit = 15*1024*1024;

    String realPath= request.getServletContext().getRealPath("upload");
    File dir = new File(realPath);
    if (!dir.exists()) dir.mkdirs();

    MultipartRequest multipartRequest = null;
    multipartRequest = new MultipartRequest(request, realPath, sizeLimit,"utf-8",new DefaultFileRenamePolicy());

    filename= multipartRequest.getFilesystemName("file");
%>

파일명: <%=filename%><br/>
<img src="${pageContext.request.contextPath}/upload/<%=filename%>">
<td><a href="posts.jsp?id=${u.getSeq()}">Back Home</a></td>

</body>
</html>
