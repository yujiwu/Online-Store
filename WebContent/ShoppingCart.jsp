<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>	
	<title>Your Shopping Cart</title>
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
						Shopping-Cart <small style="color:orange">Happy Shopping</small>
					</h1>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-12 column">
				<form action="PayAction" method="post">
					<table class="table table-striped">
						<thead>
							<tr class="success">
								<th>Item No.</th>
								<th>Image</th>
								<th>Name</th>
								<th>Price</th>
								<th>Category</th>
								<th>Description</th>
								<th>Quantity</th>
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
										<div class="input-group" style="width:150px">
											<a href="#" class="input-group-addon btn" name="a1">
												<span class="glyphicon glyphicon-minus"></span></a> 
											<input type="text" name="quantity" value="1"
												class="form-control"/>
											<a href="#" class="input-group-addon btn" name="a2">
												<span class="glyphicon glyphicon-plus"/></span></a>
										</div>
									</td>
									<td>
										<div class="form-group checkbox">
											<label><a class="glyphicon glyphicon-remove btn" 
												name="a3"></a>Delete  |</label>
											<label>
												<input type="checkbox" name="checkBox" 
												value="<s:property value="#itemInfo.price"/>"/>Choose
											</label>
										</div>
									</td>
								</tr>
							</s:iterator>
						</tbody>
					</table>
					<h1>Total: $<big>0</big></h1>
					<s:actionerror/>
					<button class="btn btn-primary large pull-right">Checkout & Pay</button>
				</form>
			</div>
		</div>
		
		
	</div>
	
	<script type="text/javascript">
		$(function(){
			$("input[name=quantity]").change(function(){
				var ex = /^\d+$/;
				//test if the input number is an integer
				if (!ex.test($(this).val())) {
					alert("Quantity has to be an integer");
				}
			});
			
			$("a[name=a1]").click(function(){
				var $quantity = $(this).next();
				var currentVal = $quantity.val();
				if(currentVal >= 1){
					$quantity.val(currentVal-1);
				}
			});
			
			$("a[name=a2]").click(function(){
				var $quantity = $(this).prev();
				//For default, JQuery consider the return value of 
				//$quantity.val() is a string. In order to convert it 
				//to an integer, *1 is a efficient way.
				$quantity.val($quantity.val()*1+1);
			});
			
			$("a[name=a3]").click(function(){
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
			
			$(":checkbox").click(function(){
				var currentPrice = $("big").text();
				var itemPrice = $(this).val();
				var quantity = $(this).parent().parent().parent()
							.prev().children().children(":nth-child(2)")
							.val();
				var itemId = $(this).parent().parent()
							.parent().parent().children(":first").text();
				if(this.checked){
					var checked = 1;
				}else{
					var checked = 0;
				}
				
				var args = {"checked":checked, "currentPrice":currentPrice, 
						    "quantity":quantity, "itemPrice":itemPrice, 
						    "itemId":itemId, time:new Date()};
				var url = "CartPriceCountAjax";
				$.post(url, args, function(data){
					if(data != null){
						$("big").text(data);
					}else{
						alert("Server Error");
					}
				});
			});
		})
	</script>	
</body>
</html>