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
          data.addColumn('number', 'Month');
          data.addColumn('number', 'Sales');
          data.addRows([
          [{v: 3, f:'Apr'}, ${month.sales_sum}]
      ]);

        var options = {
          title: '월간매출 그래프',
          width: 900,
          height: 500,
          hAxis: {
            format: 'M/d',
            gridlines: {
              count: 15
            },
            ticks: [{v: 0, f:'Jan'},{v: 1, f:'Feb'},{v: 2, f:'Mar'},{v: 3, f:'Apr'}
            ,{v: 4, f:'May'},{v: 5, f:'Jun'},{v: 6, f:'Jul'},{v: 7, f:'Aug'},{v: 8, f:'Sep'}
            ,{v: 9, f:'Oct'},{v: 10, f:'Nov'},{v: 11, f:'Dec'}], 
          },
          vAxis: {
            gridlines: {
              color: 'none'
            },
            minValue: 0
          }
        };

        var chart = new google.visualization.LineChart(document.getElementById('chart_div3'));

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
		<div id="chart_div3"></div>
	</div>	
  </body>
</body>
</html>