<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/include/taglib.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'message_excel.jsp' starting page</title>
    
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
	
	
  </head>
  
  <body>
	<script type="text/javascript"> 
	$(function(){  

	});  
	  
	function searchCommodity(id){
		window.location.href="<%=path%>/shoppingCart/searchCommodity?supplyid="+id; 
	}
	
	</script>
	
	<div class="rightinfo">
  <table class="tablelist">
    <thead>
      <tr>
        <th width="25%">营业执照</th>
        <th width="25%">供货商名称</th>
        <th width="25%">联系电话</th>
        <th width="25%">地址</th>
      </tr>
    </thead>
    <tbody>
     
	 <c:forEach items="${list}" var="item">  
		    <tr onclick="searchCommodity('${item.id }');" style="cursor: pointer;">  
		    	
		      <td align="center" valign="middle"><img src="<%=path%>/img/show?path=${item.img }" width="120" height="120"></td>  
		                                         
		      <td align="center" valign="middle">${item["company"]==null?"&nbsp;":item["company"]}</td>  
		      <td align="center" valign="middle">${item["phone"]==null?"&nbsp;":item["phone"]}</td>  
		      <td align="center" valign="middle">${item["address"]==null?"&nbsp;":item["address"]}</td>  
				
		    </tr>    
    </c:forEach>  

    </tbody>
  </table>
 
	
  
  
  <div class="pagin">
    <p:pages totalCount="${pageInfo.pageNo }" pageSize="${pageInfo.pageSize }" totalPage="${pageInfo.total }" curPage="" formId=""></p:pages>
  </div>
  
</div>

 

<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
	
	
	
	
	
  </body>
</html>



















