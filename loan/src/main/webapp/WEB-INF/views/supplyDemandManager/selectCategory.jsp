<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/include/taglib.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base target=_self>

<title></title>
    
		<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<script type="text/javascript" src="<%=path %>/js/jquery-easyui-1.4/jquery.min.js"></script>
	<script type="text/javascript" src="<%=path %>/js/jquery-easyui-1.4/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=path %>/js/jquery-easyui-1.4/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="<%=path%>/js/jquery-easyui-1.4/datagrid-detailview.js"></script>
	
	<link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui-1.4/themes/gray/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=path %>/js/jquery-easyui-1.4/themes/icon.css">
	
	<link href="<%=path%>/css/main.css" rel="stylesheet" type="text/css" />
	<link href="<%=path%>/css/pages.css" rel="stylesheet" type="text/css" />

  </head>
  
  <body>

 	<form action="<%=path %>/supplyDemandManager/selectCategory" id="fm_selectCategory">
		<input id="ss" value="${name }" name="name"></input>
		<input type="hidden" name="ids" id="ids" />
	</form>	
	
<div class="rightinfo">
  <table class="tablelist">
    <thead>
      <tr>
        <th width="5%"></th>
        <th width="25%">一级品类名称</th>
        <th width="25%">二级品类名称</th>
      </tr>
    </thead>
    <tbody>
     
	 <c:forEach items="${list}" var="item">  
		    <tr>
		     <td align="center" valign="middle"><input type="checkbox" name="activation" id='${item.seccategoryid}' value='${item.seccategoryname}' /></td>  
		      <td align="center" valign="middle" style="display:none">${item["fircategoryid"]==null?"&nbsp;":item["fircategoryid"]}</td>  
		      <td align="center" valign="middle">${item["fircategoryname"]==null?"&nbsp;":item["fircategoryname"]}</td>  
		      <td align="center" valign="middle" style="display:none">${item["seccategoryid"]==null?"&nbsp;":item["seccategoryid"]}</td>  
			<td align="center" valign="middle">${item["seccategoryname"]==null?"&nbsp;":item["seccategoryname"]}</td>
		    </tr>    
    </c:forEach>  

    </tbody>
  </table>
 

  
  
  <div class="pagin">
    <p:pages totalCount="${pageInfo.count }" pageSize="${pageInfo.pageSize }" totalPage="${pageInfo.total }" curPage="${pageInfo.pageNo }" formId="fm_selectCategory"></p:pages>
  </div> 
  
</div>



<div class="rightinfo" align="center" style="padding-top: 100px;">

		<div class="easyui-panel" title="已选择的二级品类"
			style="width: 800px; padding: 10px 60px 10px 60px;" align="center">
<table class="tablelist" style="border:0px">
    <thead>
      <tr>
      	<th style="display:none; width="15%">ID</th>

      </tr>
    </thead>
      <tbody id ="al">
     
	 
    </tbody>
      <tbody id ="gl">
     
	 
    </tbody>
  </table>
			
</div>			
</div>

<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
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
	$(function(){ 
		
		var json='${selectData}';
		if(isEmptyObject(json)){
			return;
		}else{
			var jsonObj = JSON.parse(json);
			var t = "";
			for (var one in jsonObj)
				
			{  
				 t=t+jsonObj[one].seccategoryid+",";
            	 $('#ids').val(t);
				$('#al').append("<td align='center' valign='middle' id = '"+jsonObj[one].seccategoryid+"'>"+jsonObj[one].seccategoryname+"</td> ");
				var r=document.getElementsByName("activation");
				for(var i=0;i<r.length;i++){
					if(jsonObj[one].seccategoryid == r[i].id){
						
						$("#"+r[i].id).attr("checked",true);
					}
				}
			}  
		}
		
		
	});

	function isEmptyObject(obj){
	    for(var n in obj){return false} 
	    return true; 
	} 

	$(function(){  
		 $("input:checkbox[name='activation']").click(function(){
			 var r=document.getElementsByName("activation"); 
			 var json='${selectData}';

	    	
	    	 var $areaId=$("input[type='checkbox'][name='activation']:checked").map(function(){

	                return "{\"seccategoryname\":\""+$(this).val()+"\",\"seccategoryid\":\""+$(this).attr('id')+"\"}";  
	            }).get().join(",");

	    	 $('#al').empty();
	    	
	            var sec = "["+$areaId+"]";

	            if(sec=="[]"){
	            	 $('#al').empty();
	            }else{
	            	var jsonObj = JSON.parse(sec);
	            	var m = "";
	    			for (var one in jsonObj)
	    				
	    			{  
	    				 m=m+jsonObj[one].seccategoryid+",";
		            	 $('#ids').val(m);
	    				$('#al').append("<td align='center' valign='middle' id = '"+jsonObj[one].seccategoryid+"'>"+jsonObj[one].seccategoryname+"</td> ");

	    			} 

	            }
	           
	    		if(isEmptyObject(json)){
	    			return;
	    		}else{
	    			var jsonObj = JSON.parse(json);
	    			for (var one in jsonObj)
	    				
	    			{  
	    				var s = $('#ids').val();
	    				s = s +jsonObj[one].seccategoryid+",";
	    				$('#ids').val(s);
	    				$('#al').append("<td align='center' valign='middle' id = '"+jsonObj[one].seccategoryid+"'>"+jsonObj[one].seccategoryname+"</td> ");
	    			
	    			}  
	    		}

			    })
			  
	});
	 

  
	$(function(){ 
		$('#ss').searchbox({
		    searcher:function(value){
		    	var s = $('#ids').val();
		    	$.post("<%=path%>/supplyDemandManager/selectCategory",{name:value,ids:s},
		    			   function(data){
		    		self.location=("?name="+value+"&&ids="+s); 


		    			   });	
		    	

		    },
		    prompt:'请输入二级品类名称'
		});
	});


	</script>
	
	
	
	
	
  </body>
</html>



















