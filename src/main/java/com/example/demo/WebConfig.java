package com.example.demo;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import org.springframework.context.annotation.Configuration;
import org.springframework.http.CacheControl;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.ui.Model;

@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
//        registry.addResourceHandler("/static/**") // 정적 리소스 URL
//                .addResourceLocations("classpath:/static/") // 정적리소스의 실제 경로
//                .setCacheControl(CacheControl.maxAge(365, TimeUnit.DAYS)); // 1년 캐시 (몇년짜리 캐시할건지!!!)
        
    	registry.addResourceHandler("/models/**")
        .addResourceLocations("classpath:/static/models/")
        .setCacheControl(CacheControl.maxAge(365, TimeUnit.DAYS));
    
    	
    	registry.addResourceHandler("/profile/**")
        .addResourceLocations("file:///C:/upload/profile/");
    }
}

