<?xml version="1.0" encoding="UTF-8" ?>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>填写公司信息</title>
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=path%>/css/top.css" rel="stylesheet" type="text/css" />
<!--banner-->
<link rel="stylesheet" type="text/css" href="<%=path%>/css/jquery.jslides.css" media="screen" />
<%-- <script type="text/javascript" src="<%=path%>/js/jquery-1.8.0.min.js"></script> --%>

    <script type="text/javascript" src="<%=path %>/js/jquery-easyui-1.4/jquery.min.js"></script>
	<script type="text/javascript" src="<%=path %>/js/jquery-easyui-1.4/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=path %>/js/jquery-easyui-1.4/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="<%=path%>/js/jquery-easyui-1.4/jquery-migrate-1.2.1.min.js"></script>
	<script type="text/javascript" src="<%=path%>/js/jquery.jslides.js"></script>
	<script type="text/javascript" src="<%=path%>/js/scrollable.js"></script>
	 <script type="text/javascript" src="<%=path%>/js/ajaxfileupload.js"></script>
	
	<link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui-1.4/themes/gray/easyui.css" />
	<link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui-1.4/themes/icon.css" />

<script type="text/javascript"> 
	$(function(){  
		

	});  
	 
	 function iFrameHeight() {
        var ifm= document.getElementById("two");
        var subWeb = document.frames ? document.frames["two"].document : ifm.contentDocument;
            if(ifm != null && subWeb != null) {
            ifm.height = subWeb.body.scrollHeight;
        }
    }
	 
	</script>

</head>
<body >
	<jsp:include page="/WEB-INF/views/top.jsp" flush="true" />
	
	<!-- <iframe runat="server" src="../top" width="100%" height="50" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes"></iframe> -->
	<iframe id="two" name="two" src="registerCompany" marginheight="0" marginwidth="0" frameborder="0" scrolling="no" width="100%" height="500"  onLoad="iFrameHeight()" ></iframe>
<iframe runat="server" src="../bottom" width="100%" height="325" frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes"></iframe>
</body>
</html>
