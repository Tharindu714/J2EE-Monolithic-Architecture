package com.tharindu.app.core.util;

import java.io.InputStream;
import java.util.Properties;

public class Environment {
    private static final Properties properties = new Properties();

    static {
        try {
           InputStream inputStream = Environment.class.getClassLoader().getResourceAsStream("application.env");
           properties.load(inputStream);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static String getProperty(String key) {
        return properties.getProperty(key);
    }
}
