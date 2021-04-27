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
          data.addColumn('date', 'Day');
          data.addColumn('number', '판매량');

          data.addRows([
              [new Date(${week.order_date}), ${week.sales_sum}],
          ]);

          var options = {
            title: '일간판매',
            fontSize : 15,
            height: 300,
            hAxis: {
              format: 'd',

            },
            vAxis: {
  
            }
          };

          var chart = new google.visualization.ColumnChart(
            document.getElementById('chart_div1'));

          chart.draw(data, options);
        }
    </script>
</head>
<body>
	<div id="chart">
		<div id="chart_div1"></div>
	</div>	
</body>
</html>