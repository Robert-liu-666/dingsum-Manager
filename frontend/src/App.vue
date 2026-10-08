<script setup>
 import {ref} from 'vue'
 import router from './router'

 document.title = "甜点信息管理系统"
 let user=ref(JSON.parse(localStorage.getItem("user")))
 
 const handleLogin=()=>{
  localStorage.removeItem("user")
  user.value=null
  router.push('/Login')
 }
 const handleLogout=()=>{
  handleLogin()
 }
</script>
<!-- 页面布局 -->
<template>
  <div class="common-layout">
    <el-container>
      <el-header>
        甜点信息管理系统
        <div id="loginOut">
          <template v-if="user==null">
            <el-button type="text"  
              @click="handleLogin"><img src="../public/img/login.png">登录</el-button> 
          </template>
          <template v-else>
             欢迎{{user.username}}<el-button type="text"  
              @click="handleLogout"><img src="../public/img/logout.png">退出</el-button> 
          </template>
        </div>
      </el-header>
      <div class="common-layout">
        <el-container>
          <el-aside width="200px">
            <router-link to="/Register" class="nav-link module">用户注册</router-link> 
            <router-link to="/Category" class="nav-link module">分类管理</router-link> 
            <router-link to="/Dessert" class="nav-link module">甜点管理</router-link>  
          </el-aside>
          <el-main><router-view /></el-main>
        </el-container>
      </div>
      <el-footer> Copyright © 2024 </el-footer>
    </el-container>
  </div>
</template>
 
<style scoped>
body{margin:0; font-family: 微软雅黑;} 
header,footer{ width: 1000px; height: 40px; background: slateblue;text-align: center; line-height:40px;
    color: azure; position: relative;}
#loginOut{position: absolute;right:3px;top:0px;}
#loginOut .el-button--text{background-color: transparent;color:white;font-size:15px;} 
#loginOut img{ width: 15px; } 
aside{width: 100px; height: 640px; background: #a6a6a6;padding-top: 20px;} 
.module{ text-decoration: none; background: black; color:white;
    display: block;  margin: 8px auto;  width: 80%;
    height: 35px; line-height: 35px; text-align: center; border-radius: 5px;}
.module:hover{ box-shadow: 3px 3px 3px} 
</style>
