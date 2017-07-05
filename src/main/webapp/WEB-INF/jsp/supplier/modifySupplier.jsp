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

  <title>修改合作商</title>

  <!-- Bootstrap Core CSS -->
  <link href="<%=request.getContextPath()%>/static/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- MetisMenu CSS -->
  <link href="<%=request.getContextPath()%>/static/vendor/metisMenu/metisMenu.css" rel="stylesheet">
  <!-- Custom CSS -->
  <link href="<%=request.getContextPath()%>/static/dist/css/sb-admin-2.css" rel="stylesheet">
  <!-- Morris Charts CSS -->
  <link href="<%=request.getContextPath()%>/static/vendor/morrisjs/morris.css" rel="stylesheet">
  <!-- Custom Fonts -->
  <link href="<%=request.getContextPath()%>/static/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
  <![endif]-->

</head>

<body style="background-color: white">

<div id="wrapper" style="width: 30%;margin:0 auto">

      <form role="form">
        <div class="form-group">
          <label>合作商名称</label>
          <input class="form-control" placeholder="合作商名称" style="min-width: 300px;" id="supplierName" value="${supplier.supplierName}">
        </div>
        <div class="form-group">
          <label>合作商类型</label>
          <select class="form-control" style="min-width: 300px;" id="supplierType">
            <option value="1" <c:if test="${supplier.supplierType==1}">selected</c:if>>供应商</option>
            <option value="2" <c:if test="${supplier.supplierType==2}">selected</c:if>>销售平台</option>
          </select>
        </div>
        <button type="button" class="btn btn-default" onclick="modifySupplier();">提交</button>
      </form>
</div>

<script language="JavaScript">
    function modifySupplier() {
        $.ajax({
            type : "POST",  //提交方式
            url : "<%=request.getContextPath()%>/supplier/modify/do",//路径
            async:false,
            data : {
                "id" : ${supplier.id},
                "supplierName" : $("#supplierName").val(),
                "supplierType" : $("#supplierType").val()
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

<!-- jQuery -->
<script src="<%=request.getContextPath()%>/static/vendor/jquery/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="<%=request.getContextPath()%>/static/vendor/bootstrap/js/bootstrap.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="<%=request.getContextPath()%>/static/vendor/metisMenu/metisMenu.min.js"></script>
<!-- Custom Theme JavaScript -->
<script src="<%=request.getContextPath()%>/static/dist/js/sb-admin-2.js"></script>
</body>

</html>