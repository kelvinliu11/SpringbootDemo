package com.kelvin.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

/**
 * @Author: Kelvin
 * @Description:
 * @Date: 2017/6/27.23:08
 */
@Controller
public class IndexController {
    // 从 application.properties 中读取配置，如取不到默认值为Hello
    @Value("${application.hello:Hello}")
    private String hello;
    @RequestMapping("/")
    public String helloJsp(Map<String, Object> map) {
        return "index";
    }

}
