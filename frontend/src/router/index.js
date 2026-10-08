import {createRouter,createWebHistory} from 'vue-router' 
import Register from "../views/Register.vue"
import Category from "../views/Category.vue"
import Dessert from "../views/Dessert.vue"

import Login from "../views/security/Login.vue"
import { ElMention, ElMessage } from 'element-plus'

import * as userService from '../api/User'


// 路由规则，定义URL地址与组件之间的对应关系
const routes = [
    { path: '/', name:'Home', component: () => import('../views/Home.vue') }, 
    { path: '/Register', name:'Register', component:Register },  
    { path: '/Category', name:'Category', component:Category }, 
    { path: '/Dessert', name:'Dessert', component:Dessert },  
    
    { path: '/Login', name:'Login', component:Login },  
]
const router = createRouter({
    history: createWebHistory(),
    routes: routes
}) 
//路由导航守卫
router.beforeEach((to,from,next)=>{
    if(to.path=="/"){
        next()  //Home.vue
    }else if(to.path.indexOf("/Login")>=0){
        localStorage.removeItem("user")
        next()
    }else{
        let user=JSON.parse(localStorage.getItem("user"))
        if(!user){
            ElMessage.warning("请先登录")
            next({path:'/Login'})
        }else{
            userService.isValidToken(user.token)
                .then(resp=>{
                    // if(!resp.data){  //false/true
                    //     ElMessage.warning("Token失效，请先登录")
                    //     next({path:'/Login'})
                    // }else{
                    //     next()
                    // }
                    let tokenRtn=resp.data.data  // AjaxReturn  resp.data  .code  .msg .data
                    console.log("tokenRtn:"+tokenRtn,"\nuser.token:"+user.token)
                    if(tokenRtn==null){ // 失效，异常
                        localStorage.removeItem("user")
                        ElMessage.warning("请先登录")
                        location.href="/Login"  //App.vue index.html中 #app    vs next({path:'/'})   router.push("/")-- <router-view>
                    }else{ //tokenRtn == token,  tokenRtn newToken
                        if(user.token!=tokenRtn){
                            user.token=tokenRtn
                            localStorage.setItem("user",JSON.stringify(user)) 
                        }
                        next()
                    }
                })
        }
    }
})
 

export default router
