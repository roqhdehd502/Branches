<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawVisualization);

      function drawVisualization() {
        // Some raw data (not necessarily accurate)
        var data = google.visualization.arrayToDataTable([
          ['Years', 'Outer', 'Top', 'bottom', 'Shoes', 'ETC', 'AVG'],
          ['2017',  165,      938,         522,             998,           450,      614.6],
          ['2018',  135,      1120,        599,             1268,          288,      682],
          ['2019',  157,      1167,        587,             807,           397,      623],
          ['2020',  139,      1110,        615,             968,           215,      609.4],
          ['2021',  136,      691,         629,             1026,          366,      569.6]
        ]);

        var options = {
          title : '카테고리별 전체상품 매출',
          fontSize : 14,
          hAxis: {title: '지난 5년간 매출'},
          seriesType: 'bars',
          width : 900,
          height : 500,
          series: {5: {type: 'line'}}
        };

        var chart = new google.visualization.ComboChart(document.getElementById('chart_div6'));
        chart.draw(data, options);
      }
    </script>
</head>
<body>
	<div id="chart_div6" style="width: 900px; height: 500px;"></div>
</body>
</html>