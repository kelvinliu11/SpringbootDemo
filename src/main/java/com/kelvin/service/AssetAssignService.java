package com.kelvin.service;

import com.kelvin.dao.AssetAssignRepository;
import com.kelvin.domain.AssetAssign;
import com.kelvin.domain.PolAsset;
import com.kelvin.domain.PolPrdSupplier;
import com.kelvin.utils.BeanUtilsExt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author: Kelvin
 * @Description:
 * @Date: 2017/7/6.9:18
 */
@Service
public class AssetAssignService {

    @Autowired
    AssetAssignRepository assignRepository;

    public List<AssetAssign> findByAssetId(Integer assetId) {
        AssetAssign template = new AssetAssign();
        template.setAssetId(assetId);
        //创建匹配器，即如何使用查询条件
        ExampleMatcher matcher = ExampleMatcher.matching();
        //创建实例
        Example<AssetAssign> ex = Example.of(template, matcher);
        //排序
        List<Sort.Order> orders=new ArrayList<Sort.Order>();
        orders.add( new Sort.Order(Sort.Direction.DESC, "addTime"));
        return assignRepository.findAll(ex, new Sort(orders));
    }

    public AssetAssign findByAssignId(Integer assignId) {
        return assignRepository.findOne(assignId);
    }

    public void modifyAssetAssign(AssetAssign assign) {
        AssetAssign dbRecord = assignRepository.findOne(assign.getId());
        BeanUtilsExt.copyPropertiesExcludeNull(assign, dbRecord, "id");
        assignRepository.save(dbRecord);
    }

    public void save(AssetAssign assign) {
        assignRepository.save(assign);
    }
}
