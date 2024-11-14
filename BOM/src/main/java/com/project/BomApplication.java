package com.project;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.SpringBootConfiguration;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.bind.annotation.GetMapping;

// Spring Boot 시작점을 알리는 어노테이션
@SpringBootApplication
// ↑는 아래 세 개의 어노테이션을 가지고 옴

@SpringBootConfiguration
// : 스프링 부트의 전반적인 환경설정 관리
@EnableAutoConfiguration
// : jar 파일을 경로상에서 배치하면 필요한 객체를 자동으로 생성
@ComponentScan
// : SpringBoot Container에 경로들을 저장하고 생성된 bean을 자동으로 연결
public class BomApplication {

   public static void main(String[] args) {
      SpringApplication.run(BomApplication.class, args);
   }
   
    @GetMapping("/")
    public String index() {
        return "index"; // "index.html"이 아니라 "index"를 반환
    }
    

   
}
