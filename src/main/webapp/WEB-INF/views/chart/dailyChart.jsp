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

    data.addColumn('string', '요일');

    data.addColumn('number', '방문자수(명)');

     

    data.addRows([

    ['일', ${day.order_price}],

    ['월', 2],

    ['화', 3],

    ['수', 4],

    ['일', 5],

    ['금', 6],

    ['토', 7],

    ]);

     

    var options = {

    title: '${mbr.mbr_id} 일별 매출 현황',

    hAxis: {

    title: '요일',

    viewWindow: {

    min: [7, 30, 0],

    max: [17, 30, 0]

    }

    },

    vAxis: {

    title: '방문자수(명)'

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