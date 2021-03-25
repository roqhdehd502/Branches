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
    google.charts.setOnLoadCallback(drawColColors);

    function drawColColors() {
          var data = new google.visualization.DataTable();
          data.addColumn('timeofday', 'Time of Day');
          data.addColumn('number', '오늘 판매량');

          data.addRows([
            [{v: [9, 0, 0], f: '9 am'}, 1],
            [{v: [10, 0, 0], f: '10 am'}, 2],
            [{v: [11, 0, 0], f:'11 am'}, 3],
            [{v: [12, 0, 0], f: '12 pm'}, 4],
            [{v: [13, 0, 0], f: '1 pm'}, 5],
            [{v: [14, 0, 0], f: '2 pm'}, 6],
            [{v: [15, 0, 0], f: '3 pm'}, 7],
            [{v: [16, 0, 0], f: '4 pm'}, 8],
            [{v: [17, 0, 0], f: '5 pm'}, 9],
            [{v: [18, 0, 0], f: '6 pm'}, 4],
            [{v: [19, 0, 0], f: '7 pm'}, 3],
            [{v: [20, 0, 0], f: '8 pm'}, 2],
            [{v: [21, 0, 0], f: '9 pm'}, 1],
            [{v: [22, 0, 0], f: '10 pm'}, 8],
            [{v: [23, 0, 0], f: '11 pm'}, 5],
          ]);

          var options = {
            title: 'Branches 일별 판매 매출',
            colors: ['#9575cd'],
            width : 920,
            height : 550,
            hAxis: {
              title: 'Time of Day',
              format: 'h',
              viewWindow: {
                min: [9, 00, 0],
                max: [23, 00, 0]
              }
            },
          };

          var chart = new google.visualization.ColumnChart(document.getElementById('chart_div1'));
          chart.draw(data, options);
        }
    </script>
</head>
<body>
	<div id="chart_div1"></div>
</body>
</html>