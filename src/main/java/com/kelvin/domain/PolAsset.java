package com.kelvin.domain;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.SelectBeforeUpdate;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;


/**
 * 
 * 资产包
 * 
 **/
@SuppressWarnings("serial")
@Table(name = "pol_asset")
@Entity
@DynamicInsert
@DynamicUpdate
public class PolAsset implements Serializable {

	/**资产包ID**/
	@Id
	@GeneratedValue
	private Integer id;

	/**资产包名称**/
	private String assetName;

	/**供应商编码**/
	private String supplierCode;

	/**供应商资产包编码**/
	private String supplierProdCode;

	/**资产包类型  1：代销 2：自营**/
	private Integer assetType;

	/**资产包金额**/
	private java.math.BigDecimal saleAmount;

	/**预计年化收益**/
	private java.math.BigDecimal predictYearRate;

	/**采购日期**/
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private java.util.Date purchaseDate;

	/**起息日**/
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private java.util.Date profitCaculateDate;

	/**结息日**/
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private java.util.Date profitContributeDate;

	/**供应商兑付日，多个兑付日用逗号（,）分割**/
	private String supplierRefundDate;

	/**担保方兑付日，多个兑付日用逗号（,）分割**/
	private String ensureRefundDate;

	/**可用余额**/
	private java.math.BigDecimal balanceAmount;

	/**0：未计息 1：计息中 2：已结息 8：异常**/
	private Integer statusCode;

	/**添加人**/
	private Integer addUid;

	/**添加时间**/
	private java.util.Date addTime;

	/**修改人**/
	private Integer updateUid;

	/**修改时间**/
	private java.util.Date updateTime;

	/**备注**/
	private String remark;

	/**备用字段1**/
	private String reserve1;

	/**备用字段2**/
	private String reserve2;

	/****/
	private Integer delFlag;

	/**资产包原包id**/
	private Integer assetOriginId;

	/**管理费率**/
	private java.math.BigDecimal manageFeeRate;

	/**托管费率**/
	private java.math.BigDecimal trusteeFeeRate;

	/**平台服务费率**/
	private java.math.BigDecimal serviceFeeRate;

	/**资产包到期处理方式1：本金释放；2：本息及费用释放**/
	private Integer expirationType;



	public void setId(Integer id){
		this.id = id;
	}

	public Integer getId(){
		return this.id;
	}

	public void setAssetName(String assetName){
		this.assetName = assetName;
	}

	public String getAssetName(){
		return this.assetName;
	}

	public void setSupplierCode(String supplierCode){
		this.supplierCode = supplierCode;
	}

	public String getSupplierCode(){
		return this.supplierCode;
	}

	public void setSupplierProdCode(String supplierProdCode){
		this.supplierProdCode = supplierProdCode;
	}

	public String getSupplierProdCode(){
		return this.supplierProdCode;
	}

	public void setAssetType(Integer assetType){
		this.assetType = assetType;
	}

	public Integer getAssetType(){
		return this.assetType;
	}

	public void setSaleAmount(java.math.BigDecimal saleAmount){
		this.saleAmount = saleAmount;
	}

	public java.math.BigDecimal getSaleAmount(){
		return this.saleAmount;
	}

	public void setPredictYearRate(java.math.BigDecimal predictYearRate){
		this.predictYearRate = predictYearRate;
	}

	public java.math.BigDecimal getPredictYearRate(){
		return this.predictYearRate;
	}

	public void setPurchaseDate(java.util.Date purchaseDate){
		this.purchaseDate = purchaseDate;
	}

	public java.util.Date getPurchaseDate(){
		return this.purchaseDate;
	}

	public void setProfitCaculateDate(java.util.Date profitCaculateDate){
		this.profitCaculateDate = profitCaculateDate;
	}

	public java.util.Date getProfitCaculateDate(){
		return this.profitCaculateDate;
	}

	public void setProfitContributeDate(java.util.Date profitContributeDate){
		this.profitContributeDate = profitContributeDate;
	}

	public java.util.Date getProfitContributeDate(){
		return this.profitContributeDate;
	}

	public void setSupplierRefundDate(String supplierRefundDate){
		this.supplierRefundDate = supplierRefundDate;
	}

	public String getSupplierRefundDate(){
		return this.supplierRefundDate;
	}

	public void setEnsureRefundDate(String ensureRefundDate){
		this.ensureRefundDate = ensureRefundDate;
	}

	public String getEnsureRefundDate(){
		return this.ensureRefundDate;
	}

	public void setBalanceAmount(java.math.BigDecimal balanceAmount){
		this.balanceAmount = balanceAmount;
	}

	public java.math.BigDecimal getBalanceAmount(){
		return this.balanceAmount;
	}

	public void setStatusCode(Integer statusCode){
		this.statusCode = statusCode;
	}

	public Integer getStatusCode(){
		return this.statusCode;
	}

	public void setAddUid(Integer addUid){
		this.addUid = addUid;
	}

	public Integer getAddUid(){
		return this.addUid;
	}

	public void setAddTime(java.util.Date addTime){
		this.addTime = addTime;
	}

	public java.util.Date getAddTime(){
		return this.addTime;
	}

	public void setUpdateUid(Integer updateUid){
		this.updateUid = updateUid;
	}

	public Integer getUpdateUid(){
		return this.updateUid;
	}

	public void setUpdateTime(java.util.Date updateTime){
		this.updateTime = updateTime;
	}

	public java.util.Date getUpdateTime(){
		return this.updateTime;
	}

	public void setRemark(String remark){
		this.remark = remark;
	}

	public String getRemark(){
		return this.remark;
	}

	public void setReserve1(String reserve1){
		this.reserve1 = reserve1;
	}

	public String getReserve1(){
		return this.reserve1;
	}

	public void setReserve2(String reserve2){
		this.reserve2 = reserve2;
	}

	public String getReserve2(){
		return this.reserve2;
	}

	public void setDelFlag(Integer delFlag){
		this.delFlag = delFlag;
	}

	public Integer getDelFlag(){
		return this.delFlag;
	}

	public void setAssetOriginId(Integer assetOriginId){
		this.assetOriginId = assetOriginId;
	}

	public Integer getAssetOriginId(){
		return this.assetOriginId;
	}

	public void setManageFeeRate(java.math.BigDecimal manageFeeRate){
		this.manageFeeRate = manageFeeRate;
	}

	public java.math.BigDecimal getManageFeeRate(){
		return this.manageFeeRate;
	}

	public void setTrusteeFeeRate(java.math.BigDecimal trusteeFeeRate){
		this.trusteeFeeRate = trusteeFeeRate;
	}

	public java.math.BigDecimal getTrusteeFeeRate(){
		return this.trusteeFeeRate;
	}

	public void setServiceFeeRate(java.math.BigDecimal serviceFeeRate){
		this.serviceFeeRate = serviceFeeRate;
	}

	public java.math.BigDecimal getServiceFeeRate(){
		return this.serviceFeeRate;
	}

	public void setExpirationType(Integer expirationType){
		this.expirationType = expirationType;
	}

	public Integer getExpirationType(){
		return this.expirationType;
	}

	@Override
	public String toString() {
		return "PolAsset{" +
				"id=" + id +
				", assetName='" + assetName + '\'' +
				", supplierCode='" + supplierCode + '\'' +
				", supplierProdCode='" + supplierProdCode + '\'' +
				", assetType=" + assetType +
				", saleAmount=" + saleAmount +
				", predictYearRate=" + predictYearRate +
				", purchaseDate=" + purchaseDate +
				", profitCaculateDate=" + profitCaculateDate +
				", profitContributeDate=" + profitContributeDate +
				", supplierRefundDate='" + supplierRefundDate + '\'' +
				", ensureRefundDate='" + ensureRefundDate + '\'' +
				", balanceAmount=" + balanceAmount +
				", statusCode=" + statusCode +
				", addUid=" + addUid +
				", addTime=" + addTime +
				", updateUid=" + updateUid +
				", updateTime=" + updateTime +
				", remark='" + remark + '\'' +
				", reserve1='" + reserve1 + '\'' +
				", reserve2='" + reserve2 + '\'' +
				", delFlag=" + delFlag +
				", assetOriginId=" + assetOriginId +
				", manageFeeRate=" + manageFeeRate +
				", trusteeFeeRate=" + trusteeFeeRate +
				", serviceFeeRate=" + serviceFeeRate +
				", expirationType=" + expirationType +
				'}';
	}
}
