package com.example.prjbackend.domain.security;

import lombok.Data;

@Data
public class User {
    Long id;
    String username;
    String password;
    Boolean active;
    String token;
}
