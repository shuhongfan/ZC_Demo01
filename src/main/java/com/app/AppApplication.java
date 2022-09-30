package com.app;


import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.boot.web.support.ErrorPageFilter;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
@ServletComponentScan("com.app.servlet")
@SpringBootApplication
public class AppApplication extends SpringBootServletInitializer  {	
	
		public AppApplication() {
			// TODO Auto-generated constructor stub
			super();
			setRegisterErrorPageFilter(false);
		}
	
		 @Bean
		    public ErrorPageFilter errorPageFilter() {
		        return new ErrorPageFilter();
		    }

		    @Bean
		    public FilterRegistrationBean disableSpringBootErrorFilter(ErrorPageFilter filter) {
		         FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean();
		         filterRegistrationBean.setFilter(filter);
		         filterRegistrationBean.setEnabled(false);
		         return filterRegistrationBean;
		    }
	public static void main(String[] args) {
		 // 整个程序入口，启动springboot众筹项目，创建内置tomcat服务器，使用tomct加载springmvc注解启动类
       SpringApplication.run(AppApplication.class, args);
       
	}
	
	
	
	
	@Override
	protected SpringApplicationBuilder configure(
			SpringApplicationBuilder builder) {
		// TODO Auto-generated method stub
		return builder.sources(AppApplication.class);
	}
	
	
}
