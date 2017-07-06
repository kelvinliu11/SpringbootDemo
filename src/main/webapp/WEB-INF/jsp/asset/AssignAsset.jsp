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
  <title>资产包分配</title>
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
<body style="background-color: white">

<div id="wrapper" style="width: 1500px;">
  <h4>资产包信息</h4>
  <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-asset">
    <thead>
    <tr>
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
      <tr class="odd gradeX">
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
    </tbody>
  </table>
  <DIV style="BORDER-TOP: #000000 1px dashed; OVERFLOW: hidden; HEIGHT: 1px"></DIV>

  <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-asset-assign">
    <thead>
    <tr>
      <th></th>
      <th>销售平台名称</th>
      <th>分配日期</th>
      <th>分配资产额度</th>
      <th>年利率</th>
      <th>起息日</th>
      <th>结息日</th>
      <th>利息金额</th>
      <th>最后修改时间</th>
      <th>最后修改人</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${assetAssigns}" var="assetAssign">
      <tr class="odd gradeX" onclick="trOnclick(${assetAssign.id})" ondblclick="trOnDblclick(${assetAssign.id})">
        <td><input type="radio" id="${assetAssign.id}" name="optionsRadios" value="${assetAssign.id}" style="margin:0 35%;"></td>
        <td>${assetAssign.supplierName}</td>
        <td>${assetAssign.assignDate}</td>
        <td>${assetAssign.assignAmount}</td>
        <td class="center">${assetAssign.yearRate}</td>
        <td class="center">${assetAssign.profitCaculateDate}</td>
        <td class="center">${assetAssign.profitContributeDate}</td>
        <td class="center">${assetAssign.interest}</td>
        <td class="center">${assetAssign.updateTime}</td>
        <td class="center">${assetAssign.updateUser}</td>
      </tr>
    </c:forEach>
    </tbody>
  </table>

  <!-- 添加分配Modal -->
  <div class="modal fade" id="addAssetAssignModal" tabindex="-1" role="dialog" aria-labelledby="addAssetAssignModalLabel">
    <div class="modal-dialog" role="document">
      <div class="modal-content" style="width: 900px; height: 480px; margin: 0 -20%;">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="addAssetAssignModalLabel">添加资产包分配</h4>
        </div>
        <div class="modal-body" style="width: 100%;">
          <iframe id="addAssetAssignModalIframe" style="width: 100%;height: 400px;"></iframe>
        </div>
      </div>
    </div>
  </div>

  <!-- 修改分配Modal -->
  <div class="modal fade" id="modifyAssetAssignModal" tabindex="-1" role="dialog" aria-labelledby="modifyAssetAssignModalLabel">
    <div class="modal-dialog" role="document">
      <div class="modal-content" style="width: 900px; height: 480px; margin: 0 -20%;">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="modifyAssetAssignModalLabel">修改资产包</h4>
        </div>
        <div class="modal-body" style="width: 100%;">
          <iframe id="modifyAssetAssignModalIframe" style="width: 100%;height: 400px;"></iframe>
        </div>
      </div>
    </div>
  </div>

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

<script>
    $(document).ready(function() {
        $('#dataTables-asset-assign').DataTable({
            responsive: true
        });
        $("#dataTables-asset-assign_filter").html("");
        $("th").removeClass("sorting");
        $("#dataTables-asset-assign_length").prepend("<span style='font-size:18px;'>资产包分配信息：</span>");
        $("#dataTables-asset-assign_length").append("" +
            "<button type=\"button\" id=\"addAssetAssignModalButton\" class=\"btn btn-info\" style=\"margin:0 10px;\"  data-toggle=\"modal\" data-target=\"#addAssetAssignModal\" onclick=\"addAssetAssignModal()\">新建</button>" +
            "<button type=\"button\" id=\"modifyAssetAssignModalButton\" class=\"btn btn-warning\" style=\"margin:0 10px;\" onclick=\"modifyAssetAssignModal()\">修改</button>" +
            "<button type=\"button\" class=\"btn btn-primary\" style=\"margin:0 10px;\" onclick='showAssetAssignHistory();'>查看</button>");
    });

    // 重置窗体modal的src
    function addAssetAssignModal() {
        var assetId = ${asset.id};
        $("#addAssetModal").modal('show');
        $("#addAssetAssignModalIframe").attr("src", "<%=request.getContextPath()%>/asset/addAssetAssign?id="+assetId);
    }

    // 重置窗体modal的src
    function modifyAssetAssignModal() {
        var assetAssignId = $("input[name='optionsRadios']:checked").val();
        if (typeof(assetAssignId)=="undefined") {
            alert("请先选中要修改的行！");
            return;
        }
        else {
            $("#modifyAssetAssignModal").modal('show');
            $("#modifyAssetAssignModalIframe").attr("src", "<%=request.getContextPath()%>/asset/modifyAssetAssign?id="+assetAssignId);
        }

    }

    // 每行记录的单击和双击事件
    var clickTimer = null;
    function trOnclick(assetAssignId) {
        if(clickTimer) {
            window.clearTimeout(clickTimer);
            clickTimer = null;
        }
        clickTimer = window.setTimeout(function(){
            // radio的选中效果
            $("input[name='optionsRadios']").removeAttr("checked");
            $("#" + assetAssignId).attr("checked", "checked");
        }, 300);
    }
    function trOnDblclick(assetId) {
        $("input[name='optionsRadios']").removeAttr("checked");
        $("#" + assetId).attr("checked", "checked");
        $("#modifyAssetAssignModalButton").trigger("click");
    }

</script>


</body>

</html>