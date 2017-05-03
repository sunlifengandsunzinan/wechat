<?xml version="1.0" encoding="UTF-8" ?>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>选择二级品类</title>
<script language="JavaScript" src="<%=path%>/js/jquery-easyui-1.4/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/scrollable.js"></script>
 <script type="text/javascript" src="<%=path%>/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery-easyui-1.4/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery-easyui-1.4/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery-easyui-1.4/datagrid-detailview.js"></script>
 <script type="text/javascript" src="<%=path%>/js/ajaxfileupload.js"></script>
  <script type="text/javascript" src="<%=path%>/js/jquery.selectlayer.js"></script>

<link rel="stylesheet" type="text/css" href="<%=path%>/js/jquery-easyui-1.4/themes/gray/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/js/jquery-easyui-1.4/themes/icon.css">
<link rel="stylesheet" type="text/css" href="<%=path%>/css/style.css">

</head>
<body >

<table id="dg">  
</table> 

<script language="javascript">
var json='${data}';
alert(json);
var jsonObj = JSON.parse(json);
var ga="";
var aa= 1;
ga+="{\"total\":"+25+",\"rows\":[";
for (var one in jsonObj)  
{  
    if(aa<getJsonLength()){
	ga+="{\"fircategoryid\":"+"\""+jsonObj[one].fircategoryid+"\",\"fircategoryname\":\""+jsonObj[one].fircategoryname+"\",\"seccategoryid\":\""+jsonObj[one].seccategoryid+"\",\"seccategoryname\":\""+jsonObj[one].seccategoryname+"\"},";
    }else{
    ga+="{\"fircategoryid\":"+"\""+jsonObj[one].fircategoryid+"\",\"fircategoryname\":\""+jsonObj[one].fircategoryname+"\",\"seccategoryid\":\""+jsonObj[one].seccategoryid+"\",\"seccategoryname\":\""+jsonObj[one].seccategoryname+"\"}";
    }
    aa++;
}  
ga+="]}"; 
ha = JSON.parse(ga);

function getJsonLength(){
	var cc=0;
	for (var one in jsonObj)  
	{  
		cc++
	
	}
return cc;
}

$(function(){ 
$("#dg").datagrid({  
    url:null,//加载的URL  
    isField:"fircategoryid",  
    pagination:false,//显示分页  
    pageSize:5,//分页大小  
    pageList:[5,10,15,20],//每页的个数  
    fit:true,//自动补全  
    fitColumns:true,  
    title:"选择二级品类",  
    columns:[[      //每个列具体内容  
              {  
                  field:'fircategoryid',  
                  title:'一级品类ID',  
                  width:100,  
             },     
              {field:'fircategoryname',title:'一级品类名称',width:100},     
              {field:'seccategoryid',title:'二级品类ID',width:100},
              {field:'seccategoryname',title:'二级品类名称',width:100},
          ]]  
}).datagrid('loadData', ha);

});


</script>
</body>
</html>
