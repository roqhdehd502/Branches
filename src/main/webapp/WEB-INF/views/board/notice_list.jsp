<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Branches : Notice Board List</title>

	
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<table class="table">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>등록일</th>
		</tr>
		
		<c:forEach items="${notice_list}" var="dto">
        	<tr>
            	<td>${dto.board_id}</td>
				<td>${dto.board_name}</td>
				<td>${dto.board_date}</td>
       	   </tr>
       </c:forEach>  
	</table>
</body>
</html>