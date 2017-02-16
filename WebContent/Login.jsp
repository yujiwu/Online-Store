<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Login</title>
    <link href="Bootstrap/css/bootstrap.min.css" rel="stylesheet">

</head>
<body style="margin:50px">
	
	<div class="container">
		<div class="row">
			<div class="col-md-4"></div> 
			<div class="col-md-4">
				<div class="page-header">
					<h1>
						Sign-in <small style="color:green">Happy Shopping</small>
					</h1>
				</div>
				
				<div class='alert alert-dismissable alert-danger hidden' id="warning">
				 	<button type='button' class='close' data-dismiss='alert' aria-hidden='true'>
			 			<span class='glyphicon glyphicon-off'/>
			 		</button>
					<strong><s:actionmessage/></strong>
			 	</div>
				
				<form action="LoginAction" method="post">
					<div class="form-group">
						<label>Username</label>
						<div></div>
						<input type="text" name="username" class="form-control"/>
					</div>
					<div class="form-group">
						<label>Password</label> 
						<div></div>
						<input type="text" name="password" class="form-control"/>
					</div>
					<div class="form-group">
						<button class="btn btn-primary btn-large">Login</button>
						<a href="Register.jsp" class="btn btn-primary btn-large">Register</a>
					</div>
				</form>
			</div> 
			<div class="col-md-4"></div>
		</div>
	</div>
	
	<script type="text/javascript" src="Script/jquery-1.12.3.min.js"></script>
	<script type="text/javascript" src="Bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(function(){
			if($(".actionMessage span").text() != ""){
				$("#warning").attr("class", "alert alert-dismissable alert-danger");
			}
		})
	</script>
</body>
</html>