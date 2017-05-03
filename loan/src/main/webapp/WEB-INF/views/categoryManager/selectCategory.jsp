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
	
	<script type="text/javascript"> 
	$(function(){  
		 $(".click").click(function(){
			  $(".tip").fadeIn(200);
			  });
			  
			  $(".tiptop a").click(function(){
			  $(".tip").fadeOut(200);
			});

			  $(".sure").click(function(){
			  $(".tip").fadeOut(100);
			});

			  $(".cancel").click(function(){
			  $(".tip").fadeOut(100);
			}); 
			
			  
	});  
	 
	function showSecCaegory(id,name){
		var t = "一级品类【"+name+"】下二级品类列表";
		$('#dlg_showSecCaegory').dialog({    
		    title: t,    
		    width: 600,    
		    height: 500,    
		    top:100,
		    closed: true,    
		    cache: false,    
		    href: '<%=path %>/categoryManager/selectSeccategoryByfircategoryId',    
		    modal: true ,
		    queryParams:{
		    	firCategoryId:id
		    }
		}); 
		$('#dlg_showSecCaegory').dialog('open');
	}
	
	function modifyFirCaegory(id){
		$('#dlg_updateFirCaegory').dialog({    
		    title: '修改一级品类',    
		    width: 600,    
		    height: 200,    
		    top:100,
		    closed: true,    
		    cache: false,    
		    href: '<%=path %>/categoryManager/updateFirCategory',    
		    modal: true ,
		    queryParams:{
		    	firId:id
		    }
		}); 
		$('#dlg_updateFirCaegory').dialog('open');
	}
	
	
	function removeFirCaegory(id){
		$.post("<%=path%>/categoryManager/validateDelFir", { firId: id },
		   function(data){
		    if(data != "true"){
		    	$.messager.alert('警告',data,'warning');
				return;
		    }else{
				//执行删除一级品类操作
		    	$.messager.confirm('提示', '确定要删除此一级品类?', function(r){
					if (r){
						$.post("<%=path%>/categoryManager/doDeleteFir", { firId: id },
							function(data){	
								
						});
					}
				});
		    }
		 });
	}
	
	
	function getRootPath_web() {
        //获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
        var curWwwPath = window.document.location.href;
        //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
        var pathName = window.document.location.pathname;
        var pos = curWwwPath.indexOf(pathName);
        //获取主机地址，如： http://localhost:8083
        var localhostPaht = curWwwPath.substring(0, pos);
        //获取带"/"的项目名，如：/uimcardprj
        var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
        return (localhostPaht + projectName);
    }


	var myloader = function(param,success,error){
        var q = param.q || '';
        if (q.length < 1){return false}
        $.post("<%=path %>/categoryManager/selectFirCategory", {q: q},function(data){
            //alert("Data Loaded: " + data);
            var jsonData = $.parseJSON(data);
            
            var items = $.map(jsonData, function(item,index){
                return {
                    id: item.id,
                    fircategoryname: item.fircategoryname
                };
            });
            success(items);
        }
        );
    }
	
	</script>
  </head>
  
  <body>
  <div class="place"> <span>位置：</span>
  <ul class="placeul">
    <li><a href="#">后台首页</a></li>
    <li><a href="#">品类管理</a></li>
    
  </ul>
</div>
 
	
	<div class="rightinfo">
  <table class="tablelist">
    <thead>
      <tr>
        <th width="25%">品类名称</th>
        <th width="25%">创建时间</th>
        <th width="25%">创建者</th>
        <th width="25%">操作</th>
      </tr>
    </thead>
    <tbody>
     
	 <c:forEach items="${list}" var="item">  
		    <tr>  
		      <td align="center" valign="middle">${item["fircategoryname"]==null?"&nbsp;":item["fircategoryname"]}</td>  
		      <td align="center" valign="middle">${item["createtime"]==null?"&nbsp;":item["createtime"]}</td>  
		      <td align="center" valign="middle">${item["createusername"]==null?"&nbsp;":item["createusername"]}</td>  
		      <td>
				<a href="JavaScript:void(0)" onclick="showSecCaegory('${item['id']}','${item['fircategoryname']}')">查看二级品类</a>
	      	  </td>
		    </tr>    
    </c:forEach>  

    </tbody>
  </table>
 
	
  
  
  <div class="pagin">
    <p:pages totalCount="${pageInfo.pageNo }" pageSize="${pageInfo.pageSize }" totalPage="${pageInfo.total }" curPage="" formId=""></p:pages>
  </div>
  
</div>



<div id="dlg_showSecCaegory"  data-options="closed:true">   
</div>
	
<div id="dlg_updateFirCaegory"  data-options="closed:true">   
</div>


<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
	</script>
	
	
	
	
	
  </body>
</html>



















