<?xml version="1.0" encoding="UTF-8" ?>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>
<head>
  <meta charset="UTF-8">
  <!-- 引入样式 -->
  <link rel="stylesheet" href="https://unpkg.com/element-ui/lib/theme-default/index.css">
  <script type="text/javascript" src="<%=path%>/js/jquery-1.8.0.min.js"></script>
</head>
<body>
<div id="search">
<el-input placeholder="请输入歌名/歌手/专辑" icon="search" v-model="input2" :on-icon-click="handleIconClick">
</el-input>
</div>
<div id="app">
<template>
  <el-table :data="tableData" border style="width: 100%">
    <el-table-column label="日期" width="180">
      <template scope="scope">
        <el-icon name="time"></el-icon>
        <span style="margin-left: 10px">{{ scope.row.date }}</span>
      </template>
    </el-table-column>
    <el-table-column label="姓名" width="180">
      <template scope="scope">
        <el-popover trigger="hover" placement="top">
          <p>姓名: {{ scope.row.name }}</p>
          <p>住址: {{ scope.row.address }}</p>
          <div slot="reference" class="name-wrapper">
            <el-tag>{{ scope.row.name }}</el-tag>
          </div>
        </el-popover>
      </template>
    </el-table-column>
    <el-table-column label="操作">
      <template scope="scope">
        <el-button size="small" @click="handleEdit(scope.$index, scope.row)">播放</el-button>
      </template>
    </el-table-column>
  </el-table>
</template>
</div>
</body>
  <!-- 先引入 Vue -->
  <script src="https://unpkg.com/vue/dist/vue.js"></script>
  <!-- 引入组件库 -->
  <script src="https://unpkg.com/element-ui/lib/index.js"></script>
  <script>
  var Main = {
		    data() {
		      return {
		        tableData: [{
		          date: '2016-05-02',
		          name: '王小虎',
		          address: '上海市普陀区金沙江路 1518 弄'
		        }, {
		          date: '2016-05-04',
		          name: '王小虎',
		          address: '上海市普陀区金沙江路 1517 弄'
		        }, {
		          date: '2016-05-01',
		          name: '王小虎',
		          address: '上海市普陀区金沙江路 1519 弄'
		        }, {
		          date: '2016-05-03',
		          name: '王小虎',
		          address: '上海市普陀区金沙江路 1516 弄'
		        }]
		      }
		    },
		    methods: {
		      handleEdit(index, row) {
		        console.log(index, row);
		      },
		      handleDelete(index, row) {
		        console.log(index, row);
		      }
		    }
		  }
		var Ctor = Vue.extend(Main)
		new Ctor().$mount('#app')
		
var Search = {
  data() {
    return {
      input2: ''
    }
  },
  methods: {
    handleIconClick(ev) {
      console.log(ev);
          $.ajax({
              type: 'GET',
              data:{str:this.input2},
              url: './dosearch',
              success:function(data) {
                 console.log(data)
              }
          });      
    }
  }
}
var Ctor1 = Vue.extend(Search)
new Ctor1().$mount('#search')
  </script>
  
</html>