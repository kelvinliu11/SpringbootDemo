package com.kelvin.vo.asset;

import com.kelvin.domain.PolAsset;
import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
import java.util.Date;

/**
 * @Author: Kelvin
 * @Description:
 * @Date: 2017/7/4.22:16
 */
public class AssetQueryVo extends PolAsset {

    //获取日期
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    Date purchaseDateStart;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    Date purchaseDateEnd;

    //起息日期
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    Date profitCaculateDateStart;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    Date profitCaculateDateEnd;

    //结息日期
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    Date profitCotributeDateStart;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    Date profitCotributeDateEnd;

    //资产包额度
    BigDecimal saleAmountStart;

    BigDecimal saleAmountEnd;

    //年利率
    BigDecimal predictYearRateStart;

    BigDecimal predictYearRateEnd;

    public Date getPurchaseDateStart() {
        return purchaseDateStart;
    }

    public void setPurchaseDateStart(Date purchaseDateStart) {
        this.purchaseDateStart = purchaseDateStart;
    }

    public Date getPurchaseDateEnd() {
        return purchaseDateEnd;
    }

    public void setPurchaseDateEnd(Date purchaseDateEnd) {
        this.purchaseDateEnd = purchaseDateEnd;
    }

    public Date getProfitCaculateDateStart() {
        return profitCaculateDateStart;
    }

    public void setProfitCaculateDateStart(Date profitCaculateDateStart) {
        this.profitCaculateDateStart = profitCaculateDateStart;
    }

    public Date getProfitCaculateDateEnd() {
        return profitCaculateDateEnd;
    }

    public void setProfitCaculateDateEnd(Date profitCaculateDateEnd) {
        this.profitCaculateDateEnd = profitCaculateDateEnd;
    }

    public Date getProfitCotributeDateStart() {
        return profitCotributeDateStart;
    }

    public void setProfitCotributeDateStart(Date profitCotributeDateStart) {
        this.profitCotributeDateStart = profitCotributeDateStart;
    }

    public Date getProfitCotributeDateEnd() {
        return profitCotributeDateEnd;
    }

    public void setProfitCotributeDateEnd(Date profitCotributeDateEnd) {
        this.profitCotributeDateEnd = profitCotributeDateEnd;
    }

    public BigDecimal getSaleAmountStart() {
        return saleAmountStart;
    }

    public void setSaleAmountStart(BigDecimal saleAmountStart) {
        this.saleAmountStart = saleAmountStart;
    }

    public BigDecimal getSaleAmountEnd() {
        return saleAmountEnd;
    }

    public void setSaleAmountEnd(BigDecimal saleAmountEnd) {
        this.saleAmountEnd = saleAmountEnd;
    }

    public BigDecimal getPredictYearRateStart() {
        return predictYearRateStart;
    }

    public void setPredictYearRateStart(BigDecimal predictYearRateStart) {
        this.predictYearRateStart = predictYearRateStart;
    }

    public BigDecimal getPredictYearRateEnd() {
        return predictYearRateEnd;
    }

    public void setPredictYearRateEnd(BigDecimal predictYearRateEnd) {
        this.predictYearRateEnd = predictYearRateEnd;
    }

    @Override
    public String toString() {
        return "AssetQueryVo{" +
                "purchaseDateStart=" + purchaseDateStart +
                ", purchaseDateEnd=" + purchaseDateEnd +
                ", profitCaculateDateStart=" + profitCaculateDateStart +
                ", profitCaculateDateEnd=" + profitCaculateDateEnd +
                ", profitCotributeDateStart=" + profitCotributeDateStart +
                ", profitCotributeDateEnd=" + profitCotributeDateEnd +
                ", saleAmountStart=" + saleAmountStart +
                ", saleAmountEnd=" + saleAmountEnd +
                ", predictYearRateStart=" + predictYearRateStart +
                ", predictYearRateEnd=" + predictYearRateEnd +
                '}';
    }
}
