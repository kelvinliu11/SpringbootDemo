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
  <title>合作商</title>
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
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
  <![endif]-->
  <style>
    .form-control-my {
      width: 100px;
      height: 34px;
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
      <div class="panel panel-default">
        <div style="margin: 0 0 0 2%;">
          <table style="width: 100%;">
            <tbody>
            <tr>
              <td>合作商名称:<input class="form-control-my" style="width: 200px;" id="supplierName" value="${supplier.supplierName}"></td>
              <td>合作商类型:
                <select class="form-control-my" style="min-width: 200px;" id="supplierType">
                  <option value="1" <c:if test="${supplier.supplierType==1}">selected</c:if>>供应商</option>
                  <option value="2" <c:if test="${supplier.supplierType==2}">selected</c:if>>销售平台</option>
                </select>
              </td>
              <td><button type="button" class="btn btn-success" onclick="querySupplier()">查询</button></td>
            </tr>
            </tbody>
          </table>
        </div>
        <!-- /.panel-heading -->
        <div class="panel-body">
          <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
            <thead>
            <tr>
              <th></th>
              <th>合作商ID</th>
              <th>合作商名称</th>
              <th>合作商类型</th>
              <th>最后修改时间</th>
              <th>最后修改人</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${suppliers}" var="supplier">
            <tr class="odd gradeX" onclick="trOnclick(${supplier.id})" ondblclick="trOnDblclick(${supplier.id})">
              <td><input type="radio" id="${supplier.id}" name="optionsRadios" value="${supplier.id}" style="margin:0 35%;"></td>
              <td>${supplier.id}</td>
              <td>${supplier.supplierName}</td>
              <td><c:if test="${supplier.supplierType==1}">供应商</c:if><c:if test="${supplier.supplierType==2}">销售平台</c:if></td>
              <td class="center">${supplier.updateTime}</td>
              <td class="center">${supplier.updateUname}</td>
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
  <!-- 添加合作商Modal -->
  <div class="modal fade" id="addSupplierModal" tabindex="-1" role="dialog" aria-labelledby="addSupplierModalLabel">
    <div class="modal-dialog" role="document">
      <div class="modal-content" style="width: 900px; height: 300px; margin: 0 -20%;">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="addSupplierModalLabel">添加合作商</h4>
        </div>
        <div class="modal-body" style="width: 100%;">
          <iframe src="<%=request.getContextPath()%>/supplier/addSupplier" style="width: 100%;height: 200px;"></iframe>
        </div>
      </div>
    </div>
  </div>

  <!-- 修改合作商Modal -->
  <div class="modal fade" id="modifySupplierModal" tabindex="-1" role="dialog" aria-labelledby="modifySupplierModalLabel">
    <div class="modal-dialog" role="document">
      <div class="modal-content" style="width: 900px; height: 300px; margin: 0 -20%;">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="modifySupplierModalLabel">修改合作商</h4>
        </div>
        <div class="modal-body" style="width: 100%;">
          <iframe id="modifySupplierModalIframe" style="width: 100%;height: 200px;"></iframe>
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

<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
        $("#dataTables-example_filter").html("" +
            "<button type=\"button\" id=\"addSupplierModalButton\" class=\"btn btn-info\" style=\"margin:0 10px;\"  data-toggle=\"modal\" data-target=\"#addSupplierModal\">新建</button>" +
            "<button type=\"button\" id=\"modifySupplierModalButton\" class=\"btn btn-warning\" style=\"margin:0 10px;\" onclick=\"modifySupplierModal()\">修改</button>" +
            "<button type=\"button\" class=\"btn btn-primary\" style=\"margin:0 10px;\" onclick='showSupplierHistory();'>查看</button>");
    });

    // 重置窗体modal的src
    function modifySupplierModal() {
        var supplierId = $("input[name='optionsRadios']:checked").val();
        if (typeof(supplierId)=="undefined") {
            alert("请先选中要修改的行！");
            return;
        }
        else {
            $("#modifySupplierModal").modal("show");
            $("#modifySupplierModalIframe").attr("src", "<%=request.getContextPath()%>/supplier/modifySupplier?id="+supplierId);
        }
    }

    // 每行记录的单击和双击事件
    var clickTimer = null;
    function trOnclick(supplierId) {
        if(clickTimer) {
            window.clearTimeout(clickTimer);
            clickTimer = null;
        }
        clickTimer = window.setTimeout(function(){
            // radio的选中效果
            $("input[name='optionsRadios']").removeAttr("checked");
            $("#" + supplierId).attr("checked", "checked");
        }, 300);
    }
    function trOnDblclick(supplierId) {
        $("input[name='optionsRadios']").removeAttr("checked");
        $("#" + supplierId).attr("checked", "checked");
        $("#modifySupplierModalButton").trigger("click");
    }

    function showSupplierHistory() {
        // 调用父窗体的js方法，增加一个tab页展示修改记录
//        window.parent.viewActionPage('supplier/show2234','test');
    }

    function querySupplier() {
        var data = "?";
        var supplierName = $("#supplierName").val();
        if (supplierName != '') {
            data += "supplierName=" + supplierName;
        }
        var supplierType = $("#supplierType").val();
        if (supplierType != '') {
            data += "&supplierType=" + supplierType
        }
        window.parent.refreshCurrent('showSupplier', '<%=request.getContextPath()%>/supplier/showSupplier', data);
    }
</script>


</body>

</html>