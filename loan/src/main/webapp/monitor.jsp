<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <title>aaa</title>
    <link rel="shortcut icon" href="images/logo.ico" type="image/x-icon"/>
</head>
<body>

<br>您访问的服务：
<!-- return ServletActionContext.getRequest().getScheme() + "://" + ServletActionContext.getRequest().getServerName() + ":" + ServletActionContext.getRequest().getServerPort() + ServletActionContext.getRequest().getContextPath(); -->
<% out.println(request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort());%>
</body>
</html>