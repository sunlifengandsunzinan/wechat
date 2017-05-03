<?xml version="1.0" encoding="UTF-8" ?>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>图片轮换</title>
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/css/imgautoplay.css" rel="stylesheet" type="text/css" />
<!--banner-->
<link rel="stylesheet" type="text/css" href="<%=path%>/css/jquery.jslides.css" media="screen" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery.jslides.js"></script>
<script type="text/javascript" src="<%=path %>/js/koala.min.1.5.js"></script>

<script type="text/javascript"> 
	$(function(){  
		//首页图片轮换器
		var width = document.body.clientWidth;
	});  
	Qfast.add('widgets', { path: "js/terminator2.2.min.js", type: "js", requires: ['fx'] });  
	Qfast(false, 'widgets', function () {
		K.tabs({
			id: 'fsD1',   //焦点图包裹id  
			conId: "D1pic1",  //** 大图域包裹id  
			tabId:"D1fBt",  
			tabTn:"a",
			conCn: '.fcon', //** 大图域配置class       
			auto: 1,   //自动播放 1或0
			effect: 'fade',   //效果配置
			eType: 'click', //** 鼠标事件
			pageBt:true,//是否有按钮切换页码
			bns: ['.prev', '.next'],//** 前后按钮配置class                          
			interval: 3000  //** 停顿时间  
		}) 
	}) 
	</script>
</head>
<body>
 
<!-- bannertop -->

 


  <div id="full-screen-slider" style="text-align: center;" >
  
  	<%-- <ul id="slides">
  	  <c:forEach items="${list}" var="item">  
      	<li style="background:url('<%=path%>/img/show?path=${item.imgurl}') no-repeat center top"><a href="http://${item.href }" target="_blank"></a></li>
      </c:forEach>
    </ul> --%>
    
     
    	<div align="center">
		  <div id="fsD1" class="focus" >
			<div id="D1pic1" class="fPic">
			 <c:forEach items="${list}" var="item">  
		    	<div class="fcon" style="display: none;">
					<a href="http://${item.href }" target="_blank" ><img src="<%=path%>/img/show?path=${item.imgurl}" style="opacity: 1;" width="50px" height="50px"></a> 
					<span class="shadow"><a href="http://${item.href }" target="_blank" >${item.note}</a></span>
				</div>
 			</c:forEach>  
			</div>
			
			<div class="fbg">
				<div class="D1fBt" id="D1fBt">
					<c:forEach items="${list}" var="item"> 
						<a href="javascript:void(0)" hidefocus="true" target="_self" class=""><i></i></a>
					</c:forEach> 
				</div>
			</div>
			<span class="prev"></span> <span class="next"></span>
		</div>
  	</div>
  </div>
   


</body>
</html>
