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
          
          
          var loadDt = new Date(); //현재 날짜 및 시간   //현재시간 기준 계산
          var before_7= new Date(Date.parse(loadDt) - 7 * 1000 * 60 * 60 * 24); //일주일전

          
          data.addRows([
        		  [new Date(loadDt), ${day.sales_sum}]	  
 
          ]);
			
          
          var options = {
            title: '${mbr.mbr_id} 오늘판매량',
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