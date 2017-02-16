<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Register</title>
    <link href="Bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script type="text/javascript" src="Script/jquery-1.12.3.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$(":input").change(function(){
				//remove the font element in div element
				var $this = $(this);
				$this.prev().find("font").remove();
				var value = $this.val();
				value = $.trim(value);
				if(value != ""){
					if($this.attr("name") == "username" || $this.attr("name") == "email"){
						var args = {"param":value, "type":$this.attr("name"), "time":new Date()};
						var url = "RegisterAjax"
						$.post(url, args, function(data){
							if(data == 1){
								$this.prev().append("<font color='green'>"+ $this.attr('name')+ " is available</font>");
							}else if(data == 0){
								$this.prev().append("<font color='red'>"+ $this.attr('name')+ " is used</font>");
							}else{
								$this.prev().append("<font color='red'>Server Error</font>");
							}
						});
					}
				}else{
					$this.prev().append("<font color='red'>"+$this.attr("name")+" cannot be empty</font>");
				}
			});
		})
	</script>	
</head>
<body style="margin:50px">

	<div class="container">
		<div class="row">
			<div class="col-md-4"></div> 
			<div class="col-md-4">
				<div class="page-header">
					<h1>
						Register <small style="color:pink">Happy Shopping</small>
					</h1>
				</div>
			
				<form action="RegisterAction" method="post">
					<div class="form-group">
						<label>Username</label>
						<div><font color="red"><s:fielderror fieldName="username"></s:fielderror></font></div>
						<input type="text" name="username" class="form-control"/>
					</div>
					<div class="form-group">
						<label>Password</label> 
						<div><font color="red"><s:fielderror fieldName="password"></s:fielderror></font></div>
						<input type="text" name="password" class="form-control"/>
					</div>
					<div class="form-group">
						<label>Role</label>
						<select class="form-control" name="role">
						    <option>Customer</option>
						    <option>Seller</option>
						</select>
					</div> 
					<div class="form-group">
						<label>Email</label> 
						<div><font color="red"><s:fielderror fieldName="email"></s:fielderror></font></div>
						<input type="email" name="email" class="form-control"/>
					</div>
					<div class="form-group">
						<button class="btn btn-primary btn-large">Submit</button>
					</div>
				</form>
			</div> 
			<div class="col-md-4"></div>
		</div>
	</div>
	
	
</body>
</html>