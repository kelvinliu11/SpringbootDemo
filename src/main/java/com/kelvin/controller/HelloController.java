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
        userService.saveUser();
        return "Hello World=====" + serverPort;
    }

    @RequestMapping("/hello/{myName}")
    String index(@PathVariable String myName) {
        return "Hello "+myName+"!!!";
    }

}