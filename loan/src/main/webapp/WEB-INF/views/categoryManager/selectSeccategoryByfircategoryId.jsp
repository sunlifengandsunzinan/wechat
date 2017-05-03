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
	<link href="<%=path %>/css/style.css" rel="stylesheet" type="text/css" />
	
	<script type="text/javascript"> 
	$(function(){  
			  
	});  
	</script>
  </head>
  
  <body>
 	<script type="text/javascript"> 
 	function modifySecCategory(id){
		$('#dlg_updateSecCaegory').dialog({    
		    title: '修改二级品类',    
		    width: 600,    
		    height: 200,    
		    top:100,
		    closed: true,    
		    cache: false,    
		    href: '<%=path %>/categoryManager/updateSecCategory',    
		    modal: true ,
		    queryParams:{
		    	secId:id
		    }
		}); 
		$('#dlg_updateSecCaegory').dialog('open');
	}
 	
 	function removeSecCategory(id){
 		
 		$.messager.confirm('提示', '删除此二级品类后，二级品类下的商品会转移到默认二级品类下', function(r){
			if (r){
				$.post("<%=path%>/categoryManager/doDeleteSec", { secId: id },
					function(data){	
					$('#dlg_showSecCaegory').dialog('close');
				});
			}
		});
 	}
	
	</script>
	
  <table class="tablelist">
    <thead>
      <tr>
        <th width="20%">品类名称</th>
        <th width="20%">默认</th>
        <th width="20%">创建时间</th>
        <th width="20%">创建者</th>
        <th width="20%">操作</th>
      </tr>
    </thead>
    <tbody>
     
	 <c:forEach items="${list}" var="item">  
		    <tr>  
		      <td align="center" valign="middle">${item["seccategoryname"]==null?"&nbsp;":item["seccategoryname"]}</td>  
		      <td align="center" valign="middle">
		      	<c:if test="${item.flag==1}">
		      		默认
		      	</c:if>
		      	
		      	<c:if test="${item.flag==0}">
		      		非默认
		      	</c:if>
		      
		      </td>  
		      <td align="center" valign="middle">${item["createtime"]==null?"&nbsp;":item["createtime"]}</td>  
		      <td align="center" valign="middle">${item["createusername"]==null?"&nbsp;":item["createusername"]}</td>  
		      <td>
		      	
				
	      	  </td>
		    </tr>    
    </c:forEach>  

    </tbody>
  </table>
  <div class="pagin">
    <div class="message" style="padding-top:6px;">共<i class="blue">1256</i>条记录，当前显示第&nbsp;<i class="blue">2&nbsp;</i>页</div>
    <ul class="paginList">
      <li class="paginItem"><a href="javascript:;"><span class="pagepre"></span></a></li>
      <li class="paginItem"><a href="javascript:;">1</a></li>
      <li class="paginItem current"><a href="javascript:;">2</a></li>
      <li class="paginItem"><a href="javascript:;">3</a></li>
      <li class="paginItem"><a href="javascript:;">4</a></li>
      <li class="paginItem"><a href="javascript:;">5</a></li>
      <li class="paginItem more"><a href="javascript:;">...</a></li>
      <li class="paginItem"><a href="javascript:;">10</a></li>
      <li class="paginItem"><a href="javascript:;"><span class="pagenxt"></span></a></li>
    </ul>
  </div>
  <div class="tip">
    <div class="tiptop"><span>提示信息</span><a></a></div>
    <div class="tipinfo"> <span><img src="<%=path %>/images/ticon.png" /></span>
      <div class="tipright">
        <p>是否确认对信息的修改 ？</p>
        <cite>如果是请点击确定按钮 ，否则请点取消。</cite> </div>
    </div>
    <div class="tipbtn">
      <input name="" type="button"  class="sure" value="确定" />
      &nbsp;
      <input name="" type="button"  class="cancel" value="取消" />
    </div>
  </div>



<div id="dlg_updateSecCaegory" style="width: 400px; height: 220px; padding: 10px 20px" >
	
	
</div>
	



<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
	
	 
	
	
	
	
	
  </body>
</html>



















