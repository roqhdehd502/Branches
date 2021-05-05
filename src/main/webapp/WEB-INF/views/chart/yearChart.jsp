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
          var data = google.visualization.arrayToDataTable([
            ['Year', '판매량'],
            ['2017',  8000    ],
            ['2018',  20170     ],
            ['2019',  55060      ],
            ['2020',  49300     ],
            ['2021',  ${year.sales_sum}]
          ]);


        var options = {
          title: '${mbr.mbr_id} 연간매출',
          width: 900,
          height: 500,
          hAxis: {
            format: 'yy',
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

        var chart = new google.visualization.LineChart(document.getElementById('chart_div4'));

        chart.draw(data, options);

        var button = document.getElementById('change');

        button.onclick = function() {

          // If the format option matches, change it to the new option,
          // if not, reset it to the original format.
          options.hAxis.format === 'M/d/yy' ?
            options.hAxis.format = 'MMM dd, yyyy' :
            options.hAxis.format = 'M/d/yy';

          chart.draw(data, options);
        };
      }
    </script>

</head>
<body>
	<div id="chart">
		<div id="chart_div4"></div>
	</div>	
</body>
</html>