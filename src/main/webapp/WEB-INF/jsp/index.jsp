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

  <title>众邦金控资产管理系统</title>

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

  <style type="text/css">
    *{ margin:0; padding:0; border:0;}
    html,body{ height:100%; position:relative;}
    iframe{ height:100%; width:100%; overflow:auto; position:absolute; top:0; left:0;}
  </style>
</head>

<body>

<div id="wrapper">

  <!-- Navigation -->
  <%--<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0; ">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="index.html">众邦金控资产管理系统</a>
    </div>
    <!-- /.navbar-header -->

    <ul class="nav navbar-top-links navbar-right">
      <!-- /.dropdown -->
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
          <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
        </a>
        <ul class="dropdown-menu dropdown-user">
          <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
          </li>
          <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
          </li>
          <li class="divider"></li>
          <li><a href="<%=request.getContextPath()%>/"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
          </li>
        </ul>
        <!-- /.dropdown-user -->
      </li>
      <!-- /.dropdown -->
    </ul>--%>
    <!-- /.navbar-top-links -->

    <div class="navbar-default sidebar" role="navigation">
      <div class="sidebar-nav navbar-collapse">
        <ul class="nav" id="side-menu">
          <li>
            <a href="index.html"><i class="fa fa-dashboard fa-fw"></i> 首页</a>
          </li>
          <li>
            <a href="#" onclick="viewActionPage('supplier/showSupplier', '合作商管理', '');">
              <i class="fa fa-wrench fa-fw"></i>合作商管理
            </a>
            <%--<ul class="nav nav-second-level collapse" aria-expanded="false" style="height: 0px;">
              <li>
                <a href="#" onclick="viewActionPage('supplier/addSupplier', '新增供应商');">新增供应商</a>
              </li>
            </ul>--%>
          </li>
          <li>
            <a href="#" onclick="viewActionPage('asset/showAsset', '资产包管理', '');">
              <i class="fa fa-wrench fa-fw"></i>资产包管理</span>
            </a>
            <%--<ul class="nav nav-second-level collapse" aria-expanded="false" style="height: 0px;">
              <li>
                <a href="#" onclick="viewActionPage('asset/addAsset', '新增资产包');">新增资产包</a>
              </li>
            </ul>--%>
            <!-- /.nav-second-level -->
          </li>
        </ul>
      </div>
      <!-- /.sidebar-collapse -->
    </div>
    <!-- /.navbar-static-side -->
  </nav>

  <div id="page-wrapper">
    <div class="col-lg-12" style="margin-left:-30px;">
      <div class="container" style="width: 100%;">
        <ul id="myTab" class="nav nav-tabs"  style="width: 100%;">
          <li class="active" id="homeLi" onclick="navLiClick('home');">
            <a href="#homeDiv" data-toggle="tab">
              首页
            </a>
          </li>
        </ul>
        <div id="myTabContent" class="tab-content">
          <div class="tab-pane fade in active" id="homeDiv" style="margin-top:5px;">
            <div class="col-lg-3 col-md-6">
              <div class="panel panel-primary">
                <div class="panel-heading">
                  <div class="row">
                    <div class="col-xs-3">
                      <i class="fa fa-comments fa-5x"></i>
                    </div>
                    <div class="col-xs-9 text-right">
                      <div class="huge">26</div>
                      <div>分销商</div>
                    </div>
                  </div>
                </div>
                <a href="#">
                  <div class="panel-footer">
                    <span class="pull-left">View Details</span>
                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                    <div class="clearfix"></div>
                  </div>
                </a>
              </div>
            </div>
            <div class="col-lg-3 col-md-6">
              <div class="panel panel-yellow">
                <div class="panel-heading">
                  <div class="row">
                    <div class="col-xs-3">
                      <i class="fa fa-shopping-cart fa-5x"></i>
                    </div>
                    <div class="col-xs-9 text-right">
                      <div class="huge">124</div>
                      <div>资产包</div>
                    </div>
                  </div>
                </div>
                <a href="#">
                  <div class="panel-footer">
                    <span class="pull-left">View Details</span>
                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                    <div class="clearfix"></div>
                  </div>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    <!-- /.row -->
  </div>
  <!-- /#page-wrapper -->
  </div>
</div>
<!-- /#wrapper -->

<script language="JavaScript">
    function getSuffix(pathString) {
        if (pathString.indexOf("/") != -1) {
          var arr = new Array();
          arr = pathString.split("/");
          return arr[arr.length - 1];
        }
        else {
            return pathString;
        }
    }

    function viewActionPage(elementName, tabTitle, data) {
        var fullPath = elementName;
        elementName = getSuffix(elementName);
        // 移除原有标签高亮以及标签内容
        $("li").removeClass("active"); // 移除导航栏所有li标签的active属性，使其不高亮
        $(".tab-pane").removeClass("in active");// 让标签下展示的页面的内容隐藏
        $(".tab-pane").css("display", "none");

        // 展示新标签及其内容，并高亮显示
        var elementLi = "#" + elementName + "Li";
        var elementDiv = "#" + elementName + "Div";
        var elementAction = "<%=request.getContextPath()%>" + fullPath + data;
//        var elementAction = "http://csdn.net";
        if ($(elementLi).length == 0) {
            $("#myTab").append(
                "<li id=\"" + elementName + "Li\" class=\"active\"" +
                "style=\"display: block;\">" +
                "<a href=\"" + elementDiv + "\" data-toggle=\"tab\" onclick=\"navLiClick('" + elementName + "\');\"  ondblclick=\"refreshCurrent('" + elementName + "\', '" + elementAction + "\', '');\"> " + tabTitle + "</a>" +
                "</li>");
            $("#myTabContent").append("<div class=\"tab-pane fade in active\" id=\"" + elementName + "Div\" style=\"display: block;\"><section class=\"content\"><iframe id=\"" + elementName + "Iframe\" src=\"" + elementAction + "\" style=\"width: 105%; height:500px; margin:50px 0 0 10px;\"></iframe></section></div>");
        }
        else {
            $(elementLi).addClass("active");// 标签高亮显示
            $(elementLi).css("display", "block"); // 让标签显示出来
            $(elementDiv).css("display", "block");// 让标签内容显示出来
            $(elementDiv).addClass("in active");
        }
    }
    function navLiClick(elementName) {
        var elementDiv = "#" + elementName + "Div";
        $(".tab-pane").not(elementDiv).css("display", "none");
        $(elementDiv).css("display", "block");
    }
    function refreshCurrent(elementName, elementAction, data) {
      var iframeId = "#" +elementName + "Iframe";
      $(iframeId).attr("src", elementAction + data);
    }
</script>

<!-- jQuery -->
<script src="<%=request.getContextPath()%>/static/vendor/jquery/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="<%=request.getContextPath()%>/static/vendor/bootstrap/js/bootstrap.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="<%=request.getContextPath()%>/static/vendor/metisMenu/metisMenu.min.js"></script>
<!-- Morris Charts JavaScript -->
<script src="<%=request.getContextPath()%>/static/vendor/raphael/raphael.min.js"></script>
<script src="<%=request.getContextPath()%>/static/vendor/morrisjs/morris.min.js"></script>
<script src="<%=request.getContextPath()%>/static/data/morris-data.js"></script>
<!-- Custom Theme JavaScript -->
<script src="<%=request.getContextPath()%>/static/dist/js/sb-admin-2.js"></script>

</body>

</html>