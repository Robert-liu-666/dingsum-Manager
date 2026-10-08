package com.example.prjbackend.utils.security;

import com.example.prjbackend.domain.security.User;
import io.jsonwebtoken.*;

import java.util.Date;
import java.util.UUID;

public class JwtUtil {
    static long expireMs=1000*60*30; //半小时过期 //1000*60*60 *24; // 1天后过期
    static String secretSignature="example.com";
    public static String createToken(User user){
        JwtBuilder jwtBuilder= Jwts.builder();
        return jwtBuilder.setHeaderParam("typ","JWT")
                .setHeaderParam("alg","HS256")
                .claim("username",user.getUsername())
                .setSubject("dessert-app")
                .setExpiration(new Date(System.currentTimeMillis()+expireMs))
                .setId(UUID.randomUUID().toString())
                .signWith(SignatureAlgorithm.HS256,secretSignature)
                .compact();
    }

    public static boolean isValidToken(String token) {
        try{
            Jws<Claims> claimsJws
                    = Jwts.parser().setSigningKey(secretSignature).parseClaimsJws(token);
            System.out.println(claimsJws.getBody().get("username"));
        }catch (Exception e){
            return false;
        }
        return true;
    }

    public static String verifyToken(String token) {
        try{
            Jws<Claims> claimsJws
                    = Jwts.parser().setSigningKey(secretSignature).parseClaimsJws(token);
            Claims body = claimsJws.getBody();
            Date expiration = body.getExpiration();
            long gap=expiration.getTime()-System.currentTimeMillis();
            if(gap<0){
                return null;
            }else if(gap<expireMs*0.1){  //0.1
                JwtBuilder jwtBuilder= Jwts.builder();
                return jwtBuilder.setHeaderParam("typ","JWT")
                        .setHeaderParam("alg","HS256")
                        .setClaims(body)
                        .setSubject("dessert-app")
                        .setExpiration(new Date(System.currentTimeMillis()+expireMs))
                        .setId(UUID.randomUUID().toString())
                        .signWith(SignatureAlgorithm.HS256,secretSignature)
                        .compact();
            }else {
                return token;
            }
        }catch (Exception e){
            return null;
        }


    }
}
