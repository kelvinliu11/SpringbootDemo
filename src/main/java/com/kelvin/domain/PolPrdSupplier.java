package com.kelvin.domain;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.SelectBeforeUpdate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;


/**
 * 
 * 供应商
 * 
 **/
@SuppressWarnings("serial")
@Entity
@Table(name = "supplier")
@DynamicInsert
@DynamicUpdate(value = true)
public class PolPrdSupplier implements Serializable {

	/**物理主键**/
	@Id
	@GeneratedValue
	private Integer id;

	/**供应商编码（保险以2开头）**/
	private String supplierCode;

	/**供应商名称**/
	private String supplierName;

	/**0未知1供应商2销售平台**/
	private Integer supplierType;

	/**合同url**/
	private String contractUrl;

	/**合同图片url**/
	private String contractImgUrl;

	/**添加时间**/
	private java.util.Date addTime;

	/**修改时间**/
	private java.util.Date updateTime;

	/**添加人id**/
	private Integer addUid;

	/**添加人姓名**/
	private String addUname;

	/**修改人id**/
	private Integer updateUid;

	/**修改人姓名**/
	private String updateUname;

	/**备注**/
	private String remark;

	/**备用字段1**/
	private String reserve1;

	/**备用字段2**/
	private String reserve2;

	/**删除标记**/
	private Integer delFlag;

	/**收款方名称**/
	private String receiveName;

	/**收款方账号**/
	private String receiveAccount;

	/**开户行名称**/
	private String rcvBankNameDetailed;



	public void setId(Integer id){
		this.id = id;
	}

	public Integer getId(){
		return this.id;
	}

	public void setSupplierCode(String supplierCode){
		this.supplierCode = supplierCode;
	}

	public String getSupplierCode(){
		return this.supplierCode;
	}

	public void setSupplierName(String supplierName){
		this.supplierName = supplierName;
	}

	public String getSupplierName(){
		return this.supplierName;
	}

	public void setContractUrl(String contractUrl){
		this.contractUrl = contractUrl;
	}

	public String getContractUrl(){
		return this.contractUrl;
	}

	public void setContractImgUrl(String contractImgUrl){
		this.contractImgUrl = contractImgUrl;
	}

	public String getContractImgUrl(){
		return this.contractImgUrl;
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

	public void setAddUid(Integer addUid){
		this.addUid = addUid;
	}

	public Integer getAddUid(){
		return this.addUid;
	}

	public void setAddUname(String addUname){
		this.addUname = addUname;
	}

	public String getAddUname(){
		return this.addUname;
	}

	public void setUpdateUid(Integer updateUid){
		this.updateUid = updateUid;
	}

	public Integer getUpdateUid(){
		return this.updateUid;
	}

	public void setUpdateUname(String updateUname){
		this.updateUname = updateUname;
	}

	public String getUpdateUname(){
		return this.updateUname;
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

	public void setReceiveName(String receiveName){
		this.receiveName = receiveName;
	}

	public String getReceiveName(){
		return this.receiveName;
	}

	public void setReceiveAccount(String receiveAccount){
		this.receiveAccount = receiveAccount;
	}

	public String getReceiveAccount(){
		return this.receiveAccount;
	}

	public void setRcvBankNameDetailed(String rcvBankNameDetailed){
		this.rcvBankNameDetailed = rcvBankNameDetailed;
	}

	public String getRcvBankNameDetailed(){
		return this.rcvBankNameDetailed;
	}

	public Integer getSupplierType() {
		return supplierType;
	}

	public void setSupplierType(Integer supplierType) {
		this.supplierType = supplierType;
	}
}
