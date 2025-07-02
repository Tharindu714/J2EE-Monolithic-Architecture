package com.tharindu.app.core.util;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Encryption {
    public static String encrypt(String password) {
//        return password;
        try{
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(password.getBytes(),0,password.length());
            BigInteger hash = new BigInteger(1, md.digest());
             return hash.toString(16);
        }catch (NoSuchAlgorithmException aex){
            throw new RuntimeException(aex);
        }
    }
}
