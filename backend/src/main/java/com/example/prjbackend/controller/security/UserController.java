package com.example.prjbackend.controller.security;

import com.example.prjbackend.common.core.domain.AjaxResult;
import com.example.prjbackend.domain.security.User;
import com.example.prjbackend.service.security.UserService;
import com.example.prjbackend.utils.security.JwtUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@CrossOrigin
@RestController
public class UserController {
    @Autowired
    UserService userService;
    @PostMapping("/login")
    public AjaxResult login(@RequestBody User userForm){
        User user=userService.getUserByUsername(userForm.getUsername());
        if(user==null){
            return AjaxResult.error("用户不存在");
        }
        if(!userForm.getPassword().equals(user.getPassword())){
            return AjaxResult.error("输入密码有误");
        }
        String token= JwtUtil.createToken(user);
        user.setToken(token);
        user.setPassword(null);
        return AjaxResult.success(user);
    }

    @GetMapping("/token/isValid")
    public AjaxResult isValid(String token){ //axios.get("/token/isValid",{params:{ token:token}})
        //return JwtUtil.isValidToken(token);  //  resp.data
        String tokenRtn=JwtUtil.verifyToken(token);
        String msg;
        if(tokenRtn==null){
            msg="token过期或无效";
        }else if(token.equals(tokenRtn)){
            msg="token有效,无需续时";
        }else{
            msg="token有效,已续时";
        }
        return AjaxResult.success(msg,tokenRtn);
    }
}
