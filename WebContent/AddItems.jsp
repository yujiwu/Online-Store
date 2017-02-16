<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<!-- 分别为:屏幕宽度和设备一致、初始缩放比例、最大缩放比例和禁止用户缩放 -->
	<meta name="viewport" content="width=device-width, initial-scale=1,
		maximum-scale=1, user-scalable=no">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Add Items</title>
	<link href="Bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="Bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
	
</head>
<body style="margin:50px">
	<div class="container">
		<div class="row">
			<div class="col-md-4 column"></div>
			
			<div class="col-md-4 column">
				<div class="page-header">
					<h1>
						Add-Items <small style="color:purple">Happy Shopping</small>
					</h1>
				</div>
				
				<form action="AddItemsAction" method="post" enctype="multipart/form-data">
					
					<div class="form-group">
						<label>Item Name</label>
						<input type="text" name="itemName" 
								class="form-control"
								placeholder="Enter Name"/>
					</div>
					
					<div class="form-group">
						<label>Item Price</label> 
						<div class="input-group">
							<span class="input-group-addon">$</span> 
							<input type="text" name="price" 
								   class="form-control" placeholder="Enter Price"/>
							<span class="input-group-addon">.00</span>
						</div>
					</div>
					
					<div class="form-group">
						<label>Description</label>
						<input type="text" name="description"
								class="form-control"
								placeholder="Enter Description Of The Item"/>
					</div>
					
					<div class="form-group">
						<label>Category</label>
						<select class="form-control" name="category">
							<option>Model</option>
						    <option>Electric</option>
						    <option>Book</option>
						    <option>Food</option>
						    <option>Clean</option>
						</select>
					</div>
					
					<div class="form-group">
						<label>Photo</label>
						<input type="file" name="photo"/>
					</div>
					
					<div class="form-group">
						<button class="btn btn-primary btn-large">Finish</button>
						<a href="Main.jsp" class="btn btn-primary btn-large">Back</a>
					</div>
				</form>
			</div>
			
			<div class="col-md-4 column"></div>
		</div>
	</div>
	
	<script type="text/javascript" src="Script/jquery-1.12.3.min.js"></script>
	<script type="text/javascript" src="Bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$("input[name=price]").change(function(){
				var ex = /^\d+$/;
				//test if the input number is an integer
				if (!ex.test($(this).val())) {
					$(this).parent().prev().append(
					"<font color='red'> has to be an integer</font>");
				}
			});
		})
	</script>
</body>
</html>