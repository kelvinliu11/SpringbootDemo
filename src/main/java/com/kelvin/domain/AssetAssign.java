package com.kelvin.domain;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.math.BigDecimal;


/**
 * 
 * 
 * 
 **/
@SuppressWarnings("serial")
@Table(name = "asset_assign")
@Entity
@DynamicInsert
@DynamicUpdate
public class AssetAssign implements Serializable {

	/****/
	@Id
	@GeneratedValue
	private Integer id;

	/**合作商id，关联主键id**/
	private Integer supplierId;

	/**资产包id，关联主键id**/
	private Integer assetId;

	/**销售平台名称**/
	private String supplierName;

	/**分配日期**/
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private java.util.Date assignDate;

	/**分配资产额度**/
	private java.math.BigDecimal assignAmount;

	/**年利率**/
	private java.math.BigDecimal yearRate;

	/**计算一年的天数**/
	private Integer daysOfYear;

	/**起息日期**/
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private java.util.Date profitCaculateDate;

	/**结息日期**/
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private java.util.Date profitContributeDate;

	/**利息金额**/
	private BigDecimal interest;

	/**备注**/
	private String remark;

	/**添加人姓名**/
	private String addUser;

	/****/
	private java.util.Date addTime;

	/**最后修改人**/
	private String updateUser;

	/****/
	private java.util.Date updateTime;

	/**删除标记0正常1已删除**/
	private Integer mark;



	public void setId(Integer id){
		this.id = id;
	}

	public Integer getId(){
		return this.id;
	}

	public void setSupplierName(String supplierName){
		this.supplierName = supplierName;
	}

	public String getSupplierName(){
		return this.supplierName;
	}

	public void setAssignDate(java.util.Date assignDate){
		this.assignDate = assignDate;
	}

	public java.util.Date getAssignDate(){
		return this.assignDate;
	}

	public void setAssignAmount(java.math.BigDecimal assignAmount){
		this.assignAmount = assignAmount;
	}

	public java.math.BigDecimal getAssignAmount(){
		return this.assignAmount;
	}

	public void setYearRate(java.math.BigDecimal yearRate){
		this.yearRate = yearRate;
	}

	public java.math.BigDecimal getYearRate(){
		return this.yearRate;
	}

	public void setDaysOfYear(Integer daysOfYear){
		this.daysOfYear = daysOfYear;
	}

	public Integer getDaysOfYear(){
		return this.daysOfYear;
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

	public void setRemark(String remark){
		this.remark = remark;
	}

	public String getRemark(){
		return this.remark;
	}

	public void setAddUser(String addUser){
		this.addUser = addUser;
	}

	public String getAddUser(){
		return this.addUser;
	}

	public void setAddTime(java.util.Date addTime){
		this.addTime = addTime;
	}

	public java.util.Date getAddTime(){
		return this.addTime;
	}

	public void setUpdateTime(java.util.Date updateTime){
		this.updateTime = updateTime;
	}

	public java.util.Date getUpdateTime(){
		return this.updateTime;
	}

	public void setMark(Integer mark){
		this.mark = mark;
	}

	public Integer getMark(){
		return this.mark;
	}

	public Integer getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(Integer supplierId) {
		this.supplierId = supplierId;
	}

	@Override
	public String toString() {
		return "AssetAssign{" +
				"id=" + id +
				", supplierId=" + supplierId +
				", assetId=" + assetId +
				", supplierName='" + supplierName + '\'' +
				", assignDate=" + assignDate +
				", assignAmount=" + assignAmount +
				", yearRate=" + yearRate +
				", daysOfYear=" + daysOfYear +
				", profitCaculateDate=" + profitCaculateDate +
				", profitContributeDate=" + profitContributeDate +
				", interest=" + interest +
				", remark='" + remark + '\'' +
				", addUser='" + addUser + '\'' +
				", addTime=" + addTime +
				", updateUser='" + updateUser + '\'' +
				", updateTime=" + updateTime +
				", mark=" + mark +
				'}';
	}

	public BigDecimal getInterest() {
		return interest;
	}

	public void setInterest(BigDecimal interest) {
		this.interest = interest;
	}

	public String getUpdateUser() {
		return updateUser;
	}

	public void setUpdateUser(String updateUser) {
		this.updateUser = updateUser;
	}

	public Integer getAssetId() {
		return assetId;
	}

	public void setAssetId(Integer assetId) {
		this.assetId = assetId;
	}
}
