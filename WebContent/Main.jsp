<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Pokemon Store</title>
	<meta name="viewport" content="width=device-width, initial-scale=1,
		maximum-scale=1, user-scalable=no">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="Bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="Bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
	<style type="text/css">
		a:focus {
	       outline: none;
	    }
	    .carousel-control {
	       font-size: 50px;
	    }
	    .center{
	    	text-align: center;
	    }
	</style>	
</head>

<body style="margin:30px">

	<div class="container">
		<nav class="navbar navbar-default navbar-fixed">

			<div class="nav-header">
				<a href="/OnlineStore/Main.jsp" class="navbar-brand">Pokemon Store</a>
				<button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#list">
					<span class="glyphicon glyphicon-align-justify"/>
				</button>
			</div>
			
			<div class="navbar-collapse collapse" id="list">
				<ul class="nav navbar-nav">
					<li class="active">
						<s:if test="%{#session.login == 'true' && #session.user.role == 'Customer'}">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								<span class="glyphicon glyphicon-user"/>
								<s:property value="%{#session.user.username}"/>
							</a>
							
							<ul class="dropdown-menu">
								<li><a href="SignOutAction" class="glyphicon glyphicon-off"> Sign-Out</a></li> 
								<li><a href="ShoppingCartAction" class="glyphicon glyphicon-shopping-cart"> Shopping-Cart</a></li>
								<li><a href="ShoppingHistoryAction" class="glyphicon glyphicon-time"> Shopping-History</a></li>
								<li><a href="#" class="glyphicon glyphicon-folder-open"> Profile</a></li>
							</ul>
						</s:if>
						<s:elseif test="%{#session.login == 'true' && #session.user.role == 'Seller'}">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								<span class="glyphicon glyphicon-user"/>
								<s:property value="%{#session.user.username}"/>
							</a>
							
							<ul class="dropdown-menu">
								<li><a href="SignOutAction" class="glyphicon glyphicon-off"> Sign-Out</a></li> 
								<li><a href="AddItems.jsp" class="glyphicon glyphicon-plus-sign"> Add-Items</a></li>
								<li><a href="ShoppingCartAction" class="glyphicon glyphicon-list-alt"> List-Items</a></li>
								<li><a href="#" class="glyphicon glyphicon-folder-open"> Profile</a></li>
							</ul>
						</s:elseif>
						<s:else>
							<a href="Login.jsp"><span class="glyphicon glyphicon-home"/> Login</a>
						</s:else>
					</li>
					<li><a href="Service.jsp"><span class="glyphicon glyphicon-leaf"/> Service</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<span class="glyphicon glyphicon-list"/> Category
						</a>
						
						<ul class="dropdown-menu">
							<li><a href="CategoryAction?category=Model" class="glyphicon glyphicon-plane"> Model</a></li> 
							<li><a href="CategoryAction?category=Electric" class="glyphicon glyphicon-phone"> Electric</a></li>
							<li><a href="CategoryAction?category=Book" class="glyphicon glyphicon-book"> Book</a></li>
							<li><a href="CategoryAction?category=Food" class="glyphicon glyphicon-grain"> Food</a></li>
						</ul>
					</li>
					<li><a href="Contact.jsp"><span class="glyphicon glyphicon-phone-alt"/> Contact</a></li>
				</ul>
			</div>
	
		</nav>
	</div>
	
	
	<div class="container">
		<div class="carousel slide" id="Main-carousel">
			<ol class="carousel-indicators">
				<li data-slide-to="0" data-target="#Main-carousel" class="active"></li>
				<li data-slide-to="1" data-target="#Main-carousel"></li>
				<li data-slide-to="2" data-target="#Main-carousel"></li>
			</ol>
			
			<div class="carousel-inner">
				<div class="item active">
					<img alt="1" src="img/default.jpg" />
					<div class="carousel-caption">
						<h4>
							Pokemon Store Serves Since 2016
						</h4>
						<p>
							Pokemon Store is an online shopping place
						</p>
					</div>
				</div>
				<div class="item">
					<img alt="2" src="img/default2.jpg"/>
					<div class="carousel-caption">
						<h4>
							Best Sales Just In Pokemon Store
						</h4>
						<p>
							50% off for all products in Pokemon Store!
						</p>
					</div>
				</div>
				<div class="item">
					<img alt="3" src="img/default3.png" />
					<div class="carousel-caption">
						<h4>
							Convenient and Cheap
						</h4>
						<p>
							Take what you want home? Just click the mouse
						</p>
					</div>
				</div>
			</div> 
			
			<a class="left carousel-control" href="#Main-carousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left" />
			</a> 
			<a class="right carousel-control" href="#Main-carousel" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"/>
			</a>
		</div>
	</div>
	
	<br><br>
	
	<div class="container">
		<div class="row">
			<s:iterator value="#session.categoryItems" var="itemInfo">
				<div class="col-md-4">
					<div class="thumbnail">
						<img alt="300x200" src="<s:property value='#itemInfo.photoLoc'/>"/>
						<div class="caption">
							<h3>
								<s:property value="#itemInfo.itemName"/>
								<small>$<s:property value="#itemInfo.price"/></small>
							</h3>
							<p><s:property value="#itemInfo.description"/></p>
							<a class="btn btn-primary" name="addToCart" href="#">Cart</a>
							<input type="hidden" value="<s:property value='#itemInfo.itemId'/>"/>
						</div>
					</div>
				</div> 
			</s:iterator>
		</div>
	</div>
	<hr>
	<center>Copyrights@ Pokemon Store</center>
	
	<script type="text/javascript" src="Script/jquery-1.12.3.min.js"></script>
	<script type="text/javascript" src="Bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#Main-carousel").carousel({
				//设置自动播放/3 秒
				interval : 3000,
			});
			
			$("a[name=addToCart]").click(function(){
				var itemId = $(this).next().val();
				var args = {"itemId":itemId, time:new Date()};
				var url = "AddToCartAjax";
				$.post(url, args, function(data){
					if(data != "success"){
						alert("Server Error");
					}
				});
			});
		})
	</script>	
</body>
</html>