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
  <title>资产包</title>
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
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
  <![endif]-->
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <style>
    .form-control-my {
      width: 110px;
      height: 26px;
      padding: 6px 12px;
      font-size: 14px;
      line-height: 1.42857143;
      color: #555;
      background-color: #fff;
      background-image: none;
      border: 1px solid #ccc;
      border-radius: 4px;
      -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
      box-shadow: inset 0 1px 1px rgba(0,0,0,.075);
      -webkit-transition: border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s;
      -o-transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
      transition: border-color ease-in-out .15s,box-shadow ease-in-out .15s;
    }
  </style>
</head>
<body>

<div id="wrapper">
  <div class="row">
    <div class="col-lg-12">
      <div class="panel panel-default" style="width: 1700px;">
        <div style="margin: 0 0 0 2%;">
          <table id="asset_table" style="width: 1700px;">
            <tbody>
            <tr>
              <td colspan="3">
                获取日期
                <input type="text" style="width: 120px;" value="" id="datetimepicker_purchase_date_start" data-date-format="yyyy-mm-dd hh:ii">
                至
                <input type="text" style="width: 120px;" value="" id="datetimepicker_purchase_date_end" data-date-format="yyyy-mm-dd hh:ii">
                起息日期
                <input type="text" style="width: 120px;" value="" id="datetimepicker_profit_caculate_date_start" data-date-format="yyyy-mm-dd hh:ii">
                至
                <input type="text" style="width: 120px;" value="" id="datetimepicker_profit_caculate_date_end" data-date-format="yyyy-mm-dd hh:ii">
                结息日期
                <input type="text" style="width: 120px;" value="" id="datetimepicker_profit_contribute_date_start" data-date-format="yyyy-mm-dd hh:ii">
                至
                <input type="text" style="width: 120px;" value="" id="datetimepicker_profit_contribute_date_end" data-date-format="yyyy-mm-dd hh:ii">
              </td>
              <%--<td><button type="button" class="btn btn-success" onclick="queryAsset()">查询</button></td>--%>
            </tr>
            <tr>
              <td>资产包名称:<input class="form-control-my" id="assetName" value="${asset.assetName}">
              供应商:
                <select class="form-control-my" style="min-width: 100px; min-height: 36px;" id="supplierCode">
                  <option value="1" <c:if test="${asset.supplierCode==1}">selected</c:if>>供应商</option>
                  <option value="2" <c:if test="${asset.supplierCode==2}">selected</c:if>>销售平台</option>
                </select>
                资产包额度
                <input class="form-control-my" id="sale_amount_start" value="">
                至
                <input class="form-control-my" id="sale_amount_end" value="">
                年利率
                <input class="form-control-my" id="predict_year_rate_start" value="">
                至
                <input class="form-control-my" id="predict_year_rate_end" value="">
              </td>
            </tr>
            <tr>
              <td>
                可分配额度≤
                <input class="form-control-my" id="balance_amount" value="${asset.balanceAmount}">
                剩余天数≤
                <input class="form-control-my" id="available_days" value="">
                <button type="button" class="btn btn-success" style="margin:0 10px;" onclick="queryAsset()">查询</button>
                <button type="button" id="addAssetModalButton" class="btn btn-info" style="margin:0 10px;"  data-toggle="modal" data-target="#addAssetModal">新建</button>
                <button type="button" id="modifyAssetModalButton" class="btn btn-warning" style="margin:0 10px;" onclick="return modifyAssetModal()">修改</button>
                <button type="button" class="btn btn-primary" style="margin:0 10px;" onclick='assignAsset();'>分配资产</button>
                <button type="button" class="btn btn-primary" style="margin:0 10px;" onclick='showAssetHistory();'>查看</button>
              </td>
            </tr>
            </tbody>
          </table>
        </div>
        <!-- /.panel-heading -->
        <div class="panel-body">
          <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-asset">
            <thead>
            <tr>
              <th></th>
              <th>资产包ID</th>
              <th>资产包名称</th>
              <th>供应商名称</th>
              <th>获取日期</th>
              <th>资产额度</th>
              <th>年利率</th>
              <th>起息日期</th>
              <th>结息日期</th>
              <th>利息金额</th>
              <th>状态</th>
              <th>剩余天数</th>
              <th>可分配额度</th>
              <th>最后修改时间</th>
              <th>最后修改人</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${assets}" var="asset">
            <tr class="odd gradeX" onclick="trOnclick(${asset.id})" ondblclick="trOnDblclick(${asset.id})">
              <td><input type="radio" id="${asset.id}" name="optionsRadios" value="${asset.id}" style="margin:0 35%;"></td>
              <td>${asset.id}</td>
              <td>${asset.assetName}</td>
              <td>${asset.supplierCode}</td>
              <td class="center">${asset.purchaseDate}</td>
              <td class="center">${asset.saleAmount}</td>
              <td class="center">${asset.predictYearRate}</td>
              <td class="center">${asset.profitCaculateDate}</td>
              <td class="center">${asset.profitContributeDate}</td>
              <td class="center">利息金额</td>
              <td class="center">${asset.statusCode}</td>
              <td class="center">剩余天数</td>
              <td class="center">${asset.balanceAmount}</td>
              <td class="center">${asset.updateTime}</td>
              <td class="center">${asset.updateUid}</td>
            </tr>
            </c:forEach>
            </tbody>
          </table>
          <!-- /.table-responsive -->
        </div>
        <!-- /.panel-body -->
      </div>
      <!-- /.panel -->
    </div>
    <!-- /.col-lg-12 -->
  </div>
  <!-- /.row -->
  <!-- 添加资产包Modal -->
  <div class="modal fade" id="addAssetModal" tabindex="-1" role="dialog" aria-labelledby="addAssetModalLabel">
    <div class="modal-dialog" role="document">
      <div class="modal-content" style="width: 900px; height: 480px; margin: 0 -20%;">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="addAssetModalLabel">添加资产包</h4>
        </div>
        <div class="modal-body" style="width: 100%;">
          <iframe src="<%=request.getContextPath()%>/asset/addAsset" style="width: 100%;height: 400px;"></iframe>
        </div>
      </div>
    </div>
  </div>

  <!-- 修改资产包Modal -->
  <div class="modal fade" id="modifyAssetModal" tabindex="-1" role="dialog" aria-labelledby="modifyAssetModalLabel">
    <div class="modal-dialog" role="document">
      <div class="modal-content" style="width: 900px; height: 480px; margin: 0 -20%;">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="modifyAssetModalLabel">修改资产包</h4>
        </div>
        <div class="modal-body" style="width: 100%;">
          <iframe id="modifyAssetModalIframe" style="width: 100%;height: 400px;"></iframe>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

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

<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<script>
    $(document).ready(function() {
        $("[id^='datetimepicker']").datetimepicker({
            format: 'yyyy-mm-dd hh:ii'      /*此属性是显示顺序，还有显示顺序是mm-dd-yyyy*/
        });
        $('#dataTables-asset').DataTable({
            responsive: true
        });
        $("th").removeClass("sorting");
        $("#dataTables-asset_filter").remove();
    });

    // 重置窗体modal的src
    function modifyAssetModal() {
        var assetId = $("input[name='optionsRadios']:checked").val();
        if (typeof(assetId)=="undefined") {
            alert("请先选中要修改的行！");
        }
        else {
            $("#modifyAssetModal").modal('show');
            $("#modifyAssetModalIframe").attr("src", "<%=request.getContextPath()%>/asset/modifyAsset?id="+assetId);
        }

    }

    // 每行记录的单击和双击事件
    var clickTimer = null;
    function trOnclick(assetId) {
        if(clickTimer) {
            window.clearTimeout(clickTimer);
            clickTimer = null;
        }
        clickTimer = window.setTimeout(function(){
            // radio的选中效果
            $("input[name='optionsRadios']").removeAttr("checked");
            $("#" + assetId).attr("checked", "checked");
        }, 300);
    }
    function trOnDblclick(assetId) {
        $("input[name='optionsRadios']").removeAttr("checked");
        $("#" + assetId).attr("checked", "checked");
        $("#modifyAssetModalButton").trigger("click");
    }

    // 分配资产
    function assignAsset() {
        var assetId = $("input[name='optionsRadios']:checked").val();
        if (typeof(assetId)=="undefined") {
            alert("请先选中要分配的资产！");
        }
        else {
            // 调用父窗体的js方法，增加一个tab页展示修改记录
            window.parent.viewActionPage('asset/assignAsset','分配资产', "?id="+assetId);
        }
    }

    function queryAsset() {
        var data = "";
        var datetimepicker_purchase_date_start = $("#datetimepicker_purchase_date_start").val();
        if (datetimepicker_purchase_date_start != '') {
            data += "&purchaseDateStart=" + datetimepicker_purchase_date_start+":00";
        }
        var datetimepicker_purchase_date_end = $("#datetimepicker_purchase_date_end").val();
        if (datetimepicker_purchase_date_end != '') {
            data += "&purchaseDateEnd=" + datetimepicker_purchase_date_end+":00";
        }
        var datetimepicker_profit_caculate_date_start = $("#datetimepicker_profit_caculate_date_start").val();
        if (datetimepicker_profit_caculate_date_start != '') {
            data += "&profitCaculateDateStart=" + datetimepicker_profit_caculate_date_start+":00";
        }
        var datetimepicker_profit_caculate_date_end = $("#datetimepicker_profit_caculate_date_end").val();
        if (datetimepicker_profit_caculate_date_end != '') {
            data += "&profitCaculateDateEnd=" + datetimepicker_profit_caculate_date_end+":00";
        }
        var datetimepicker_profit_contribute_date_start = $("#datetimepicker_profit_contribute_date_start").val();
        if (datetimepicker_profit_contribute_date_start != '') {
            data += "&profitContributeDateStart=" + datetimepicker_profit_contribute_date_start+":00";
        }
        var datetimepicker_profit_contribute_date_end = $("#datetimepicker_profit_contribute_date_end").val();
        if (datetimepicker_profit_contribute_date_end != '') {
            data += "&profitContributeDateEnd=" + datetimepicker_profit_contribute_date_end+":00";
        }
        var assetName = $("#assetName").val();
        if (assetName != '') {
            data += "&assetName=" + assetName;
        }
        /*var supplierType = $("#supplierType").val();
        if (supplierType != '') {
            data += "&supplierType=" + supplierType;
        }*/
        var sale_amount_start = $("#sale_amount_start").val();
        if (sale_amount_start != '') {
            data += "&saleAmountStart=" + sale_amount_start;
        }
        var sale_amount_end = $("#sale_amount_end").val();
        if (sale_amount_end != '') {
            data += "&saleAmountEnd=" + sale_amount_end;
        }
        var predict_year_rate_start = $("#predict_year_rate_start").val();
        if (predict_year_rate_start != '') {
            data += "&predictYearRateStart=" + predict_year_rate_start;
        }
        var predict_year_rate_end = $("#predict_year_rate_end").val();
        if (predict_year_rate_end != '') {
            data += "&predictYearRateEnd=" + predict_year_rate_end;
        }
        var balance_amount = $("#balance_amount").val();
        if (balance_amount != '') {
            data += "&balanceAmount=" + balance_amount;
        }
        var available_days = $("#available_days").val();
        if (available_days != '') {
            data += "&availableDays=" + available_days;
        }
        window.parent.refreshCurrent('showAsset', '<%=request.getContextPath()%>/asset/showAsset', data);
    }
</script>


</body>

</html>