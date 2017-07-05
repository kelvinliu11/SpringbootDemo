package com.kelvin.service;

import com.kelvin.dao.PolAssetRepository;
import com.kelvin.domain.PolAsset;
import com.kelvin.jpa.parameter.LinkEnum;
import com.kelvin.jpa.parameter.Operator;
import com.kelvin.jpa.parameter.PredicateBuilder;
import com.kelvin.utils.BeanUtilsExt;
import com.kelvin.vo.asset.AssetQueryVo;
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
public class AssetService {

    @Autowired
    PolAssetRepository assetRepository;

    public List<PolAsset> queryAllAssets(AssetQueryVo assetVo) {
        PolAsset asset = new PolAsset();
        PredicateBuilder pb = new PredicateBuilder();
        if (assetVo.getPurchaseDateStart() != null) {
            //这种用法，是我们查询的值与purchaseDate值的大小进行对比
            pb.add("purchaseDate", assetVo.getPurchaseDateStart(), LinkEnum.GE);
        }
        if (assetVo.getPurchaseDateEnd() != null) {
            //这种用法，是我们查询的值与purchaseDate值的大小进行对比
            pb.add("purchaseDate", assetVo.getPurchaseDateEnd(), LinkEnum.LE);
        }
        if (assetVo.getProfitCaculateDateStart() != null) {
            //这种用法，是我们查询的值与purchaseDate值的大小进行对比
            pb.add("profitCaculateDate", assetVo.getProfitCaculateDateStart(), LinkEnum.GE);
        }
        if (assetVo.getProfitCaculateDateEnd() != null) {
            //这种用法，是我们查询的值与purchaseDate值的大小进行对比
            pb.add("profitCaculateDate", assetVo.getProfitCaculateDateEnd(), LinkEnum.LE);
        }
        if (assetVo.getProfitCotributeDateStart() != null) {
            //这种用法，是我们查询的值与purchaseDate值的大小进行对比
            pb.add("profitCotributeDate", assetVo.getProfitCotributeDateStart(), LinkEnum.GE);
        }
        if (assetVo.getProfitCotributeDateEnd() != null) {
            //这种用法，是我们查询的值与purchaseDate值的大小进行对比
            pb.add("profitCotributeDate", assetVo.getProfitCotributeDateEnd(), LinkEnum.LE);
        }
        if (assetVo.getSaleAmountStart() != null) {
            pb.add("saleAmount", assetVo.getSaleAmountStart(), LinkEnum.GE);
        }
        if (assetVo.getSaleAmountEnd() != null) {
            pb.add("saleAmount", assetVo.getSaleAmountEnd(), LinkEnum.LE);
        }
        if (assetVo.getPredictYearRateStart() != null) {
            pb.add("predictYearRate", assetVo.getPredictYearRateStart(), LinkEnum.GE);
        }
        if (assetVo.getPredictYearRateEnd() != null) {
            pb.add("predictYearRate", assetVo.getPredictYearRateEnd(), LinkEnum.LE);
        }
        if (assetVo.getAssetName() != null) {
            pb.add("assetName", assetVo.getAssetName(), LinkEnum.EQ);
        }
        // 供应商
        if (assetVo.getBalanceAmount() != null) {
            pb.add("balanceAmount", assetVo.getBalanceAmount(), LinkEnum.GE);
        }
        // 剩余天数

        return assetRepository.findAll(pb.build(), Operator.AND);
    }

    public void addAsset(PolAsset asset) {
        asset.setAddTime(new Date());
        assetRepository.save(asset);
    }

    public PolAsset findById(Integer id) {
        return assetRepository.findOne(id);
    }

    public void modifyAsset(PolAsset asset) {
        PolAsset dbRecord = assetRepository.findOne(asset.getId());
        BeanUtilsExt.copyPropertiesExcludeNull(asset, dbRecord, "id");
        assetRepository.save(dbRecord);
    }
}
