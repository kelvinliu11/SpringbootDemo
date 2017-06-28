package com.kelvin.controller;

import com.kelvin.service.UserServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

/**
 * 只需要类添加 @RestController 即可，默认类中的方法都会以json的格式返回
 */
@RestController
@EnableAutoConfiguration
public class HelloController {

    private static Logger logger= LoggerFactory.getLogger(HelloController.class);

    @Autowired
    UserServiceImpl userService;

    /**
     * 屬性注入：在servlet容器也能使用
     */
    @Value("${server.port}")
    private String serverPort;

    @RequestMapping("/hello")
    public String index() {
        return "Hello World222";
    }

    @RequestMapping("/")
    String home() {
        logger.info("accessing root......");
//        userService.findUser();
//        userService.saveUser();
        return "Hello World=====" + serverPort;
    }

    @RequestMapping("/hello/{myName}")
    String index(@PathVariable String myName) {
        return "Hello "+myName+"!!!";
    }

    /**
     * 这个controller最终调用的是jpa的原生sql方式：方法名已经不是按照jpa方式命名！执行的查询或更新，以方法注解为准
     * @Query注解同样可以用于更新
     */
    @RequestMapping("/jpa/sql")
    public void usingJpaWithSql() {
        userService.usingJpaWithSql();
    }
}