<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    google.charts.load('current', {
        'packages': ['corechart']
      });
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = new google.visualization.DataTable();
        data.addColumn('date', '주간');
        data.addColumn('number', '판매량');

        data.addRows(
          [new Date(2021, 0, 4), 7],
          [new Date(2021, 0, 11), 7],
          [new Date(2021, 0, 18), 10],
          [new Date(2021, 0, 25), 19],
          [new Date(2021, 1, 1), 17],
          [new Date(2021, 1, 8), 13],
          [new Date(2021, 1, 15), 11],
          [new Date(2021, 1, 22), 10],
          [new Date(2021, 2, 1), 7],
          [new Date(2021, 2, 8), 3],
          [new Date(2021, 2, 15), 7],
          [new Date(2021, 2, 22), 7],
          [new Date(2021, 2, 29), 7],
        ]);


        var options = {
          title: '주간매출 그래프',
          width: 900,
          height: 500,
          hAxis: {
            format: 'M/d',
            gridlines: {
              count: 15
            }
          },
          vAxis: {
            gridlines: {
              color: 'none'
            },
            minValue: 0
          }
        };

        var chart = new google.visualization.LineChart(document.getElementById('chart_div2'));

        chart.draw(data, options);

        var button = document.getElementById('change');

        button.onclick = function() {

          // If the format option matches, change it to the new option,
          // if not, reset it to the original format.
          options.hAxis.format === 'M/d' ?
            options.hAxis.format = 'MMM dd' :
            options.hAxis.format = 'M/d';

          chart.draw(data, options);
        };
      }
    </script>

</head>
<body>
	<div id="chart">
		<div id="chart_div2"></div>
	</div>	
</body>
</html>