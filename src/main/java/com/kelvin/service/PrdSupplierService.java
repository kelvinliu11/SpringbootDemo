package com.kelvin.service;

import com.kelvin.dao.PrdSupplierRepository;
import com.kelvin.domain.PolPrdSupplier;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

    public List<PolPrdSupplier> queryAllSuppliers() {
        return prdSupplierRepository.findAll();
    }
}
