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
        ['상품별 주문비율', 'Outer', 'TOP', 'Bottom', 'Shoes', 'ETC', 'AVG'],
        ['2017',  165,      938,         522,             998,           450,      614.6],
        ['2018',  135,      1120,        599,             1268,          288,      682],
        ['2019',  157,      1167,        587,             807,           397,      623],
        ['2020',  139,      1110,        615,             968,           215,      609.4],
        ['2021',  136,      691,         629,             1026,          366,      569.6]
      ]);

      var options = {
        title : '${mbr.mbr_id} 상품별 주문비율',
        fontSize : 15,
        width : 710,
        height : 390,
        vAxis: {title: 'Prdct'},
        hAxis: {title: '최근 5년 기준'},
        seriesType: 'bars',
        series: {5: {type: 'line'}}
      };

      var chart = new google.visualization.ComboChart(document.getElementById('chart_div7'));
      chart.draw(data, options);
    }
    </script>
</head>
<body>
	<div id="chart_div7" style="width: 720px; height: 400px;"></div>
</body>
</html>