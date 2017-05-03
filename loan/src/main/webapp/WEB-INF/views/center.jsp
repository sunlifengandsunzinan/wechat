<?xml version="1.0" encoding="UTF-8" ?>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>云城系统经销商平台</title>
<link href="<%=path%>/css/style.css" rel="stylesheet" type="text/css" />
<link href="<%=path %>/css/imgautoplay.css" rel="stylesheet" type="text/css" />
<!--banner-->
<link rel="stylesheet" type="text/css" href="<%=path%>/css/jquery.jslides.css" media="screen" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery.jslides.js"></script>
<script type="text/javascript" src="<%=path %>/js/koala.min.1.5.js"></script>

<script type="text/javascript"> 

	$(function(){  
		//加载可切换的城市
		$.post("<%=path%>/spRegister/intSelectCity.do",
				   function(data){

			      $("#selCity").append(data);
				   });		
	});  
	

	 
	function toPRDSupply(){
		
		var id=$("#selCity").find("option:checked").attr("id");
		window.parent.location.href = "<%=path%>/spRegister/spregistersupply?type=0&&id="+id;
	}
	function toPRDStore(){
		var id=$("#selCity").find("option:checked").attr("id");
		window.parent.location.href = "<%=path%>/spRegister/spregisterstore?type=1&&id="+id;
	}
	</script>
</head>
<body>
 

<ul >
      <li><select  id="selCity" name="selCity" ></select> </li>
      <li><a href="javascript:void(0);" onclick="toPRDSupply();">注册供货商</a></li>
      <li><a href="javascript:void(0);" onclick="toPRDStore();">注册便利店</a></li>
    </ul>

<!-- 代码 结束 -->
<div class="middle">

  <div class="midtop">
    <div style="display:block; float:left;"><img src="images/midtopleft.png" width="50" height="98"/></div>
    <div class="midtopright">
      <ul>
        <li><span>56412233</span>供应信息</li>
        <li><span>56412233</span>需求信息</li>
        <li><span>56412233</span>成功洽谈</li>
        <li><a href="<%=path %>/supplyDemandManager/selectSupplyOrder" class="boton">看供应</a><a href="<%=path %>/supplyDemandManager/selectDemandOrder" class="boton">找需求</a></li>
      </ul>
    </div>
  </div>
  <div class="midtit">
    <div class="midtit_bg">供应信息</div>
    <div class="midtit_right"> <span style="color:#ff9a00;">供应商：1000000000000000位</span>&nbsp; <span style=" width:80px; text-align:right; "><a href="<%=path %>/supplyDemandManager/selectSupplyOrder" style="color:#5b5b5b; font-weight:bold;">查看更多>></a></span> </div>
    <div style="display:block; float:right; padding-right:10px;"><a href="javascript:void(0);" onclick="doAddSupply();"><img src="images/fabu.jpg" width="86" height="24"/></a></div>
  </div>
  <div class="midp">
    <div class="mid_pro">
      <div style="width:356px; height:200px; position:relative;"><a href="#"><img src="images/p-1.jpg" width="356" height="200"/></a>
        <div class="mid_black">购物休闲广场</div>
      </div>
      <div style="width:356px; height:91px;">
        <div class="mid_protimg"><img src="images/p-1n.jpg" width="82" height="82"/></div>
        <div class="mid_protext" style="margin-top:12px; font-weight:bold;"><a href="#" style="color:#5b5b5b;">公司：沈阳星摩尔购物中心</a></div>
        <div class="mid_protext"><a href="#" style="color:#5b5b5b;">城市：沈阳、抚顺、本溪</a></div>
        <div class="mid_protext"><a href="#" style="color:#5b5b5b;">经营范围：购物休闲娱乐美食</a></div>
      </div>
    </div>
    <div class="mid_pro">
      <div style="width:356px; height:200px; position:relative;"><a href="#"><img src="images/p-1.jpg" width="356" height="200"/></a>
        <div class="mid_black">购物休闲广场</div>
      </div>
      <div style="width:356px; height:91px;">
        <div class="mid_protimg"><img src="images/p-1n.jpg" width="82" height="82"/></div>
        <div class="mid_protext" style="margin-top:12px; font-weight:bold;"><a href="#" style="color:#5b5b5b;">公司：沈阳星摩尔购物中心</a></div>
        <div class="mid_protext"><a href="#" style="color:#5b5b5b;">城市：沈阳、抚顺、本溪</a></div>
        <div class="mid_protext"><a href="#" style="color:#5b5b5b;">经营范围：购物休闲娱乐美食</a></div>
      </div>
    </div>
    <div class="mid_pro" style="margin-right:0px;">
      <div style="width:356px; height:200px; position:relative;"><a href="#"><img src="images/p-1.jpg" width="356" height="200"/></a>
        <div class="mid_black">购物休闲广场</div>
      </div>
      <div style="width:356px; height:91px;">
        <div class="mid_protimg"><img src="images/p-1n.jpg" width="82" height="82"/></div>
        <div class="mid_protext" style="margin-top:12px; font-weight:bold;"><a href="#" style="color:#5b5b5b;">公司：沈阳星摩尔购物中心</a></div>
        <div class="mid_protext"><a href="#" style="color:#5b5b5b;">城市：沈阳、抚顺、本溪</a></div>
        <div class="mid_protext"><a href="#" style="color:#5b5b5b;">经营范围：购物休闲娱乐美食</a></div>
      </div>
    </div>
    <div class="mid_pro">
      <div style="width:356px; height:200px; position:relative;"><a href="#"><img src="images/p-1.jpg" width="356" height="200"/></a>
        <div class="mid_black">购物休闲广场</div>
      </div>
      <div style="width:356px; height:91px;">
        <div class="mid_protimg"><img src="images/p-1n.jpg" width="82" height="82"/></div>
        <div class="mid_protext" style="margin-top:12px; font-weight:bold;"><a href="#" style="color:#5b5b5b;">公司：沈阳星摩尔购物中心</a></div>
        <div class="mid_protext"><a href="#" style="color:#5b5b5b;">城市：沈阳、抚顺、本溪</a></div>
        <div class="mid_protext"><a href="#" style="color:#5b5b5b;">经营范围：购物休闲娱乐美食</a></div>
      </div>
    </div>
    <div class="mid_pro">
      <div style="width:356px; height:200px; position:relative;"><a href="#"><img src="images/p-1.jpg" width="356" height="200"/></a>
        <div class="mid_black">购物休闲广场</div>
      </div>
      <div style="width:356px; height:91px;">
        <div class="mid_protimg"><img src="images/p-1n.jpg" width="82" height="82"/></div>
        <div class="mid_protext" style="margin-top:12px; font-weight:bold;"><a href="#" style="color:#5b5b5b;">公司：沈阳星摩尔购物中心</a></div>
        <div class="mid_protext"><a href="#" style="color:#5b5b5b;">城市：沈阳、抚顺、本溪</a></div>
        <div class="mid_protext"><a href="#" style="color:#5b5b5b;">经营范围：购物休闲娱乐美食</a></div>
      </div>
    </div>
    <div class="mid_pro" style="margin-right:0px;">
      <div style="width:356px; height:200px; position:relative;"><a href="#"><img src="images/p-1.jpg" width="356" height="200"/></a>
        <div class="mid_black">购物休闲广场</div>
      </div>
      <div style="width:356px; height:91px;">
        <div class="mid_protimg"><img src="images/p-1n.jpg" width="82" height="82"/></div>
        <div class="mid_protext" style="margin-top:12px; font-weight:bold;"><a href="#" style="color:#5b5b5b;">公司：沈阳星摩尔购物中心</a></div>
        <div class="mid_protext"><a href="#" style="color:#5b5b5b;">城市：沈阳、抚顺、本溪</a></div>
        <div class="mid_protext"><a href="#" style="color:#5b5b5b;">经营范围：购物休闲娱乐美食</a></div>
      </div>
    </div>
  </div>
  <div class="midimg"><a href="#"><img src="images/gg.jpg" width="1096"/></a></div>
  <div class="midtit">
    <div class="midtit_bg1">需求信息</div>
    <div class="midtit_right"> <span style="color:#ff9a00;">供应商：1000000000000000位</span>&nbsp; <span style=" width:80px; text-align:right; "><a href="<%=path %>/supplyDemandManager/selectDemandOrder" style="color:#5b5b5b; font-weight:bold;">查看更多>></a></span> </div>
    <div style="display:block; float:right; padding-right:10px;"><a href="javascript:void(0);" onclick="doAddDemand();"><img src="images/fabu.jpg" width="86" height="24"/></a></div>
  </div>
  <div class="midp">
    <div class="mid_pro">
      <div style="width:356px; height:200px; position:relative;"><a href="#"><img src="images/p-1.jpg" width="356" height="200"/></a>
        <div class="mid_black">购物休闲广场</div>
      </div>
      <div style="width:356px; height:91px;">
        <div class="mid_protimg"><img src="images/p-1n.jpg" width="82" height="82"/></div>
        <div class="mid_protext" style="margin-top:12px; font-weight:bold;"><a href="#" style="color:#5b5b5b;">公司：沈阳星摩尔购物中心</a></div>
        <div class="mid_protext"><a href="#" style="color:#5b5b5b;">城市：沈阳、抚顺、本溪</a></div>
        <div class="mid_protext"><a href="#" style="color:#5b5b5b;">经营范围：购物休闲娱乐美食</a></div>
      </div>
    </div>
    <div class="mid_pro">
      <div style="width:356px; height:200px; position:relative;"><a href="#"><img src="images/p-1.jpg" width="356" height="200"/></a>
        <div class="mid_black">购物休闲广场</div>
      </div>
      <div style="width:356px; height:91px;">
        <div class="mid_protimg"><img src="images/p-1n.jpg" width="82" height="82"/></div>
        <div class="mid_protext" style="margin-top:12px; font-weight:bold;"><a href="#" style="color:#5b5b5b;">公司：沈阳星摩尔购物中心</a></div>
        <div class="mid_protext"><a href="#" style="color:#5b5b5b;">城市：沈阳、抚顺、本溪</a></div>
        <div class="mid_protext"><a href="#" style="color:#5b5b5b;">经营范围：购物休闲娱乐美食</a></div>
      </div>
    </div>
    <div class="mid_pro" style="margin-right:0px;">
      <div style="width:356px; height:200px; position:relative;"><a href="#"><img src="images/p-1.jpg" width="356" height="200"/></a>
        <div class="mid_black">购物休闲广场</div>
      </div>
      <div style="width:356px; height:91px;">
        <div class="mid_protimg"><img src="images/p-1n.jpg" width="82" height="82"/></div>
        <div class="mid_protext" style="margin-top:12px; font-weight:bold;"><a href="#" style="color:#5b5b5b;">公司：沈阳星摩尔购物中心</a></div>
        <div class="mid_protext"><a href="#" style="color:#5b5b5b;">城市：沈阳、抚顺、本溪</a></div>
        <div class="mid_protext"><a href="#" style="color:#5b5b5b;">经营范围：购物休闲娱乐美食</a></div>
      </div>
    </div>
    <div class="mid_pro">
      <div style="width:356px; height:200px; position:relative;"><a href="#"><img src="images/p-1.jpg" width="356" height="200"/></a>
        <div class="mid_black">购物休闲广场</div>
      </div>
      <div style="width:356px; height:91px;">
        <div class="mid_protimg"><img src="images/p-1n.jpg" width="82" height="82"/></div>
        <div class="mid_protext" style="margin-top:12px; font-weight:bold;"><a href="#" style="color:#5b5b5b;">公司：沈阳星摩尔购物中心</a></div>
        <div class="mid_protext"><a href="#" style="color:#5b5b5b;">城市：沈阳、抚顺、本溪</a></div>
        <div class="mid_protext"><a href="#" style="color:#5b5b5b;">经营范围：购物休闲娱乐美食</a></div>
      </div>
    </div>
    <div class="mid_pro">
      <div style="width:356px; height:200px; position:relative;"><a href="#"><img src="images/p-1.jpg" width="356" height="200"/></a>
        <div class="mid_black">购物休闲广场</div>
      </div>
      <div style="width:356px; height:91px;">
        <div class="mid_protimg"><img src="images/p-1n.jpg" width="82" height="82"/></div>
        <div class="mid_protext" style="margin-top:12px; font-weight:bold;"><a href="#" style="color:#5b5b5b;">公司：沈阳星摩尔购物中心</a></div>
        <div class="mid_protext"><a href="#" style="color:#5b5b5b;">城市：沈阳、抚顺、本溪</a></div>
        <div class="mid_protext"><a href="#" style="color:#5b5b5b;">经营范围：购物休闲娱乐美食</a></div>
      </div>
    </div>
    <div class="mid_pro" style="margin-right:0px;">
      <div style="width:356px; height:200px; position:relative;"><a href="#"><img src="images/p-1.jpg" width="356" height="200"/></a>
        <div class="mid_black">购物休闲广场</div>
      </div>
      <div style="width:356px; height:91px;">
        <div class="mid_protimg"><img src="images/p-1n.jpg" width="82" height="82"/></div>
        <div class="mid_protext" style="margin-top:12px; font-weight:bold;"><a href="#" style="color:#5b5b5b;">公司：沈阳星摩尔购物中心</a></div>
        <div class="mid_protext"><a href="#" style="color:#5b5b5b;">城市：沈阳、抚顺、本溪</a></div>
        <div class="mid_protext"><a href="#" style="color:#5b5b5b;">经营范围：购物休闲娱乐美食</a></div>
      </div>
    </div>
  </div>
  <div class="flink">
    <div class="flinkbg"><span style="display:block; float:left;">合作伙伴</span><a href="#" style="float:right; display:block; padding-top:8px; padding-right:10px;"><img src="images/flink.png" width="87" height="24"></a></div>
    <div class="img-scroll1"> <span class="prev1"></span> <span class="next1"></span>
      <div class="img-list1">
        <ul>
		 <div style="height:78px;">
          <li> <a href="#"><img src="images/flink1.jpg" width="67" height="67"/></a></li>
          <li> <a href="#"><img src="images/flink1.jpg" width="67" height="67"/></a></li>
          <li> <a href="#"><img src="images/flink1.jpg" width="67" height="67"/></a></li>
          <li> <a href="#"><img src="images/flink1.jpg" width="67" height="67"/></a></li>
          <li> <a href="#"><img src="images/flink1.jpg" width="67" height="67"/></a></li>
          <li> <a href="#"><img src="images/flink1.jpg" width="67" height="67"/></a></li>
          <li> <a href="#"><img src="images/flink1.jpg" width="67" height="67"/></a></li>
          <li> <a href="#"><img src="images/flink1.jpg" width="67" height="67"/></a></li>
          <li> <a href="#"><img src="images/flink1.jpg" width="67" height="67"/></a></li>
          <li> <a href="#"><img src="images/flink1.jpg" width="67" height="67"/></a></li>
          <li> <a href="#"><img src="images/flink1.jpg" width="67" height="67"/></a></li>
          <li> <a href="#"><img src="images/flink1.jpg" width="67" height="67"/></a></li>
          <li> <a href="#"><img src="images/flink1.jpg" width="67" height="67"/></a></li>
          <li> <a href="#"><img src="images/flink1.jpg" width="67" height="67"/></a></li>
          <li> <a href="#"><img src="images/flink1.jpg" width="67" height="67"/></a></li>
		  </div>
		  <div>
          <li> <a href="#"><img src="images/flink1.jpg" width="67" height="67"></a></li>
          <li> <a href="#"><img src="images/flink1.jpg" width="67" height="67"></a></li>
          <li> <a href="#"><img src="images/flink1.jpg" width="67" height="67"></a></li>
          <li> <a href="#"><img src="images/flink1.jpg" width="67" height="67"></a></li>
          <li> <a href="#"><img src="images/flink1.jpg" width="67" height="67"></a></li>
          <li> <a href="#"><img src="images/flink1.jpg" width="67" height="67"></a></li>
          <li> <a href="#"><img src="images/flink1.jpg" width="67" height="67"></a></li>
          <li> <a href="#"><img src="images/flink1.jpg" width="67" height="67"></a></li>
          <li> <a href="#"><img src="images/flink1.jpg" width="67" height="67"></a></li>
          <li> <a href="#"><img src="images/flink1.jpg" width="67" height="67"></a></li>
          <li> <a href="#"><img src="images/flink1.jpg" width="67" height="67"></a></li>
          <li> <a href="#"><img src="images/flink1.jpg" width="67" height="67"></a></li>
          <li> <a href="#"><img src="images/flink1.jpg" width="67" height="67"></a></li>
          <li> <a href="#"><img src="images/flink1.jpg" width="67" height="67"></a></li>
          <li> <a href="#"><img src="images/flink1.jpg" width="67" height="67"></a></li>
		  </div>
        </ul>
      </div>
      <script type="text/javascript">
    function DY_scroll(wraper,prev,next,img,speed,or)
    {
    var wraper = $(wraper);
    var prev = $(prev);
    var next = $(next);
    var img = $(img).find('ul');
    var w = img.find('li').outerWidth(true);
    var s = speed;
    next.click(function()
    {
    img.animate({'margin-left':-w},function()
    {
    img.find('li').eq(0).appendTo(img);
    img.css({'margin-left':0});
    });
    });
    prev.click(function()
    {
    img.find('li:last').prependTo(img);
    img.css({'margin-left':-w});
    img.animate({'margin-left':0});
    });
    if (or == true)
    {
    ad = setInterval(function() { next.click();},s*1000);
    wraper.hover(function(){clearInterval(ad);},function(){ad = setInterval(function() { next.click();},s*1000);});
    }
    }
    DY_scroll('.img-scroll1','.prev1','.next1','.img-list1',3,true);// true为自动播放，不加此参数或false就默认不自动
    
    
    //点击我要发布供应单按钮事件
    function doAddSupply(){
    		var json='${user}';
    		if(json == ""){
    			window.parent.location.href = "<%=path%>/login";
    		}else{
    			window.location = "<%=path%>/supplyDemandManager/addSupplyDemand?type=0";
    		}
    	
    }
    //点击我要发布需求单按钮事件
    function doAddDemand(){
		var json='${user}';
		if(json == ""){
			window.parent.location.href = "<%=path%>/login";
		}else{
			window.location = "<%=path%>/supplyDemandManager/addSupplyDemand?type=1";
		}
	
}
    </script>
    </div>
  </div>
</div>

</body>
</html>
