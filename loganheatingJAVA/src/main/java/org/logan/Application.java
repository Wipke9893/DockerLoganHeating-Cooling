package org.logan;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling // Enable scheduling for the @Scheduled annotation
public class Application {

    public static void main(String[] args) {
        SpringApplication.run(Application.class, args);
    }

}