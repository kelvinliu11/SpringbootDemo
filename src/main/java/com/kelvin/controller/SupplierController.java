package com.kelvin.controller;

import com.kelvin.domain.PolPrdSupplier;
import com.kelvin.service.PrdSupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @Author: Kelvin
 * @Description:
 * @Date: 2017/7/2.21:13
 */
@Controller
public class SupplierController {

    @Autowired
    PrdSupplierService prdSupplierService;

    @RequestMapping("/supplier/queryAll")
    @ResponseBody
    public List<PolPrdSupplier> queryAllSuppliers() {
        List<PolPrdSupplier> suppliers = prdSupplierService.queryAllSuppliers();
        return suppliers;
    }
}
