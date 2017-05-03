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
	  
	 function inShonppingCart(id,registerid){
		 
		 $.messager.confirm('购物车', '确定将此商品放入购物车?', function(r){
             if (r){
            	 
            	 
            	 
            	 
            	 $.post("<%=path%>/shoppingCart/inShoppingCart", { registerid: id, registerCommoditid: registerid },
          			   function(data){
	            		 $.messager.show({
	                         title:'放入购物车',
	                         msg:'此商品已存入购物车.',
	                         timeout:5000,
	                         showType:'slide'
	                     });
          			   });
             }
         });
		 
		 
	 }
	
	
	
	</script>
	
	<div class="rightinfo">
  <table class="tablelist">
    <thead>
      <tr>
        <th width="30%">公司名称</th>
        <th width="30%">商品名称</th>
        <th width="20%">价格</th>
        <th width="20%">操作</th>
      </tr>
    </thead>
    <tbody>
     
	 <c:forEach items="${list}" var="item">  
		    <tr>  
		    
		      <td align="center" valign="middle">${item["supplycompany"]==null?"&nbsp;":item["supplycompany"]}</td>  
		      <td align="center" valign="middle">${item["commodityname"]==null?"&nbsp;":item["commodityname"]}</td>  
		      <td align="center" valign="middle">${item["price"]==null?"&nbsp;":item["price"]}</td>  
			  <td align="center" valign="middle"> <a href="javascript:void(0);" onclick="inShonppingCart('${item.id}','${item.supplyuserid}')" >放入购物车</a> </td>
				
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



















