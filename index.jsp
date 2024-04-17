<html>
<head>
<style>
	body
	{
		background-image: url("computer-1231889_1920.jpg");
		background-repeat: no-repeat;
		background-size:1550px 745px;

	}
	p
	{
		text-align:center;
		font-size:45px;
		color:white;

	}
	p1
	{
	text-align:center;
	font-size:20px;
	color:white;
	}
</style>

<title>index page</title>
<%@include file="allcss.jsp" %>
</head>
<body>
	<%@include file="navbar1.jsp" %>

	<p><b><i class="fa fa-phone-square" aria-hidden="true"></i>  PhoneBook Application</b></p>
	<center>
	<p1><i>"A book that lists the names, addresses, and phone numbers of the people and <br>businesses in a certain area."</i></p1><br>
	<p1><i><b>Save Numbers of Your Favorite Person.</b></i></p1>
	</center>
	<br>
	<br>
	<center>
	<a href="login.jsp" class="btn btn-light my-2 my-sm-0 mr-2" type="submit"><i class="fa fa-user" aria-hidden="true"></i> Login</a>
	<a href="signup.jsp" class="btn btn-light my-2 my-sm-0 mr-2" type="submit"><i class="fa fa-user-plus" aria-hidden="true"></i> SignUp</a>
	</center>
</body>
</html>