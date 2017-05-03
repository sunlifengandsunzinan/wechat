<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/include/taglib.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>主页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="<%=path %>/js/jquery-easyui-1.4/jquery.min.js"></script>
	<script type="text/javascript" src="<%=path %>/js/jquery-easyui-1.4/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=path %>/js/jquery-easyui-1.4/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="<%=path %>/js/jquery-easyui-1.4/datagrid-detailview.js"></script>
	
	<link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui-1.4/themes/gray/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui-1.4/themes/icon.css">
	<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
	<link href="<%=path %>/css/pages.css" rel="stylesheet" type="text/css" />
	
	<script type="text/javascript"> 
	$(function(){  
		 $('#btn').bind('click', function(){    
			 var commodityName = $("#commodityName").val();
			 var firCategoryId = $("#firCategoryId").combobox('getValue');
			 
			 
			 $('#pp').panel('open').panel('refresh','<%=path%>/shoppingCart/searchSupplier?firCategoryId='+firCategoryId +'&commodityName='+commodityName); 
		    });    

	});  
	
	 
	
	</script>
  </head>
  
  <body>
  <script type="text/javascript"> 
	
  </script>
	
	商品名：<input id="commodityName" name="commodityName" class="easyui-textbox" style="width:300px"> 
	一级品类：<select class="easyui-combobox" id="firCategoryId" name="firCategoryId" style="width:200px;">
				<option value="">全部</option>
       			<c:forEach items="${firCategoryList}" var="item">  
				     <option value="${item.id}">${item.fircategoryname}</option>  
   			    </c:forEach>  
       
            </select>
	<a href="javascript:void(0);" id="btn"  class="easyui-linkbutton" data-options="iconCls:'icon-search'" style="width:80px" >Search</a>
	
	
	<div id="pp" class="easyui-panel" style="width: 100%;height: 800px;" >    </div> 
	
	
  </body>
</html>



















