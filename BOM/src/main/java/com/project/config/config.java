package com.project.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class config implements WebMvcConfigurer{
	@Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/uploads/**")
                .addResourceLocations("file:///C:/Users/smhrd/git/bom/BOM/src/uploads/");
        
        registry.addResourceHandler("/forComm/**")
        .addResourceLocations("file:///C:/Users/smhrd/git/bom/BOM/src/forComm/");

        registry.addResourceHandler("/stroller/**")
        .addResourceLocations("file:///C:/Users/smhrd/git/bom/BOM/src/uploads/stroller/");
        
   


        
        
    }
}
