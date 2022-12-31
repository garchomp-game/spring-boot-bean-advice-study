package com.example.myapp;

import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@SpringBootApplication
public class DemoApplication implements ApplicationRunner {
  
  private final ApplicationContext appContext;
	public static void main(String[] args) {
		SpringApplication.run(DemoApplication.class, args);
	}

  @Override
  public void run(ApplicationArguments args) throws Exception {
    String[] allBeanNames = appContext.getBeanDefinitionNames();
    for(String beanName: allBeanNames) {
      log.info("Bean名: {}", beanName);
    }
  }

}
