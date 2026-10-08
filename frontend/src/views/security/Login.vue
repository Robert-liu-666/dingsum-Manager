<template> 
    <el-form :rules="loginRules" ref="loginForm" :model="user"
      label-width="120px" style="width:400px;margin: 100px auto;">
      <el-form-item label="用户" prop="username">
        <el-input v-model="user.username" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item label="密码" prop="password">
        <el-input type="password" v-model="user.password" autocomplete="off"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="login">登录</el-button>
      </el-form-item>
    </el-form>
</template>
<script setup>
import * as UserService from "../../api/User"; 
import { ElMessage  } from 'element-plus';
import {  ref } from "vue"; 
import router from '../../router'
  
const user=ref({})  //与el-form中:model值同名，user.username、user.password
let loginForm = ref({}) //与el-form中ref值同名

const loginRules= {
  username:[{ required: true, message: '请输入用户名', trigger: ['submit'] }],  //prop="username"
  password:[{ required: true, message: '请输入密码', trigger: ['submit'] }],    //prop="password"
}
 
function login(){ 
    loginForm.value.validate((valid) => {
        if(!valid) {
            ElMessage.warning('登录数据有问题，请先修正')
            return false
        }else{ //登录
            UserService.login(user).then(resp=>{  
                console.log(resp) //在控制台观察响应数据resp中Token值
                if(resp.data.code==200){                          
                    ElMessage.success("登录成功！")  //可转其他组件，如/Welcome 
                    localStorage.setItem("user",JSON.stringify(resp.data.data)) 
                    //router.push('/')  // Home.vue   <router-view>
                    location.href="/"  // 重新访问 http：//localhost:8080/  index.html main.js  App.vue->bind <div #app>
                }else{
                    // ElMessage( { message: '登录，失败！', type: 'error', duration:12000});
                    ElMessage( { message: resp.data.msg, type: 'error', duration:12000});
                }                
            }).catch(error=>{ 
                if(error.response){ 
                   ElMessage( { message: '登录，异常！', type: 'error', duration:12000}); 
                } 
            }) 
        }//else
    }) 
}
</script>
