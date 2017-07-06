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

  <title>新增销售平台</title>

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
              <td>销售平台名称:</td>
              <td>
                <select class="form-control" style="display: inline;width: 200px;" id="supplierName">
                  <option value="1">供应商</option>
                  <option value="2">销售平台</option>
                </select>
              </td>
            </tr>
            <tr>
              <td>分配日期:</td>
              <td><input type="text" style="width: 120px;" value="2017-07-01 00:00" id="datetimepickerAssignDate" data-date-format="yyyy-mm-dd hh:ii"></td>
            </tr>
            <tr>
              <td>分配资产额度:</td>
              <td><input class="form-control" placeholder="分配资产额度" style="display: inline;width: 200px;" id="assignAmount"></td>
            </tr>
            <tr>
              <td>年利率:</td>
              <td><input class="form-control" placeholder="年利率" style="display: inline;width: 200px;" id="yearRate"></td>
            </tr>
            <tr>
              <td>利息计算公式:</td>
              <td>资产包总额*年利率*（计息天数/<input class="form-control" style="display: inline;width: 50px;" id="daysOfYear">）</td>
            </tr>
            <tr>
              <td>起息日期:</td>
              <td><input type="text" style="width: 120px;" value="2017-07-01 00:00" id="datetimepickerProfitCaculateDate" data-date-format="yyyy-mm-dd hh:ii"></td>
            </tr>
            <tr>
              <td>结息日期:</td>
              <td><input type="text" style="width: 120px;" value="2017-07-01 00:00" id="datetimepickerProfitContributeDate" data-date-format="yyyy-mm-dd hh:ii"></td>
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
                <button type="button" class="btn btn-default" onclick="addAssetAssign();">提交</button>
                <button type="reset" class="btn btn-default" id="resetButton">重置</button>
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
    });
    function addAssetAssign() {
        $.ajax({
            type : "POST",  //提交方式
            url : "<%=request.getContextPath()%>/asset/addAssetAssign/do",//路径
            async:false,
            data : {
                "supplierName" : $("#supplierName:selected").val(),
                "assignDate" : $("#datetimepickerAssignDate").val()==""?null:$("#datetimepickerAssignDate").val()+":00",
                "assignAmount" : $("#assignAmount").val()==""?null:$("#assignAmount").val(),
                "yearRate" : $("#yearRate").val()==""?null:$("#yearRate").val(),
                "daysOfYear" : $("#daysOfYear").val()==""?null:$("#daysOfYear").val(),
                "profitCaculateDate" : $("#datetimepickerProfitCaculateDate").val()==""?null:$("#datetimepickerProfitCaculateDate").val()+":00",
                "profitContributeDate" : $("#datetimepickerProfitContributeDate").val()==""?null:$("#datetimepickerProfitContributeDate").val()+":00",
                "remark" : $("#remark").val()==""?null:$("#remark").val()
            },//数据，这里使用的是Json格式进行传输
            success : function(result) {//返回数据根据结果进行相应的处理
                if ( result.success ) {
                    alert("添加成功!");
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