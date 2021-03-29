<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    google.charts.load('current', {packages: ['corechart', 'bar']});
    google.charts.setOnLoadCallback(drawBasic);

    function drawBasic() {

          var data = new google.visualization.DataTable();
          data.addColumn('timeofday', 'Time of Day');
          data.addColumn('number', '판매량');

          data.addRows([
            [{v: [8, 0, 0], f: '8 am'}, 1],
            [{v: [10, 0, 0], f: '10 am'}, 2],
            [{v: [12, 0, 0], f:'12 pm'}, 3],
            [{v: [14, 0, 0], f: '14 am'}, 4],
            [{v: [16, 0, 0], f: '16 pm'}, 5],
            [{v: [18, 0, 0], f: '18 pm'}, 6],
            [{v: [20, 0, 0], f: '20 pm'}, 7],
            [{v: [22, 0, 0], f: '22 pm'}, 8],
            [{v: [00, 0, 0], f: '12 am'}, 9],
          ]);

          var options = {
            title: '일간매출 그래프',
            width : 900,
            height : 500,
            hAxis: {
              format: 'h a',
              viewWindow: {
                min: [8, 00, 0],
                max: [23, 00, 0]
              }
            },
          };

          var chart = new google.visualization.ColumnChart(
            document.getElementById('chart_div1'));

          chart.draw(data, options);
        }
    </script>
</head>
<body>
	<div id="chart_div1"></div>
</body>
</html>