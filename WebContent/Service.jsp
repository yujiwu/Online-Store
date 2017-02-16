<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1,
		maximum-scale=1, user-scalable=no">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="Bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="Bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
	<title>Service</title>
	<script type="text/javascript" src="Script/jquery-1.12.3.min.js"></script>
	<script type="text/javascript" src="Bootstrap/js/bootstrap.min.js"></script>
	
</head>
<body style="margin:30px">
	<div class="container">
		<div class="row">
			<div class="col-md-12 column">
				<div class="jumbotron">
					<center>
						<h1>
							Welcome to Pokemon Store
						</h1>
						<br><br>
						<p>
							<font color="green">
								In Service section, we provide various methods to serve you  
							</font>							
						</p>
					</center>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-12 column">
				<h3>
					<span class="glyphicon glyphicon-question-sign"> Q&A</span>
					<small> Frequent asked question is listed here</small>
				</h3>
				<div class="panel-group" id="question-session">
					<div class="panel panel-default">
						<div class="panel-heading">
							 <a class="panel-title collapsed" data-toggle="collapse" 
							 	data-parent="#question-session" href="#question1">
							 	How can I get my staff?
							 </a>
						</div>
						<div id="question1" class="panel-collapse in">
							<div class="panel-body">
								We send your products by Federal Express.
							</div>
						</div>
					</div>
					
					<div class="panel panel-default">
						<div class="panel-heading">
							 <a class="panel-title" data-toggle="collapse" 
							 	data-parent="#question-session" href="#question2">
							 	Question2
							 </a>
						</div>
						<div id="question2" class="panel-collapse collapse">
							<div class="panel-body">
								Answer Question here...
							</div>
						</div>
					</div>
					
					<div class="panel panel-default">
						<div class="panel-heading">
							 <a class="panel-title" data-toggle="collapse" 
							 	data-parent="#question-session" href="#question3">
							 	Question3
							 </a>
						</div>
						<div id="question3" class="panel-collapse collapse">
							<div class="panel-body">
								Answer Question here...
							</div>
						</div>
					</div>
					
					<div class="panel panel-default">
						<div class="panel-heading">
							 <a class="panel-title" data-toggle="collapse" 
							 	data-parent="#question-session" href="#question4">
							 	Question4
							 </a>
						</div>
						<div id="question4" class="panel-collapse collapse">
							<div class="panel-body">
								Answer Question here...
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-12 column">
				<h3>
					<span class="glyphicon glyphicon-envelope"> Application</span>
					<small>Save your application about returning products here</small>				
				</h3>
				
				 <a id="modal-226641" href="#modal-container-226641" role="button" class="btn btn-success large" data-toggle="modal">Start</a>
				 <div class="modal fade" id="modal-container-226641" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
								<h4 class="modal-title" id="myModalLabel">
									Type your theme here
								</h4>
							</div>
							<div class="modal-body">
								Type your content here
							</div>
							<div class="modal-footer">
								 <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> 
								 <button type="button" class="btn btn-primary">Save</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	
	</div>

</body>
</html>