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

          var data = google.visualization.arrayToDataTable([
            ['age', '선호도',],
            ['10대', 8175000],
            ['20대', 3792000],
            ['30대', 2695000],
            ['40대', 2099000],
            ['50대', 1526000]
          ]);

          var options = {
            title: '나이별 선호도',
            chartArea: {width: '70%'},
            width : 620,
            height : 242,
            hAxis: {
              title: '선호도',
              minValue: 0
            },
          };

          var chart = new google.visualization.BarChart(document.getElementById('chart_div3'));

          chart.draw(data, options);
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