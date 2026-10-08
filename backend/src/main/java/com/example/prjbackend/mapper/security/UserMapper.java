package com.example.prjbackend.mapper.security;

import com.example.prjbackend.domain.security.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface UserMapper {

    @Select("SELECT id,username,password,active FROM t_user " +
            "where active=1 and username=#{username} ")
    User getUserByUsername(String username);
}
