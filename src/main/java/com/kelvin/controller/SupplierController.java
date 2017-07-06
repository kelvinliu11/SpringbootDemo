package com.kelvin.controller;

import com.kelvin.domain.PolPrdSupplier;
import com.kelvin.service.PrdSupplierService;
import com.kelvin.vo.ResponseVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

/**
 * @Author: Kelvin
 * @Description:
 * @Date: 2017/7/2.21:13
 */
@Controller
public class SupplierController {

    private static final Logger logger = LoggerFactory.getLogger(SupplierController.class);

    @Autowired
    PrdSupplierService prdSupplierService;

    // 从 application.properties 中读取配置，如取不到默认值为Hello
    @Value("${application.hello:Hello}")
    private String hello;
    @RequestMapping("/")
    public String helloJsp(Map<String, Object> map) {
        return "index";
    }

    @RequestMapping("/supplier/showSupplier")
    public ModelAndView showSuppliers(PolPrdSupplier supplier) {
        List<PolPrdSupplier> allSuppliers = prdSupplierService.queryAllSuppliers(supplier);
        ModelAndView mv = new ModelAndView("supplier/AllSupplier");
        mv.addObject("suppliers", allSuppliers);
        mv.addObject("supplier", supplier);
        return mv;
    }

    /**
     * 展示
     * 添加合作商页面
     */
    @RequestMapping("/supplier/addSupplier")
    public ModelAndView addSupplierIndex() {
        return new ModelAndView("supplier/addSupplier");
    }

    /**
     * 执行
     * 添加合作商
     * @return
     */
    @RequestMapping("/supplier/add/do")
    @ResponseBody
    public ResponseVo doAddSupplier(PolPrdSupplier supplier) {
        ResponseVo responseVo = new ResponseVo();
        try {
            prdSupplierService.addSupplier(supplier);
            responseVo.setSuccess(true);
            responseVo.setMsg("success");
            responseVo.setData("添加成功");
        } catch (Exception e) {
            logger.error("", e);
            responseVo.setSuccess(false);
            responseVo.setMsg("fail");
        }
        return responseVo;
    }

    @RequestMapping("/supplier/modifySupplier")
    public ModelAndView modifySupplier(PolPrdSupplier supplier) {
        PolPrdSupplier dbRecord = prdSupplierService.findById(supplier.getId());
        ModelAndView mv = new ModelAndView("supplier/modifySupplier");
        mv.addObject("supplier", dbRecord);
        return mv;
    }
    /**
     * 执行
     * 添加合作商
     * @return
     */
    @RequestMapping("/supplier/modify/do")
    @ResponseBody
    public ResponseVo doModifySupplier(PolPrdSupplier supplier) {
        ResponseVo responseVo = new ResponseVo();
        try {
            prdSupplierService.modifySupplier(supplier);
            responseVo.setSuccess(true);
            responseVo.setMsg("success");
            responseVo.setData("更新成功");
        } catch (Exception e) {
            logger.error("", e);
            responseVo.setSuccess(false);
            responseVo.setMsg("fail");
        }
        return responseVo;
    }


    @RequestMapping("/supplier/queryAll")
    @ResponseBody
    public List<PolPrdSupplier> queryAllSuppliers() {
        List<PolPrdSupplier> suppliers = prdSupplierService.queryAllSuppliers(new PolPrdSupplier());
        return suppliers;
    }
}
