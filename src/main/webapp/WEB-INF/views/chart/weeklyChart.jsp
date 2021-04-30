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
        
        var loadDt = new Date(); //현재 날짜 및 시간   //현재시간 기준 계산
        var before_7= new Date(Date.parse(loadDt) - 7 * 1000 * 60 * 60 * 24); //일주일전
        

        data.addRows([
        	[new Date(loadDt), ${week.sales_sum}],
          [new Date(before_7), 7560],


        ]);


        var options = {
          title: '주간판매',
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
		<div id="chart_div2"></div>
	</div>	
  </body>
</body>
</html>