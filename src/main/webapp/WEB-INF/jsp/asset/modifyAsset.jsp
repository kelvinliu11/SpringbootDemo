<!DOCTYPE html>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>修改资产包</title>

  <!-- Bootstrap Core CSS -->
  <link href="<%=request.getContextPath()%>/static/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- MetisMenu CSS -->
  <link href="<%=request.getContextPath()%>/static/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
  <!-- DataTables CSS -->
  <link href="<%=request.getContextPath()%>/static/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">
  <!-- DataTables Responsive CSS -->
  <link href="<%=request.getContextPath()%>/static/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">
  <!-- Custom CSS -->
  <link href="<%=request.getContextPath()%>/static/dist/css/sb-admin-2.css" rel="stylesheet">
  <!-- Custom Fonts -->
  <link href="<%=request.getContextPath()%>/static/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <link href="<%=request.getContextPath()%>/static/vendor/bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
  <![endif]-->

</head>

<body style="background-color: white">

<div id="wrapper" style="width: 30%;margin:0 auto;margin-left: 200px;">

  <div class="table-responsive" style="width: 500px;">
    <table class="table">
      <tbody>
      <tr>
        <td>资产包名称:</td>
        <td><input class="form-control" placeholder="合作商名称" style="display: inline;width: 200px;" id="assetName" value="${asset.assetName}"></td>
      </tr>
      <tr>
        <td>供应商名称:</td>
        <td>
          <select class="form-control" style="display: inline;width: 200px;" id="supplierCode">
            <option value="1">供应商</option>
            <option value="2">销售平台</option>
          </select>
        </td>
      </tr>
      <tr>
        <td>资产获取日期:</td>
        <td><input type="text" style="width: 120px;" value="" id="datetimepickerPurchaseDate" data-date-format="yyyy-mm-dd hh:ii"></td>
      </tr>
      <tr>
        <td>资产包总额:</td>
        <td><input class="form-control" value="${asset.saleAmount}" style="display: inline;width: 200px;" id="saleAmount"></td>
      </tr>
      <tr>
        <td>年利率:</td>
        <td><input class="form-control" value="${asset.predictYearRate}" style="display: inline;width: 200px;" id="predictYearRate"></td>
      </tr>
      <tr>
        <td>利息计算公式:</td>
        <td>资产包总额*年利率*（计息天数/<input class="form-control" style="display: inline;width: 50px;" id="daysOfYear">）</td>
      </tr>
      <tr>
        <td>起息日期:</td>
        <td><input type="text" style="width: 120px;" id="datetimepickerProfitCaculateDate" data-date-format="yyyy-mm-dd hh:ii"></td>
      </tr>
      <tr>
        <td>结息日期:</td>
        <td><input type="text" style="width: 120px;" id="datetimepickerProfitContributeDate" data-date-format="yyyy-mm-dd hh:ii"></td>
      </tr>
      <tr>
        <td>供应商兑付日1:</td>
        <td>
          <input type="text" style="width: 120px;" value="" id="datetimepickerSupplierRefundDate" data-date-format="yyyy-mm-dd hh:ii">
          <button type="button" class="btn btn-info" onclick="">新增兑付日</button>
        </td>
      </tr>
      <tr>
        <td>担保方兑付日1:</td>
        <td>
          <input type="text" style="width: 120px;" value="" id="datetimepickerGuaranteeRefundDate" data-date-format="yyyy-mm-dd hh:ii">
          <button type="button" class="btn btn-info" onclick="">新增兑付日</button>
        </td>
      </tr>
      <tr>
        <td>备注</td>
        <td>
          <textarea class="form-control" rows="3" id="remark"></textarea>
        </td>
      </tr>
      <tr>
        <td></td>
        <td>
          <button type="button" class="btn btn-default" onclick="modifyAsset();">修改</button>
        </td>
      </tr>
      </tbody>
    </table>
  </div>

</div>

<!-- jQuery -->
<script src="<%=request.getContextPath()%>/static/vendor/jquery/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="<%=request.getContextPath()%>/static/vendor/bootstrap/js/bootstrap.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="<%=request.getContextPath()%>/static/vendor/metisMenu/metisMenu.min.js"></script>
<!-- DataTables JavaScript -->
<script src="<%=request.getContextPath()%>/static/vendor/datatables/js/jquery.dataTables.min.js"></script>
<script src="<%=request.getContextPath()%>/static/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/static/vendor/datatables-responsive/dataTables.responsive.js"></script>
<!-- Custom Theme JavaScript -->
<script src="<%=request.getContextPath()%>/static/dist/js/sb-admin-2.js"></script>
<script src="<%=request.getContextPath()%>/static/vendor/bootstrap/js/bootstrap-datetimepicker.js"></script>
<script src="<%=request.getContextPath()%>/static/vendor/bootstrap/js/bootstrap-datetimepicker.fr.js"></script>

<script language="JavaScript">
    $(document).ready(function() {
        $("[id^='datetimepicker']").datetimepicker({
            format: 'yyyy-mm-dd hh:ii'
        });
        var purchaseDateStr = "${asset.purchaseDate}";
        purchaseDateStr = purchaseDateStr.substring(0, purchaseDateStr.indexOf("."));
        var date = new Date(purchaseDateStr.replace(/-/g,"/"));
        $("#datetimepickerPurchaseDate").datetimepicker('setDate', date);
        var profitCaculateDate = "${asset.profitCaculateDate}";
        profitCaculateDate = profitCaculateDate.substring(0, profitCaculateDate.indexOf("."));
        var date2 = new Date(profitCaculateDate.replace(/-/g,"/"));
        $("#datetimepickerProfitCaculateDate").datetimepicker('setDate', date2);
        var profitContributeDate = "${asset.profitContributeDate}";
        profitContributeDate = profitContributeDate.substring(0, profitContributeDate.indexOf("."));
        var date3 = new Date(profitContributeDate.replace(/-/g,"/"));
        $("#datetimepickerProfitContributeDate").datetimepicker('setDate', date3);
    });
    function modifyAsset() {
        $.ajax({
            type : "POST",  //提交方式
            url : "<%=request.getContextPath()%>/asset/modify/do",//路径
            async:false,
            data : {
                "id" : ${asset.id},
                "assetName" : $("#assetName").val(),
                "supplierCode" : $("#supplierCode:selected").val(),
                "purchaseDate" : $("#datetimepickerPurchaseDate").val()==""?null:$("#datetimepickerPurchaseDate").val()+":00",
                "saleAmount" : $("#saleAmount").val()==""?null:$("#saleAmount").val(),
                "predictYearRate" : $("#predictYearRate").val()==""?null:$("#predictYearRate").val(),
                "daysOfYear" : $("#daysOfYear").val()==""?null:$("#daysOfYear").val(),
                "profitCaculateDate" : $("#datetimepickerProfitCaculateDate").val()==""?null:$("#datetimepickerProfitCaculateDate").val()+":00",
                "profitContributeDate" : $("#datetimepickerProfitContributeDate").val()==""?null:$("#datetimepickerProfitContributeDate").val()+":00",
                "supplierRefundDate" : $("#datetimepickerSupplierRefundDate").val()==""?null:$("#datetimepickerSupplierRefundDate").val(),
                "guaranteeRefundDate" : $("#datetimepickerGuaranteeRefundDate").val()==""?null:$("#datetimepickerGuaranteeRefundDate").val(),
                "remark" : $("#remark").val()==""?null:$("#remark").val()
            },//数据，这里使用的是Json格式进行传输
            success : function(result) {//返回数据根据结果进行相应的处理
                if ( result.success ) {
                    alert("修改成功!");
                } else {
                    alert("操作失败，请稍后再试!");
                }
            }
        });
        window.location.reload();//刷新当前页面
    }
</script>
</body>

</html>