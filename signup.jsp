<%@ page import="java.sql.*" %>

<html>
<head>
<style>
	body
	{
		background-image: linear-gradient(to right top, #0d47a1, #10409b, #133a94, #16338e, #182c87, #1c3790, #214299, #274da1, #396cb9, #528bd0, #6faae5, #90caf9);

	}
	.b{
		font-size: 25px;
		border-radius: 8px;
	}
</style>
<script>
		function validate()
		{
			let uid=document.getElementById("uid");
			let uname=document.getElementById("uname");
			let uemail=document.getElementById("uemail");
			let pw1=document.getElementById("pw1");
			if(uid.value=="")
			{
				alert("Userid should not be Empty");
				uid.value="";
				uid.focus();
				return false;
			}
			else if(uname.value=="")
			{
				alert("UserName should not be Empty");
				uname.value="";
				uname.focus();
				return false;
			}
			else if(uemail.value=="")
			{
				alert("UserEmail should not be Empty");
				uemail.value="";
				uemail.focus();
				return false;
			}
			else if(pw1.value=="")
			{
				alert("Password should not be Empty");
				pw1.value="";
				pw1.focus();
				return false;
			}
			else
			{
				true;
			}
		}
	</script>
<title>SignUp Page</title>
<%@include file="allcss.jsp" %>
</head>
<body>
<%@include file="navbar1.jsp" %>

<center><br>

	<h2 style="color:white;"><b><i class="fa fa-user-plus" aria-hidden="true"></i> New User Can SignUp Here..</b></h2><br>

	<form onsubmit="return validate()" method="POST">

	<div style="width:500px;height:500px;border:2px solid white;">
	<br>
	<label for="id"><font size="5" color="white">Enter UserID :</font></label><br>
	<input type="text" name="uid" id="uid" step="any" placeholder="e.g U-01" size="40" autocomplete="off"/>
	<br><br>
	<label for="name"><font size="5" color="white">Enter UserName :</font></label><br>
	<input type="text" name="uname" id="uname" step="any" placeholder="e.g Abc" size="40" autocomplete="off"/>
	<br><br>
	<label for="email"><font size="5" color="white">Enter UserEmail :</font></label><br>
	<input type="email" name="uemail" id="uemail" step="any" placeholder="e.g Abc1@gmail.com" size="40" autocomplete="off"/>
	<br><br>
	<label for="pass"><font size="5" color="white">Enter Password :</font></label><br>
	<input type="password" name="pw1" id="pw1" step="any" placeholder="e.g Abc@123" size="40" autocomplete="off"/>
	<br>

	<br>
	<input type="submit" value="Sign Up" name="btn" class="b"/>
	<br>

	</div>
	</form>
	<%
	if(request.getParameter("btn")!=null)
	{
		String uid=request.getParameter("uid");
		String uname=request.getParameter("uname");
		String uemail=request.getParameter("uemail");
		String pw1=request.getParameter("pw1");
	try
				{
				DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
				String url="jdbc:mysql://localhost:3306/phonebook";
				String un="root";
				String pw="abc123";
				Connection con=DriverManager.getConnection(url,un,pw);
				String sql="insert into userdata values(?,?,?,?)";
				PreparedStatement pst=con.prepareStatement(sql);
				pst.setString(1,uid);
				pst.setString(2,uname);
				pst.setString(3,uemail);
				pst.setString(4,pw1);
				pst.executeUpdate();
				response.sendRedirect("login.jsp");
				con.close();
				}
				catch(SQLException e)
				{
				%>
				<h5 style="color:white;"><u>User already exists ! Please enter valid data...</u></h5> 
				<%
				}
	}
	%>
</center>
</body>
</html>