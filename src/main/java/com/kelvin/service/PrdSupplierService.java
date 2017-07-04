package com.kelvin.service;

import com.kelvin.dao.PrdSupplierRepository;
import com.kelvin.domain.PolPrdSupplier;
import com.kelvin.utils.BeanUtilsExt;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @Author: Kelvin
 * @Description:
 * @Date: 2017/7/2.21:13
 */
@Service
public class PrdSupplierService {

    @Autowired
    PrdSupplierRepository prdSupplierRepository;

    public List<PolPrdSupplier> queryAllSuppliers(PolPrdSupplier supplier) {
        //创建匹配器，即如何使用查询条件
        ExampleMatcher matcher = ExampleMatcher.matching();
        //创建实例
        Example<PolPrdSupplier> ex = Example.of(supplier, matcher);
        //排序
        List<Sort.Order> orders=new ArrayList<Sort.Order>();
        orders.add( new Sort.Order(Sort.Direction.DESC, "addTime"));
        return prdSupplierRepository.findAll(ex, new Sort(orders));
    }

    public void addSupplier(PolPrdSupplier supplier) {
        supplier.setAddTime(new Date());
        prdSupplierRepository.save(supplier);
    }

    public PolPrdSupplier findById(Integer id) {
        return prdSupplierRepository.findOne(id);
    }

    public void modifySupplier(PolPrdSupplier supplier) {
        PolPrdSupplier dbRecord = prdSupplierRepository.findOne(supplier.getId());
        BeanUtilsExt.copyPropertiesExcludeNull(supplier, dbRecord, "id");
        prdSupplierRepository.save(dbRecord);
    }
}
