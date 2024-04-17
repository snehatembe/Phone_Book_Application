<%@ page import="java.sql.*" %>
<html>
<head>
<style>
	body
	{
		background-image: linear-gradient(to right top, #1a237e, #3152a3, #5580c3, #84afe0, #bbdefb);

	}
	.b{
		font-size: 25px;
		border-radius: 8px;
	}
	p1{
        	margin: 50px 50px 50px 50px;
		padding: 8px 8px 10px 10px;
   	}
</style>
<script>
		function validate()
		{
			let pid=document.getElementById("pid");
			let pname=document.getElementById("pname");
			let pno=document.getElementById("pno");
			let pemail=document.getElementById("pemail");
			let city=document.getElementById("city");
			let bdate=document.getElementById("date");
			if(pid.value=="")
			{
				alert("PID should not be Empty");
				pid.value="";
				pid.focus();
				return false;
			}
			if(pname.value=="")
			{
				alert("Person name should not be Empty");
				pname.value="";
				pname.focus();
				return false;
			}
			else if(pname.value.length <2)
			{
				alert("Length of Person Name should be more than 1 letter");
				pname.value="";
				pname.focus();
				return false;
			}
			else if(! pname.value.match(/^[A-Za-z ]+$/))
			{
				alert("Person Name is Invalid");
				pname.value="";
				pname.focus();
				return false;
			}
			else if(pno.value=="")
			{
				alert("Phone Number should not be Empty");
				pno.value="";
				pno.focus();
				return false;
			}
			else if(pno.value<=0)
			{
				alert("Phone number sholud be positive Number Only ");
				pno.value="";
				pno.focus();
				return false;
			}
			
			else if(pemail.value=="")
			{
				alert("PersonEmail should not be Empty");
				pemail.value="";
				pemail.focus();
				return false;
			}
			else if(city.value=="")
			{
				alert("City should not be Empty");
				city.value="";
				city.focus();
				return false;
			}
			else if(! city.value.match(/^[A-Za-z]+$/))
			{
				alert("City Name is Invalid");
				city.value="";
				city.focus();
				return false;
			}
			else if(city.value.length <2)
			{
				alert("Length of City Name should be more than 1 letter");
				city.value="";
				city.focus();
				return false;
			}
			if(bdate.value=="")
			{
				alert("BirthDate should not be Empty");
				bdate.value="";
				bdate.focus();
				return false;
			}
			else
			{
				true;
			}
		}
	</script>
<title>Update page</title>
<%@include file="allcss.jsp" %>
</head>
<body>
<%@include file="navbar.jsp" %>

<center>

	<h2 style="color:white;"><b><i class="fa fa-id-card" aria-hidden="true"></i> Update PhoneNo in Your PhoneBook</b></h2>

	<form onsubmit="return validate()" method="POST">
	<div style="width:550px;height:630px;border:2px solid white;">
	<label for="id"><font size="4" color="white">Enter PID :</font></label><br>
	<input type="number" name="pid" id="pid" step="any" placeholder="e.g 12" size="40" autocomplete="off"/>
	<br><br>
	<label for="id"><font size="4" color="white">Enter Person Name :</font></label><br>
	<input type="text" name="pname" id="pname" step="any" placeholder="e.g ABC" size="40" autocomplete="off"/>
	<br><br>
	<label for="name"><font size="4" color="white">Enter Phone number :</font></label><br>
	<input type="text" name="pno" id="pno" step="any" pattern="[7-9]{1}[0-9]{9}" placeholder="10 digit PhoneNo Start With 7,8,or 9" size="40" autocomplete="off" required/>
	<br><br>
	<label for="email"><font size="4" color="white">Enter UserEmail :</font></label><br>
	<input type="email" name="pemail" id="pemail" step="any" placeholder="e.g Abc1@gmail.com" size="40" autocomplete="off" />
	<br><br>
	<label for="pass"><font size="4" color="white">Enter City :</font></label><br>
	<input type="text" name="city" id="city" step="any" placeholder="e.g Thane" size="40" autocomplete="off"/>
	<br><br>
	<label for="pass"><font size="4" color="white">Enter BirthDate :</font></label><br>
	<input type="date" name="bdate" id="bdate" step="any" size="40" autocomplete="off" required/>
	<br>
	<br>
	<input type="submit" value="Update" name="btn1" class="b"/>
	<br>
	</div>
	</form>

<%
		if(request.getParameter("btn1")!=null)
				{
					int pid=Integer.parseInt(request.getParameter("pid"));
					String pname=request.getParameter("pname");
					String pno=request.getParameter("pno");
					String pemail=request.getParameter("pemail");
					String city=request.getParameter("city");
					String bdate=request.getParameter("bdate");	
				try
				{
				DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
				String url="jdbc:mysql://localhost:3306/phonebook";
				String un="root";
				String pw="abc123";
				Connection con=DriverManager.getConnection(url,un,pw);
				String sql="update phonedata set pid=?,pname=?,pno=?,pemail=?,city=?,bdate=?,uid=? where pid= "+pid;
				String sql1="select * from phonedata where pid=?";
				PreparedStatement pst=con.prepareStatement(sql);
				PreparedStatement pst1=con.prepareStatement(sql1);
				pst.setInt(1,pid);
				pst.setString(2,pname);
				pst.setString(3,pno);
				pst.setString(4,pemail);
				pst.setString(5,city);
				pst.setString(6,bdate);
				pst.setString(7,uid);
				pst.executeUpdate();
				pst1.setInt(1,pid);
				ResultSet rs=pst1.executeQuery();
				if(rs.next()){
					request.getSession().setAttribute("phonedata",pid);
%>
				<h5 class="text-center" style="color:white; position: absolute;bottom: 20px;right:600;"><i class="fa fa-check-square-o" aria-hidden="true"></i>&nbsp;PhoneInfo is Updated Succesfully</h5> 
<%
					}
				else{
%>
				<h5 class="text-center" style="color:white; position: absolute;bottom: 20px;right:600;"><i class="fa fa-window-close" aria-hidden="true"></i>&nbsp;This PhoneID does not exist !</h5> 
<%
					}
				con.close();
				}
				catch(SQLException e)
				{
					out.println("Iuuse:  "+e);
			%>
				<h5 class="text-center" style="color:white;"><u>Something went's wrong ! Please enter valid data...</u></h5> 
			<%
				}
			}
			%>

</center>
</body>
</html>