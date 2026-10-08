package com.example.prjbackend.service.security;

import com.example.prjbackend.domain.security.User;
import com.example.prjbackend.mapper.security.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    UserMapper userMapper;
    public User getUserByUsername(String username) {
        return userMapper.getUserByUsername(username);
    }
}
