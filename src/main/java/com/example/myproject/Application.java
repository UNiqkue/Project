package com.example.myproject;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@ComponentScan({"com.example.myproject"})
@EntityScan("com.example.myproject.domain")
@EnableJpaRepositories("com.example.myproject.repos")
public class Application {
    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }
}
