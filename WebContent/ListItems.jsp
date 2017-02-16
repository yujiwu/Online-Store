<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>	
	<title>Your Products</title>
	<meta name="viewport" content="width=device-width, initial-scale=1,
		maximum-scale=1, user-scalable=no">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="Bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="Bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
	<script type="text/javascript" src="Script/jquery-1.12.3.min.js"></script>
	<script type="text/javascript" src="Bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12 column">
				<div class="page-header">
					<h1>
						Products <small style="color:green">Happy Shopping</small>
					</h1>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-12 column">
				<table class="table table-striped">
					<thead>
						<tr class="success">
							<th>Item No.</th>
							<th>Image</th>
							<th>Name</th>
							<th>Price</th>
							<th>Category</th>
							<th>Description</th>
							<th>Operation</th>
						</tr>
					</thead>
					<tbody>
						<s:iterator value="#session.items" var="itemInfo" status="st">
							<tr <s:if test="#st.even">class="warning"</s:if>>
								<td><s:property value="#itemInfo.itemId"/></td>
								<td>
									<img alt="no-image" 
										src="<s:property value='#itemInfo.photoLoc'/>" 
										height="50px" width="50px">
								</td>
								<td><s:property value="#itemInfo.itemName"/></td>
								<td><s:property value="#itemInfo.price"/></td>
								<td><s:property value="#itemInfo.category"/></td>
								<td><s:property value="#itemInfo.description"/></td>
								<td>
									<a class="glyphicon glyphicon-remove btn"></a>
								</td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
			</div>
		</div>
		
		
	</div>
	<script type="text/javascript">
		$(function(){
			$("a").click(function(){
				if(confirm("Confirm to delete?")){
					$(this).parent().parent().remove();
					var itemId = $(this).parent().siblings(":first").text();
					var args = {"itemId":itemId, time:new Date()};
					var url = "DeleteItemsAjax";
					$.post(url, args, function(data){
						if(data != "success"){
							alert("Server Error");
						}
					});
				}
			});
		})
	</script>	
</body>
</html>
